//
//  Default Data.swift
//  CursoiOS
//
//  Created by Dev2 on 23/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import Foundation
let defaultStudents = [Student(name: "Jorge", email: "jorge@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1984, month:9))),
                       Student(name: "José", email: "josw@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1954, month:3))),
                       Student(name: "Joaquin", email: "joaquin@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1923, month:5))),
                       Student(name: "Jaime", email: "jaime@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1931, month:4))),
                       Student(name: "Javier", email: "javier@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1921, month:2))),
                       Student(name: "Mara", email: "maria@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1968, month:2))),
                       Student(name: "Raquel", email: "raquel@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1911, month:1)))]

let defaultTeachers = [Teacher(name: "Juan", email: "juan@gmail.com", type: .extern),
                       Teacher(name: "Rodrigo", email: "rodrigo@gmail.com", type: .intern),
                       Teacher(name: "Luis", email: "luis@gmail.com", type: .extern),
                       Teacher(name: "Ernesto", email: "ernesto@gmail.com", type: .intern),
                       Teacher(name: "Luisa", email: "luisa@gmail.com", type: .extern)]

let subjects = [Subject(name: "Android", teachers: defaultTeachers.filter{$0.name?.contains("u") ?? false}, students: defaultStudents.filter{$0.name?.contains("a") ?? false}),
                Subject(name: "Dart", teachers: defaultTeachers.filter{$0.name?.contains("o") ?? false}, students: defaultStudents.filter{$0.name?.contains("e") ?? false}),
                Subject(name: "IOS", teachers: defaultTeachers.filter{$0.name?.contains("i") ?? false}, students: defaultStudents.filter{$0.name?.contains("i") ?? false}),
                Subject(name: "Javascript", teachers: defaultTeachers.filter{$0.name?.contains("e") ?? false}, students: defaultStudents.filter{$0.name?.contains("o") ?? false}),
                Subject(name: "Python", teachers: defaultTeachers.filter{$0.name?.contains("a") ?? false}, students: defaultStudents.filter{$0.name?.contains("u") ?? false})]
