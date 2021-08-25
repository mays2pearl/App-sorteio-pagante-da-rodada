//
//  historicoCell.swift
//  iPayBF
//
//  Created by Maysa on 08/08/21.
//

import UIKit

class historicoCell: UITableViewCell {
    
    @IBOutlet weak var nomeEstabelecimento: UILabel!
    
    @IBOutlet weak var totalValor: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup (value: historico?){
        
        if let _value = value {
            self.nomeEstabelecimento.text = _value.name
            self.totalValor.text = "R$ \(_value.price ?? 0)"
            
        }
    }
}
