//
//  ViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/29/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [[(name: String, value: Float)]] = [
        [(name: "Hakuna Matata", value: 0),
         (name: "Yellow Creation", value: 0),
         (name: "Hokus Pokus", value: 0),
         (name: "John Wick", value: 0),
         (name: "Total War", value: 0)],
        [(name: "Rab", value: 0),
         (name: "Dog", value: 0),
         (name: "Cat", value: 0)],
        [(name: "Drake", value: 0),
         (name: "Logan Paul", value: 0),
         (name: "Jake Paul", value: 0),
         (name: "Zach King", value: 0)]
    ]
    
    let headerTitles = ["Foo", "Boo", "Too"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUp()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(changeData), name: NSNotification.Name("changeDataName"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(changeSliderValue), name: NSNotification.Name("changeSliderValue"), object: nil)
    }
    
//    @objc func changeData(_ notification: Notification) {
//        let text = notification.userInfo?["text"] as! String
//        let sec = notification.userInfo?["indexPathSection"] as! Int
//        let row = notification.userInfo?["indexPathRow"] as! Int
//        data[sec][row].name = text
//    }
//
//    @objc func changeSliderValue(_ notification: Notification){
//        let sliderValue = notification.userInfo?["sliderValue"] as! Float
//        let sec = notification.userInfo?["indexPathSection"] as! Int
//        let row = notification.userInfo?["indexPathRow"] as! Int
//        data[sec][row].value = sliderValue/100
//
//    }
    override func viewWillAppear(_ animated: Bool) {
       tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("changeDataName"), object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("changeSliderValue"), object: nil)
    }
    
    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: NewTableViewCell?
        var cellAnother: anotherTableCellView?
        if(indexPath.section != 2){
            switch indexPath.row % 2 {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? NewTableViewCell
            case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? NewTableViewCell
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? NewTableViewCell
            }
        }
        
        if indexPath.section == 0 {
            cell?.setupCellWith(image: UIImage(named: "photo-\(indexPath.row + 1)") ?? UIImage(), with: "\(String(indexPath.row + 1)) \(data[indexPath.section][indexPath.row].name)")
        } else if indexPath.section == 1 {
            cell?.setupCellWith(image: UIImage(named: "animal-\(indexPath.row + 1)") ?? UIImage(), with: "\(String(indexPath.row + 1)) \(data[indexPath.section][indexPath.row].name)")
        } else if indexPath.section == 2 {
            cellAnother = tableView.dequeueReusableCell(withIdentifier: "anotherCell", for: indexPath) as? anotherTableCellView
            cellAnother?.setupCellWith(name: "\(data[indexPath.section][indexPath.row].name)", progBarValue: Float(data[indexPath.section][indexPath.row].value))
        }
        if indexPath.section == 2 {
            return cellAnother!
        }
        return cell ?? tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! NewTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            showAnotherVC(indexPath: indexPath)
        default:
            showVC(name: data[indexPath.section][indexPath.row].name , image: indexPath.section == 0 ? "photo-\(indexPath.row + 1)" : "animal-\(indexPath.row + 1)", indexPath: indexPath)
        }
    }
    
    func showVC(name: String, image: String, indexPath: IndexPath)  {
        let vc = storyboard?.instantiateViewController(identifier: "userProfile") as! userProfileViewController
        vc.text = name
        //vc.modalTransitionStyle = .crossDissolve
        //vc.modalPresentationStyle = .fullScreen
        //present(vc, animated: true, completion: nil)
        vc.infoImagePath = image
        vc.indexPath = indexPath
        vc.userChange = self
        navigationController?.pushViewController(vc, animated: true)
    }
    func showAnotherVC(indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "anotherVC") as! AnotherViewController
        vc.text = data[indexPath.section][indexPath.row].name
        vc.indexPath = indexPath
        vc.sliderValue = Float(data[indexPath.section][indexPath.row].value * 100)
        vc.userChange = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension ViewController: UserChangeDataDelegate {
    func changeSlider(sliderValue: Float, section: Int, row: Int) {
        data[section][row].value = sliderValue/100
    }
    
    func changeData(text: String, section: Int, row: Int) {
        data[section][row].name = text
        
    }
}

