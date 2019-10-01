//
//  StudentViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 25/09/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    /// Configure tableView with default options
    
}
extension StudentViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure table view
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentViewCell", for: indexPath) as? StudentViewCell else {
            return UITableViewCell()
        }
        if(indexPath.row < defaultStudents.count){
            let student = defaultStudents[indexPath.row]
            cell.configureCell(student: student)
        }
        return cell
    }
}
extension StudentViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? StudentDetailViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        destination.student = defaultStudents[indexPath.row]
        
    }
}
