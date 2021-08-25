//
//  userCell.swift
//  iPayBF
//
//  Created by Maysa on 06/08/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var UserImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func setup (value: User?){
       
       if let _value = value {
           self.nameLabel.text = _value.name
          self.UserImageView.image = UIImage (named: _value.imageName)
       }
   }
}
