import Search # my module

import pygsheets


client = pygsheets.authorize(service_account_file='credentials.json')

# General access
K12 = "LINK"
sheet = client.open_by_url(K12)
wks = sheet.worksheet_by_title('Sheet1')


#========================================================================
row = None

# ---------------------------------------------- MAIN
def main():
    global row

    load()
    print("ready")
    

# ---------------------------------------------- Update field functions


    
def update_address1(x):                
    wks.update_value((row,2), x)

def update_address2(x):
    wks.update_value((row,3), x)

def update_city(x):
    wks.update_value((row,4),x)

def update_zipcode(x):
    wks.update_value((row,6),x)

def update_site(x):
    wks.update_value((row,7), x)

def update_dept(x):
    wks.update_value((row, 8), x)

def update_isDoctor():
    x = 'Dr'
    wks.update_value((row,9), x)

def update_first(x):
    wks.update_value((row,10), x)

def update_last(x):
    wks.update_value((row, 11), x)

def update_title(x):
    wks.update_value((row, 12), x)

def update_email(x):
    wks.update_value((row, 13), x)

def update_phone(x):
    wks.update_value((row,14), x)

def update_ext(x):
    wks.update_value((row,15), x)

def update_note(x):
    wks.update_value((row, 17), x)
    


# ----------------------------------------------
# Reads Cell(row, A)
# Returns school
def read_District():
    global row
    value = wks.get_value((row,1))
    return(str(value))
    
# ----------------------------------------------
# Reads Cell(row, E)
# RETURNS state
def read_State():
    global row
    value = wks.get_value((row,5))
    return(str(value))


# ----------------------------------------------     
def save():
    global row
    f = open("K12save.txt", "w")
    txtrow = str(row)
    f.write(txtrow)
    f.close()
    print("Saved.")

# ---------------------------------------------- 
def load():
    global row
    f = open("K12save.txt", "r")
    row = f.read()
    row = int(row)
    print("Load Complete.")

# ---------------------------------------------- Return the current value of 'row'
# renamed getrow() => setRow
def setRow(x):
    global row
    row = x
    save()

# ---------------------------------------------- Increment the value of 'row' by 1
# renamed next() => nextRow
def nextRow():
    global row
    row += 1
    save()
    setRow(row)


# ---------------------------------------------- NEW
def formatSearch(x):
    x = x + " special education " + read_State()
    return str(x)

# ---------------------------------------------- 
def nav():
    global row
  
    value = formatSearch(read_District())
    
    try:
        Search(value)
        URL = Search.topResult()[1]
        try:
            update_site(URL)
            print(URL)
        except:
            print("site error")
        Search.go(Search.topResult())
    except:
        print("function error")
