//
//  FilmesTableViewCell.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 06/03/21.
//

import UIKit

class FilmesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var fotoFilme: UIImageView!
    
    @IBOutlet weak var nomeFilme: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
