//
//  Student.swift
//  CursoiOS
//
//  Created by Dev2 on 20/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import Foundation
class Student: CustomStringConvertible {
    
    var avatar: String?
    var name: String?
    var email: String?
    var birthdate: Date?
    
    var description: String {
        return  "Student data: \(String(describing: name)) \(String(describing: email))"
    }
    
    convenience init(name: String, email: String? = nil, birthdate: Date? = nil, avatar: String? = nil) {
        self.init()
        self.name = name
        self.email = email
        self.birthdate = birthdate
        self.avatar = avatar
    }
}
