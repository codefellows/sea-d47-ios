//
//  NewStatusViewController.swift
//  Delegation
//
//  Created by Michael Babiy on 11/5/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

protocol NewStatusViewControllerDelegate {
    
    func newStatusViewControllerDidFinishWith(status: Status)
    
}

class NewStatusViewController: UIViewController {

    @IBOutlet weak var newStatusTextView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var datasource: [Status]?
    
    var delegate: NewStatusViewControllerDelegate?
    
    class func identifier() -> String {
        return "NewStatusViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestureRecognizers()
        self.newStatusTextView.becomeFirstResponder()
    }
    
    func setupGestureRecognizers() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleTapGesture(gesture: UIGestureRecognizer) {
        print("Image tapped...")
    }

    @IBAction func saveButtonSelected(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.newStatusViewControllerDidFinishWith(Status(text: self.newStatusTextView.text))
        }
        
    }
}
