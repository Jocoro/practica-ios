//
//  StudentViewCell.swift
//  CursoiOS
//
//  Created by Dev2 on 25/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit
class StudentViewCell: UITableViewCell {
    @IBOutlet weak var viewInCell: UIView!
    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func prepareForReuse() {
        imageInCell.image = nil
        name.text = nil
        email.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewInCell.configureShadows()
        viewInCell.layer.cornerRadius = 8.0
       
    }
    func configureCell(student: Student){
        imageInCell.image = UIImage(named: student.avatar ?? "")
        name.text = student.name
        email.text = student.email
        
    }
}
