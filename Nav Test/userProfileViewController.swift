//
//  userProfileViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

protocol UserChangeDataDelegate {
    func changeData(text: String, section: Int, row: Int)
    func changeSlider(sliderValue: Float, section: Int, row: Int)
}

class userProfileViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel! { didSet { infoLabel.text = text } }
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoSegmentControl: UISegmentedControl!
    @IBOutlet weak var infoSwitch: UISwitch! {didSet {infoSwitch.isOn = false}}
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var goCollectionBtn: UIButton!
    
    var text: String?
    var userChange: UserChangeDataDelegate?
    var infoImagePath: String = ""
    var indexPath: IndexPath?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewElements()
    }
    
    func setupViewElements() {
        infoImage.image = UIImage(named: infoImagePath)
        infoImage.layer.cornerRadius = infoImage.frame.height / 2
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        self.view.backgroundColor = sender.isOn ? UIColor.darkGray : UIColor.white
    }
    
    @IBAction func goCollectionAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "collectionVC") as! CollectionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        self.view.backgroundColor = sender.selectedSegmentIndex == 1 ? UIColor.darkGray : UIColor.white
        
    }

    
    @IBAction func changeBtnOnClick(_ sender: UIButton) {
//        NotificationCenter.default.post(name:NSNotification.Name("changeDataName"), object: nil, userInfo: ["text": infoTextField.text ?? "empty", "indexPathSection": indexPath?.section ?? 0, "indexPathRow": indexPath?.row ?? "0"])
        infoLabel.text = infoTextField.text
        userChange?.changeData(text: infoTextField.text ?? "empty", section: indexPath?.section ?? 0, row: indexPath?.row ?? 0)
    }
}
