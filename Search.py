# 8/8/22 Functional and Working. May have to change file and class name bc too generic and might run into conflicts with other libraries.

from selenium import webdriver 
from selenium.webdriver import Chrome
from webdriver_manager.chrome import ChromeDriverManager 
from selenium.webdriver.common.keys import Keys 

driver = webdriver.Chrome(ChromeDriverManager().install())
url = ("https://www.google.com")
driver.get(url)
driver.implicitly_wait(5)

# first call with: Search("something")
# Made into a class so you couldn't call results without first running a search
class Search:
    def __init__(self, search):
        self.search = driver.find_element_by_xpath("//*[@title = 'Search']").send_keys(search, Keys.ENTER)
    

# call with: Search.topResult()
    def topResult():
        try:
            result = driver.find_element_by_xpath("//*[@id='rso']//*/a")
            URL = (result.get_attribute("href"))    #--- STR unclickable
            return result, URL   # ---- result won't be in human terms and is not URL anyway, hence a return AND print statement
                                    # returns a tuple, to access individually use indices as seen in go()
            
        except:
            print("failed to return results")

# call with: Search.go(Search.topResult())
    def go(x):
        x[0].click()
