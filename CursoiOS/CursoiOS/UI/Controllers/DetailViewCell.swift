//
//  FirstDetailViewCell.swift
//  CursoiOS
//
//  Created by Dev2 on 27/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit
class DetailViewCell: UICollectionViewCell {
    @IBOutlet weak var viewInCell: UIView!
    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func prepareForReuse() {
        imageInCell.image = nil
        name.text = nil
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInCell.configureShadows()
        viewInCell.layer.cornerRadius = 8.0
        shadowView.layer.cornerRadius = 8.0
        shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    func configureCell(subject: Subject){
        imageInCell.image = UIImage(named: subject.avatar ?? "")
        name.text = subject.name
        
        
    }
    func configureCell(student: Student){
        imageInCell.image = UIImage(named: student.avatar ?? "")
        name.text = student.name
        
        
    }
    func configureCell(teacher: Teacher){
        imageInCell.image = UIImage(named: teacher.avatar ?? "")
        name.text = teacher.name
        
        
    }
}

