App that simulates the search of Google and returns a list of definitions

Made with
  React
  Ruby
  Postgres(live), sqlite(local)
  Rspec
  RailsAdmin(to manage db)

Live Url
https://mysterious-plains-22315.herokuapp.com/

Specifications
1. The user can enter a word into a text box on the search page.
2. When the user clicks the search button an Ajax or Axios request is made to retrieve the definition(s) for the entered word.
3. The controller that handles the Ajax/Axios request searches the database for the word.  If the word exists in the database then the controller will return the definition(s) for that word from the local database.  If the word is not present in the database then the controller will make a call to the dictionary API (http://www.dictionaryapi.com/api/v1/references/collegiate/xml/) to retrieve the definition(s) for the entered word.
4. If the word did not exist in the database then the definition(s) retrieved from the dictionary API should be saved to the database to speed up future searches for the same word.
5. If the word does not exist in both the local database and the dictionary API then an appropriate message should be displayed to the user.
6. Rails admin should be used to allow an admin user to view/add/edit and delete words and their associated definitions
