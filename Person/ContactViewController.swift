//
//  ContactViewController.swift
//  Person
//
//  Created by Awais on 17/10/2021.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let name: [String] = ["Ali", "Asghar", "Awais", "Mubbashar", "Ameen"]
    let age: [Int] = [22, 33, 33, 11, 21]
    let designation: [String] = ["Teacher", "Engineer", "Wela", "Teacher", "Teacher"]
    
    let cellReuseIdentifier = "ContactTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(tapToAddContact))
        
//        let addContactBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: "tapToAddContact")
//        self.navigationItem.leftBarButtonItem = addContactBtn
        
//        let btnRefresh = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(tapToAddContact))
//            navigationItem.leftBarButtonItem = btnRefresh

        
        //self.tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ContactTableViewCell
//        cell.textLabel?.text = self.animals[indexPath.row]
        
        cell?.nameContact.text = self.name[indexPath.row]
        cell?.ageContact.text = " \(self.age[indexPath.item]) "
        cell?.designationContact.text = self.designation[indexPath.row]

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath) Select")
    }
    
    @objc func tapToAddContact(){
        let addContactVc = self.storyboard?.instantiateViewController(withIdentifier: "AddContactVCViewController") as! AddContactVCViewController
        self.navigationController?.pushViewController(addContactVc, animated: true)
    }
}
