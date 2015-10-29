//
//  HeaderView.swift
//  2. ResizingCells
//
//  Created by Michael Babiy on 10/17/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    class func view() -> UIView {
        return UINib(nibName: "HeaderView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

}
