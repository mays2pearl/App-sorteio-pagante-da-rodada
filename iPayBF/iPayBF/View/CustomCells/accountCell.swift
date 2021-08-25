//
//  accountCell.swift
//  iPayBF
//
//  Created by Maysa on 09/08/21.
//

import UIKit

class accountCell: UITableViewCell {

    @IBOutlet weak var tipoComida: UIImageView!   
    @IBOutlet weak var nomeComida: UILabel!
    @IBOutlet weak var valorComida: UILabel!
    @IBOutlet weak var quantidade: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup (value: account?){
        
        if let _value = value {
            
            self.tipoComida.image = UIImage(named: _value.productType ?? "")
            self.nomeComida.text = _value.name
            self.valorComida.text = "R$ \(_value.price ?? 0)"
            self.quantidade.text = "\(_value.quantity ?? 0)"
        }
    }
}
