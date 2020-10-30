//
//  NewTableViewCell.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageofUser: UIImageView!
    @IBOutlet weak var labelOfUser: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageofUser.layer.cornerRadius = imageofUser.frame.height / 2
    }
    
    func setupCellWith(image: UIImage, with name: String) {
        imageofUser.image = image
        labelOfUser.text = name
    }
    
    override func prepareForReuse() {
        imageofUser.image = nil
        labelOfUser.text = nil
    }

}
