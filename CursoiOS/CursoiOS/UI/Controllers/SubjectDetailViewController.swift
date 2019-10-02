//
//  DetailController.swift
//  CursoiOS
//
//  Created by Dev2 on 27/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class SubjectDetailViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var firstListName: UILabel!
    @IBOutlet weak var secondListName: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func pushButton(_ sender: UIButton){
        let alert = UIAlertController(title: "Eliminar asignatura", message: "Vas a eliminar la asignatura, ¿estás seguro?",
                          preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: {[weak self] _ in
            subjects.removeAll(where: { $0.name == self?.subject?.name})
           
            self?.navigationController?.popViewController(animated: true)
            
        
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        present(alert, animated: true)
    
    }
    
    var subject: Subject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: subject?.avatar)
        configure(title: subject?.name)
        configure(subtitle: "2019")
        configure(section1: "Teachers")
        configure(section2: "Students")
        configureCollectionsView()
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
extension SubjectDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0:
            return subject?.teachers.count ?? 0
        case 1:
            return subject?.students.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.cellIdentifier, for: indexPath) as? DetailViewCell else {
            return UICollectionViewCell()
        }
        switch collectionView.tag{
            
        case 0:
            
            
            if(indexPath.row < subject?.teachers.count ?? 0){
                guard let teacher = subject?.teachers[indexPath.row] else {
                    return UICollectionViewCell()
                }
                cell.configureCell(image: teacher.avatar, title: teacher.name)
            }
            
            
        case 1:
            
            
            if(indexPath.row < subject?.students.count ?? 0){
                guard let student = subject?.students[indexPath.row] else {
                    return UICollectionViewCell()
                }
                cell.configureCell(image: student.avatar, title: student.name)
            }
            
            
        default:
            return UICollectionViewCell()
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 32.0) / 2.5
        return CGSize(width: size, height: size)
    }
    
}
