Tuesday Oct 27
==============

# Readings
* [ACAccounts Framework: working with the accounts store](https://developer.apple.com/library/prerelease/mac/documentation/Accounts/Reference/ACAccountStoreClassRef/index.html#//apple_ref/occ/cl/ACAccountStore)
* [Social Framework: accessing social network services](https://developer.apple.com/library/prerelease/ios/documentation/Social/Reference/Social_Framework/index.html#//apple_ref/doc/uid/TP40012233)
* [Social Framework: describes URL Request to post a Social networking Service](https://developer.apple.com/library/prerelease/ios/documentation/Social/Reference/SLRequest_Class/index.html#//apple_ref/occ/cl/SLRequest)

# Lecture Slides
* Closures
* Accounts & Social Frameworks
* Callbacks
* Concurrency
* HTTP Status Codes
* Swift Swiftch Statements

# Twitter Clone
* Use the Accounts framework to access the user's twitter account on their iOS device
* Use the Social framework to make a request authenticate the user
* Use the Social framework to make a request to twitter for the users home timeline
* Use a ranged switch statement to make sure the status code of the response is good
* Reload the table view on the main thread (aka main queue) once you are done parsing the JSON data from the response
* Show the downloaded tweets on your table view

# CODING CHALLENGE: FIZZ BUZZ!! :
 * Print the numbers 1..100
 * For multiples of 3, print "Fizz" instead of the number
 * For multiples of 5, print "Buzz" instead of the number
 * For multiples of 3 and 5, print "FizzBuzz" instead of the number
