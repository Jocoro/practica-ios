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
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonViewCell", for: indexPath) as? PersonViewCell else {
            return UITableViewCell()
        }
        if(indexPath.row < defaultTeachers.count){
            let teacher = defaultTeachers[indexPath.row]
            cell.configureCell(image: teacher.avatar, name: teacher.name, email: teacher.email)
        }
        return cell
    }
}
extension TeacherViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TeacherDetailViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        destination.teacher = defaultTeachers[indexPath.row]
        
    }
}

