//
//  StudentDetailViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 30/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//


import UIKit

class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var firstListName: UILabel!
    @IBOutlet weak var secondListName: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func pushButton(_ sender: UIButton){
        let alert = UIAlertController(title: "Eliminar alumno", message: "Vas a eliminar el alumno, ¿estás seguro?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: {[weak self] _ in
            defaultStudents.removeAll(where: { $0.name == self?.student?.name})
            subjects.forEach({ subject in
                subject.students.removeAll(where: { $0.name == self?.student?.name})
            })
            
            
            self?.navigationController?.popViewController(animated: true)
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        present(alert, animated: true)
        
    }
    
    
    
    var student: Student?
    
    
    private var studentSubjects: [Subject] = []
    
    private var studentTeachers: [Teacher] = []
    func getSubjects(){
        studentSubjects = subjects.filter({ subject in
            var subjectOfStudent = false
            subject.students.forEach{ member in
                if member.name == student?.name {
                    subjectOfStudent = true
                }
                
            }
            return subjectOfStudent
        })
    }
    func getTeachers(){
        var teachers: [Teacher] = []
        studentSubjects.forEach {teachers += $0.teachers}
        studentTeachers = Array(Set(teachers)).sorted(by: { (teacher1, teacher2) -> Bool in
            guard let name1 = teacher1.name, let name2 = teacher2.name else {
                return false
            }
            return name1 < name2
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: student?.avatar)
        configure(title: student?.name)
        configure(subtitle: student?.email)
        configure(section1: "Teachers")
        configure(section2: "Subjects")
        getSubjects()
        getTeachers()
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
extension StudentDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0:
            return studentTeachers.count
        case 1:
            return studentSubjects.count
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
            
            
            if(indexPath.row < studentTeachers.count){
                 let teacher = studentTeachers[indexPath.row]
                cell.configureCell(image: teacher.avatar, title: teacher.name)
            }
            
            
        case 1:
            
            
            if(indexPath.row < studentSubjects.count){
                let subject = studentSubjects[indexPath.row]
                cell.configureCell(image: subject.avatar, title: subject.name)
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

