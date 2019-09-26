//
//  SubjectViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    /// Configure tableView with default options
    
}
extension SubjectViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    /// Configure table view
    func configureCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectViewCell", for: indexPath) as? SubjectViewCell else {
            return UICollectionViewCell()
        }
        if(indexPath.row < subjects.count){
            let subject = subjects[indexPath.row]
            cell.configureCell(subject: subject)
        }
        return cell
    }
}


