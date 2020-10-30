//
//  AnotherViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

class AnotherViewController: UIViewController {

    @IBOutlet weak var infoSlider: UISlider! {
        didSet {
            infoSlider.maximumValue = 100
            infoSlider.minimumValue = 0
        }
    }
    @IBOutlet weak var gestureScreenButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel! {
        didSet {
            infoLabel.text = text
        }
    }
    
    
    var text: String?
    var sliderValue: Float?
    var indexPath: IndexPath?
    var userChange: UserChangeDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoSlider.value = sliderValue ?? 0
        infoLabel.font = UIFont(name: infoLabel.font.fontName, size: CGFloat(sliderValue ?? 0))
        
    }
    
    @IBAction func gestureScreenOnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "gestureVC") as!GestureViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        infoLabel.font = infoLabel.font.withSize(CGFloat(sender.value))
//        NotificationCenter.default.post(name:NSNotification.Name("changeSliderValue"), object: nil, userInfo: ["sliderValue": sender.value, "indexPathSection": indexPath?.section ?? 0, "indexPathRow": indexPath?.row ?? "0"])
        
        userChange?.changeSlider(sliderValue: sender.value, section: indexPath?.section ?? 0, row: indexPath?.row ?? 0)
        
        
    }
    
}
