//
//  TeacherViewCell.swift
//  CursoiOS
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit
class TeacherViewCell: UITableViewCell {
    @IBOutlet weak var viewInCell: UIView!
    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var teacherType: UILabel!
    
    override func prepareForReuse() {
        imageInCell.image = nil
        name.text = nil
        email.text = nil
        teacherType.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInCell.configureShadows()
        viewInCell.layer.cornerRadius = 8.0
        
    }
    func configureCell(teacher: Teacher){
        imageInCell.image = UIImage(named: teacher.avatar ?? "")
        name.text = teacher.name
        email.text = teacher.email
        teacherType.text = teacher.type?.description
        
    }
}

