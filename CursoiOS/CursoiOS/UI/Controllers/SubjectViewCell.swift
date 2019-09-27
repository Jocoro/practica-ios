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
}
