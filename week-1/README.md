Week 1 - Twitter Clone
====================
# Monday - oct-26
[oct-26-twitter-clone]
* Create your MVC groups
* Create your Tweet class and your TweetJSONParser class
* In addition to the text & id property, add properties for the username, and profileImageURL ( all string types)
* Parse the json file into tweets, make sure all properties on each tweet are being set. All parsing should be done in your TweetJSONParser class.
* Display those tweet objects in the table view, just the text for the tweet is fine today
* CODING CHALLENGE: Write a function that reverses an array

# Tuesday - oct-27
[oct-27-twitter-clone]
* Use the Accounts framework to access the user's twitter account on their iOS device
* Use the Social framework to make a request to twitter for the users home timeline
* Use a ranged switch statement to make sure the status code of the response is good
* Reload the table view on the main thread (aka main queue) once you are done parsing the JSON data from the response
* Show the downloaded tweets on your table view
# Wednesday - oct-28
[oct-28-twitter-clone]
* Setup your cells with autolayout so you can see the entire tweets text. If you get any .... at the end that is probably twitters API being stupid
* Create a 2nd view controller that shows an individual tweet in detail
* Upon clicking a tweet, your interface should push (which means you need a navigation controller) to the 2nd view controller and display the tweet selected, but with a few caveats:
* If the tweet that was selected is a retweet, show the original tweet and the original user
* All of this information is available in the original JSON, you just have to go digging for it, and then add properties to your Tweet class accordingly.

# Thursday - oct-29
[oct-29-twitter-clone]
*  Lazily download the user profile images for each tweet you display.
* In your single tweet view controller, upon clicking on the person's image (hint: change the image view to a button, buttons can have images) the app should push a 3rd view controller onto the stack
* This 3rd view controller will show that user's timeline (the api url is "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name" but you will need to add a parameter to this url.
* Use a table view header view to mimic Twitter's layout of that screen (show their profile background image, their picture, their name, their location)
* Convert your table view cells to use a Nib, so you can share the same cell for both the home time line VC and the user Timeline VC
