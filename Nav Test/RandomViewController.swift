//
//  RandomViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 10/2/20.
//

import UIKit

class RandomViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func act(_ sender: UIButton) {
        lbl.text = "hola"
        sender.backgroundColor = UIColor.orange
    }
    
}
