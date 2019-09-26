//
//  SubjectViewCell.swift
//  CursoiOS
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//


import UIKit
class SubjectViewCell: UICollectionViewCell {
    @IBOutlet weak var viewInCell: UIView!
    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    override func prepareForReuse() {
        imageInCell.image = nil
        name.text = nil
        
    }
    
    func configureCell(subject: Subject){
        imageInCell.image = UIImage(named: subject.avatar ?? "")
        name.text = subject.name
        
        
    }
}
