import pandas as pd
from geopy.geocoders import GoogleV3
import googlemaps
import usaddress
import pygsheets

from selenium import webdriver #Selenium 3, 4, original
from selenium.webdriver import Chrome
from webdriver_manager.chrome import ChromeDriverManager #Selenium 3
from selenium.webdriver.common.keys import Keys 

import Search # my module
import MainK12 # rename files and import properly

driver = webdriver.Chrome(ChromeDriverManager().install())


#PygSheets Access to Google Sheets 
client = pygsheets.authorize(service_account_file='credentials.json')

# GeoPy Access to Googlemaps
api = "API"
url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
geolocator = GoogleV3(api_key = api)

# General access
K12 = "LINK"
sheet = client.open_by_url(K12)
wks = sheet.worksheet_by_title('Sheet1')

#for USAddress and GeoPy
address1tags = [
   'AddressNumber',
   'AddressNumberPrefix',
   'AddressNumberSuffix',
   'StreetName',
   'StreetNamePreDirectional',
   'StreetNamePreModifier',
   'StreetNamePreType',
   'StreetNamePostDirectional',
   'StreetNamePostModifier',
   'StreetNamePostType',
   'CornerOf',
   'IntersectionSeparator',
   'LandmarkName',
   'USPSBoxGroupID',
   'USPSBoxGroupType',
   'USPSBoxID',
   'USPSBoxType']

#========================================================================

row = None

# ---------------------------------------------- Strips Column A entries of certain words that caused KY's website to find 0 results.
def search():
    global row
    #row = 3575
    
    try:
        url = ("https://openhouse.education.ky.gov/Directory/Search")
        driver.get(url)
        driver.implicitly_wait(5)

        school = wks.get_value((row,1))
        #school = wks.get_value((3575,1))
        print(school)

        #TO-DO: PUT IN LIST OF WORDS TO REPLACE INSTEAD. IF String == Word in list -> Replace.
"""
replace = ["District", "Schools", "School", "Public", "City"]



"""
        try:
            school = school.replace("District", "")
            try:
                school = school.replace("Schools", "")
                try:
                    school = school.replace("School", "")
                    try:
                        school = school.replace("Public", "")
                        try:
                            school = school.replace("City", "")
                        except:
                            print(school)            
                    except:
                        print(school)
                except:
                    print(school)
            except:
                print(school)

        except:
            print("School name error")
                       

        search = driver.find_element_by_id("search").send_keys(school)
        
        submit = driver.find_element_by_class_name("search").submit()

        driver.implicitly_wait(5)
        try:
            driver.find_element_by_xpath("//*[@id='districtGrid']/table/tbody/tr/td/a").click()         # WEBSITE SPECIFIC
        except:
            print("District result error")

        read()
    except:
        print("error")



# ---------------------------------------------- Website specific    
def readHTML():
    website = driver.current_url
    address1 = ""
    address = driver.find_element_by_xpath("/html/body/div[1]/div[2]/div[2]/div[1]/p")
    print(address.text)
    addr1 = address.text.split('\n')
    result = usaddress.tag(address.text)
    taggedAddress = result[0]

    
    for key in taggedAddress:
        taggedAddress[key] = taggedAddress[key].replace('\n', '')
        if key in address1tags:
            address1 = address1 + taggedAddress[key] + " "
            
    city = taggedAddress['PlaceName']
    zipcode = taggedAddress['ZipCode']
    #print(address1, cityy, zipcodee)

    
    update_address1(address1)          #ADDRESS1
    
    driver.implicitly_wait(5)
    update_city(city)             #CITY
    
    driver.implicitly_wait(5)
    update_zipcode(zipcode)       #ZIPCODE
    

#Renamed address2 --- might have overlap and cause errors. Check.
    address2 = ""
    address2 = driver.find_element_by_xpath("/html/body/div[1]/div[2]/div[2]/div[2]/p")
    address2 = address2.text.split('\n')
    print(address2)

    if address1[0] == address2[1]:
        print("Address2: NULL")   
    else:
        address2 = address2[1]
        print(address2)
        update_address2(address2)      #ADDRESS2
    
    try:
        fullname = driver.find_element_by_xpath("//*[@id='divDistrictContacts']/table/tbody//tr//td[text()='Director of Special Education']/following-sibling::td")
        fullname = fullname.text
        fullname = fullname.split()
        
        firstname = fullname[0]
        lastname = fullname[-1]
        print(firstname, lastname)
        update_first(firstname)    #FIRST
        update_last(lastname)      #LAST
    except:
        print("failed to get name")

          
    try:
        email = driver.find_element_by_xpath("//*[@id='divDistrictContacts']//*[text()='Director of Special Education']/following-sibling::td/a/img")      
        email = email.get_attribute("title")
        print(email)
        update_email(email)        #EMAIL
        
    except:
        print("failed to get email")

         
    try:
        phone = driver.find_element_by_xpath("/html/body/div[1]/div[2]/div[2]/div[3]/p[1]")
        phone = phone.text
        phone = phone.split('\n')
        phone = phone[0]
        
        phone = phone.strip('Phone: ')
        print(phone)
        update_phone(phone)           #PHONE
    except:
        print("failed to get phone number")

    print(website)

# ---------------------------------------------- 

def find(r):
    #global loc, row, address1, city, zipcode
    address1 = ""
    row = r
    x = wks.get_value((row,1))
    print(x)
    x = x.replace("District", "address")
    loc = geolocator.geocode(x)
    #print(loc)

    if loc != None:
        result = usaddress.tag(loc.address)
        if result[1] == "Street Address":
            addr = result[0]
            for y in addr:
                if y in address1tags:
                    address1 = address1 + addr[y] + " "
            city = addr['PlaceName']
            zipcode = addr['ZipCode']
            update(row, address1, city, zipcode)
            
# ---------------------------------------------- 

def tag(x):
    #global address1, city, zipcode
    result = usaddress.tag(x.address)
    if result[1] == "Street Address":
        addr = result[0]
        for y in addr:
            if y in address1tags:
                address1 = address1 + addr[y] + " "
        city = addr['PlaceName']
        zipcode = addr['ZipCode']
        update(row, address1, city, zipcode)

# ---------------------------------------------- Manually update fields with arguments.

def update(r,x,y,z):
    row = r
    address1 = x
    city = y
    zipcode = z
    wks.update_value((row,2), address1)
    wks.update_value((row,4), city)
    wks.update_value((row,6), zipcode)


# ---------------------------------------------- 
def temp():
    for i in range(3580, 3649):
        getrow(i)
        dept("Special Education")
        title("Director of Special Education")
    print("ok")
    

    

main()

