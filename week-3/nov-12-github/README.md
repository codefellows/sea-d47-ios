Thursday - nov-11 Github Client
===============================

# Lecture Slides

# Github Client
* Create a UserSearchViewController that searches for users, similar to how we are already searching for repositories. Instead of a table view, use a collection view to display the users avatar image.
* Upon clicking on a cell, implement a custom transition, and transition the image clicked on to a UserDetailViewController page that has their picture, name, and whatever other info you want pulled from their API.
* Implement Regex in your app. Use it to validate the characters the user types into the search bar. Extend String with this functionality.
* Implement WKWebView in your app. When a user clicks on a repo, show their repo's web page with WKWebView.
* Code Challenge: Given a string, return a string where for every char in the original, there are two chars. 
* Example: doubleChar("The") → "TThhee"

# Coding Challengs
* Implement the 'My Profile' view controller in your app. This should display info about the currently logged in user (their bio, if they are hirable, their count of public and private repos, etc).
* Implement a way for the logged in user to create a repo from the app. Good luck and god bless.
* Implement a way for the user to update their bio.
* Create a reverse custom transition going from the user detail VC back to the user search VC
