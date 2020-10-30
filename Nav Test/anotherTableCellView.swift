//
//  anotherTableCellView.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

class anotherTableCellView: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCellWith(name: String, progBarValue: Float) {
        infoLabel.text = name
        progresBar.setProgress(progBarValue, animated: true)
        
    }
    
    override func prepareForReuse() {
        infoLabel.text = nil
    }
}
