# Thursday Oct 29

# Lecture Slides
* Lazy Loading
* TableView HeaderView
* Nibs/Xib's
* Image Assets
* Resizing Images
* Queue Data Structure 

# Twiter Clone
*  Lazily download the user profile images for each tweet you display.
* In your single tweet view controller, upon clicking on the person's image (hint: change the image view to a button, buttons can have images) the app should push a 3rd view controller onto the stack
* This 3rd view controller will show that user's timeline (the api url is "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name" but you will need to add a parameter to this url.
* Use a table view header view to mimic Twitter's layout of that screen (show their profile background image, their picture, their name, their location)
* Convert your table view cells to use a Nib, so you can share the same cell for both the home time line VC and the user Timeline VC

# CODING CHALLENGE
*  Given a string, return a version where all the "x" have been removed. Except an "x" at the very start or end should not be removed. 

#  DATA STRUCTURE THURSDAY
* Implement a queue.

# Extra Challenges

* Harness the power of the since_id parameter on your api calls. The since_id gives you tweets that are more recent than the id you pass in as the since_id. Combine this, with pull to refresh, to let the user refresh their timelines with the latest tweets.Use the max_id parameter. This is similar to since_id, except it gives you tweets older than the id provided as the max_id. So as the user scrolls towards the bottom of the table view, use the max_id to pull down more tweets. You can basically achieve infinite scrolling with this.Implement a UITabBarController as the root VC of your app, and add a second tab, which is a view controller for displaying the current user's profile (check twitter's app for reference)Implement an image cache so you never download the same image twiceTwitter's api allows you to download larger images if you request it. Try to get this to work so our images don't look so blurry on retina screens. You will have to go digging through Twitter's API docs to find how this works.

