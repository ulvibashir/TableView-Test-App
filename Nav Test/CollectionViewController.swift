//
//  CollectionViewController.swift
//  Nav Test
//
//  Created by Ulvi Bashirov on 9/30/20.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! userCollectionViewCell
        cell.imageView.image = UIImage(named: "collection-\(indexPath.row + 1)")
        
        return cell
    }
    

   
    
    
    func setUp(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
