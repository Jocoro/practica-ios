//
//  DetailController.swift
//  CursoiOS
//
//  Created by Dev2 on 27/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var firstListName: UILabel!
    @IBOutlet weak var secondListName: UILabel!
   @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    var data: Subject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(image: data?.avatar)
        configure(title: data?.name)
        configure(subtitle: "2019")
        configure(section1: "Teachers")
        configure(section2: "Subjects")
    }
    
    
    func configure(image: String?){
        guard let imageData = image else{
            return
        }
        mainImage.image = UIImage(named: imageData)
    }
    func configure(title: String?){
        name.text = title
    }
    func configure(subtitle: String?){
        detail.text = subtitle
    }
    func configure(section1: String?){
        firstListName.text = section1
    }
    func configure(section2: String?){
        secondListName.text = section2
    }
    func configureCollectionsView(){
        dataCollectionView.forEach{collectionView in
        collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
}
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0:
            return data?.teachers.count ?? 0
        case 1:
            return data?.students.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
