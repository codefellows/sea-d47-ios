/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addImageButtonSelected(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            self.presentActionSheet()
        } else {
            self.presentImagePickerFor(.PhotoLibrary)
        }
    }
    
    @IBAction func uploadImageButtonSelected(sender: UIButton) {
        
        sender.enabled = false
        
        if let image = self.imageView.image {
            API.uploadImage(image) { (success) -> () in
                if success {
                    sender.enabled = true
                    self.presentAlertView()
                }
            }
        }
    }
    
    func setupAppearance() {
        self.imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.imageView.layer.borderWidth = 0.6
    }
    
    func presentActionSheet() {
        let alertController = UIAlertController(title: "", message: "Please choose your source.", preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentImagePickerFor(.Camera)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.presentImagePickerFor(.PhotoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func presentAlertView() {
        let alertController = UIAlertController(title: "", message: "Image successfully uploaded.", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func presentImagePickerFor(sourceType: UIImagePickerControllerSourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerController Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
