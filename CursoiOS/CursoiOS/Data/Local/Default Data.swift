//
//  Default Data.swift
//  CursoiOS
//
//  Created by Dev2 on 23/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import Foundation
let defaultStudents = [Student(name: "Jorge", email: "jorge@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1984, month:9)), avatar: "img_student_2"),
                       Student(name: "José", email: "josw@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1954, month:3)), avatar: "img_student_7"),
                       Student(name: "Joaquin", email: "joaquin@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1923, month:5)), avatar: "img_student_6"),
                       Student(name: "Jaime", email: "jaime@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1931, month:4)), avatar: "img_student_4"),
                       Student(name: "Javier", email: "javier@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1921, month:2)), avatar: "img_student_3"),
                       Student(name: "Mara", email: "mara@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1968, month:2)), avatar: "img_student_5"),
                       Student(name: "Raquel", email: "raquel@gmail.com", birthdate: Calendar.current.date(from: DateComponents(year: 1911, month:1)), avatar: "img_student_1")]

let defaultTeachers = [Teacher(name: "Juan", email: "juan@gmail.com", type: .extern, avatar: "img_teacher_2"),
                       Teacher(name: "Rodrigo", email: "rodrigo@gmail.com", type: .intern, avatar: "img_teacher_3"),
                       Teacher(name: "Luis", email: "luis@gmail.com", type: .extern, avatar: "img_teacher_4"),
                       Teacher(name: "Ernesto", email: "ernesto@gmail.com", type: .intern, avatar: "img_teacher_5"),
                       Teacher(name: "Luisa", email: "luisa@gmail.com", type: .extern, avatar: "img_teacher_1")]

let subjects = [Subject(name: "Android", teachers: defaultTeachers.filter{$0.name?.contains("u") ?? false}, students: defaultStudents.filter{$0.name?.contains("a") ?? false}, avatar: "img_subject_android"),
                Subject(name: "Dart", teachers: defaultTeachers.filter{$0.name?.contains("o") ?? false}, students: defaultStudents.filter{$0.name?.contains("e") ?? false}, avatar: "img_subject_dart"),
                Subject(name: "IOS", teachers: defaultTeachers.filter{$0.name?.contains("i") ?? false}, students: defaultStudents.filter{$0.name?.contains("i") ?? false}, avatar: "img_subject_ios"),
                Subject(name: "Javascript", teachers: defaultTeachers.filter{$0.name?.contains("e") ?? false}, students: defaultStudents.filter{$0.name?.contains("o") ?? false}, avatar: "img_subject_javascript"),
                Subject(name: "Python", teachers: defaultTeachers.filter{$0.name?.contains("a") ?? false}, students: defaultStudents.filter{$0.name?.contains("u") ?? false}, avatar: "img_subject_python")]
