//
//  CustomTableViewCell.swift
//  2. ResizingCells
//
//  Created by Michael Babiy on 10/17/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
