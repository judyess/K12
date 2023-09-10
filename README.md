# K12

Personal Project for work, similar to the "macro-express" project but actually automated the process of finding info and filling the spreadsheet.
This was the second project I made using Selenium. First project using Google APIs, USAddress library (now defunct), and PygSheets.
I used it for a marketing assignment to find contact info for the Student Resources department for all K12 schools in every state.
I worked off of a Google Sheets document that had a list of schools all over the country that I had to get information for. (addresses, points-of-contact, numbers, etc)


Differences between this and "macro-express":
1. This was the actual code that I used to work on the marketing assignment,
     "Macro-Express" was just a stripped down version of this project for the purpose of sharing it with my coworkers in a way that didn't require them to deal with any code.
3. Steps through the school names to remove/replace certain key words to make sure I would (almost) always get a valid address.
     This was a cool part because the first time I tested it out, I was able to get hundreds of addresses at a time.
4. One state had a website that had the information I needed for every school in the state, so there is code that only works with that one specific website.
   A. The code was written to match how they had information listed (which was very uniform and super cool of them to do).
   B. It targeted very specific HTML elements. Which was also my first experience with that.
   C. and it was awesome because after I was done, I watched all of the fields populate automatically for every school in that state. (not just addresses)

Stopped using when USAddress became a dead library, and because there were concerns about using code to find information. (although no issues were ever found)
  which is when I wrote a stripped down version of this project (Macro-Express) to just auto-populate fields with information I found manually, one-by-one. -_-

Also, because using the Google Maps API cost money after a certain number of requests and the marketing project had about 25,000 schools to pull addresses for and I'm poor.

 The parts of this project that survived and lived on through "Macro-Express" were the abilities to automatically pull up Google and search for the school based on which row I was on, 
     populate specific fields in the spreadsheet with whatever text I had highlighted, 
     and to also switch between windows and step through the spreadsheet with the push of a button. (using macros written with AHK tied to Python functions).
     
But this was the coolest project I've ever written (at the time) and I learned a lot from it.
