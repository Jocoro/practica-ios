//
//  TeacherDetailViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 30/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class TeacherDetailViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var firstListName: UILabel!
    @IBOutlet weak var secondListName: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func pushButton(_ sender: UIButton){
        let alert = UIAlertController(title: "Eliminar profesor", message: "Vas a eliminar al  profesor, ¿estás seguro?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: {[weak self] _ in
            //Elimina el profesor de la lista de todos los profesores
            defaultTeachers.removeAll(where: { $0.name == self?.teacher?.name})
            //Elimina el profesor de la lista de profesores de cada asignatura donde está
            subjects.forEach({ subject in
                subject.teachers.removeAll(where: { $0.name == self?.teacher?.name})
            })
            
            self?.navigationController?.popViewController(animated: true)
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        present(alert, animated: true)
        
    }
    
    
    var teacher: Teacher?
    
    
    private var teacherSubjects: [Subject] = []
    
    private var teacherStudents: [Student] = []
    
    func getSubjects(){
        teacherSubjects = subjects.filter({ subject in
            var subjectOfTeacher = false
            subject.teachers.forEach{ member in
                if member.name == teacher?.name {
                    subjectOfTeacher = true
                }
                
            }
            return subjectOfTeacher
        })
    }
    
    func getStudents(){
        var students: [Student] = []
        teacherSubjects.forEach {students += $0.students}
        teacherStudents = Array(Set(students)).sorted(by: { (student1, student2) -> Bool in
            guard let name1 = student1.name, let name2 = student2.name else {
                return false
            }
            return name1 < name2
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: teacher?.avatar)
        configure(title: teacher?.name)
        configure(subtitle: teacher?.email)
        configure(section1: "Students")
        configure(section2: "Subjects")
        getSubjects()
        getStudents()
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
extension TeacherDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 0:
            return teacherStudents.count
        case 1:
            return teacherSubjects.count
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
            
            
            if(indexPath.row < teacherStudents.count ){
                let student = teacherStudents[indexPath.row]
                cell.configureCell(image: student.avatar, title: student.name)
            }
            
            
        case 1:
            
            
            if(indexPath.row < teacherSubjects.count){
                let subject = teacherSubjects[indexPath.row]
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


