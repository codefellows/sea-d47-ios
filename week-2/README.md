Week 2 - Sortagram
==================
# [Monday - nov-2](nov-2-sortagram/)
[nov-2-sortagram](nov-2-sortagram/)

* **SUPER IMPORTANT:** Download Parse's swift starter project and use it for your week 2 app. This comes with Parse's SDKs preinstalled. Here is the link:
* https://www.parse.com/apps/quickstart#parse_data/mobile/ios/swift/new (Links to an external site.)
* Layout an Image view in the center of the screen using autolayout. Give it a ratio of 80% the super views width and height.
* Use the UIImagePickerController and its delegate to use the camera to set the image view’s image. Add a button on top of the UIImageView that brings up ActionController if the device supports Camera and Photo Library, if not, simply present Photo library.
* BONUS: post action in the action controller that successfully uploads the current imageview’s image up to your Parse backend.
Code Challenge: Write a function that determines how many words there are in a sentence

# [Tuesday - nov-3](nov-3-sortagram/)
[nov-3-sortagram](nov-3-sortagram/)
* Make sure you resize the image to something more suitable for a network upload before you post the image (600 * 600 should be okay) and populate imageView.
* Create an action controller that has 3 - 4 different filters. This action controller should be presented by the tap of a button in the bottom center of the initial view controller.
* Create FilterService class to generate / give you available filters.
* Create at least 3 different filter methods on your FilterService class  that filters the imageView’s image with the selected filter.
* Code Challenge: Write a function that returns all the odd elements of an array
* Bonus:
 * Add two extra filters 
 * Build model object to house image and metadata to create Parse object when the user hits publish.
