
Specification
1. The user can enter a word into a text box on the search page.
2. When the user clicks the search button an Ajax or Axios request is made to retrieve the definition(s) for the entered word.
3. The controller that handles the Ajax/Axios request searches the database for the word.  If the word exists in the database then the controller will return the definition(s) for that word from the local database.  If the word is not present in the database then the controller will make a call to the dictionary API (http://www.dictionaryapi.com/api/v1/references/collegiate/xml/) to retrieve the definition(s) for the entered word.
4. If the word did not exist in the database then the definition(s) retrieved from the dictionary API should be saved to the database to speed up future searches for the same word.
5. If the word does not exist in both the local database and the dictionary API then an appropriate message should be displayed to the user.
6. Rails admin should be used to allow an admin user to view/add/edit and delete words and their associated definitions
7. The site should be deployed to heroku and should be FREE
8. The code should be stored in private Github repository as part of the Instant Ink Github
 
See https://gemini-learning-app.herokuapp.com/ or https://gemini-doogle-app.herokuapp.com/ for an example of how the site should look and what the user should experience. Feel free to get creative with the implementation, as long as the basic functionality works.