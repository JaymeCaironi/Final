//
//  FavoritosTableViewCell.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 05/03/21.
//

import UIKit

class FavoritosTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var fotoFilme: UIImageView!
    @IBOutlet weak var nomeFilme: UILabel!
    @IBOutlet weak var descricaoFilme: UILabel!
    @IBOutlet weak var anoFilme: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
