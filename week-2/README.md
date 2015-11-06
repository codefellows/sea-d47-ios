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


# [Wednesday - nov-4](nov-4-collection-view-demo/)
[nov-4-collection-view-demo/](nov-4-collection-view-demo/)
* Create a GalleryViewController with a collection view designed to show a bunch of photos.
* Add a collection view to the interface.
* Build a simple collection view layout.
* Build a call to Parse to get all images uploaded yesterday and populate the collection view.
* Use property observers to set collection view cell's imageviews, when downloaded (lazy load images)
* Code Challenge: Write a function that computes the list of the first 100 Fibonacci numbers.

# [Thursday- nov-5](nov-5-photo-framework/)
[nov-5-photo-framework/](nov-5-photo-framework/)
* Implement collection view on the HomeViewController to display all available filters already pre-applied on a thumbnail.
* Show / Hide filter collection view in place of ActionSheetController.
* Selecting a filtered thumbnail applies that filter to the current Image in the primary image view.
* Add a pinch gesture recognizer to the GalleryViewController, which decreases/increases the item size upon pinching (use the scale property of the recognizer). Change layout interactively.
* Create a custom protocol and delegate in order to communicate back image selection from GalleryViewController to the HomeViewControllerfor editing.

