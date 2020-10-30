//
//  SecondTableViewCell.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellWith(image: UIImage, with name: String) {
        infoImage.image = image
        infoLabel.text = name
    }
    
    override func prepareForReuse() {
        infoImage.image = nil
        infoLabel.text = nil
    }
   

}
