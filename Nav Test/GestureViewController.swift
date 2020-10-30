//
//  GestureViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 10/1/20.
//

import UIKit

class GestureViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        addGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doSometing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func doSometing() {
        changeColor()
        self.loadView()
    }
    
    func changeColor() {
        self.view.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0..<255)), green: CGFloat(Float.random(in: 0..<255)), blue: CGFloat(Float.random(in: 0..<255)), alpha: 1.0)
    }
    
    
    
    
    
    
}
