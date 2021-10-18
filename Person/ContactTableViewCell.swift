//
//  ContactTableViewCell.swift
//  Person
//
//  Created by Awais on 18/10/2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameContact: UILabel!
    @IBOutlet weak var designationContact: UILabel!
    @IBOutlet weak var ageContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
