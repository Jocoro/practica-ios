//
//  TeacheViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class TeacherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    /// Configure tableView with default options
    
}
extension TeacherViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure table view
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherViewCell", for: indexPath) as? TeacherViewCell else {
            return UITableViewCell()
        }
        if(indexPath.row < defaultTeachers.count){
            let teacher = defaultTeachers[indexPath.row]
            cell.configureCell(teacher: teacher)
        }
        return cell
    }
}
    
