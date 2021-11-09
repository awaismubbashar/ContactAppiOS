//
//  ContactViewController.swift
//  Person
//
//  Created by Awais on 17/10/2021.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    
    let cellReuseIdentifier = "ContactTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(tapToAddContact))
        
        //self.tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ContactTableViewCell
        
        // Getting
        let getDefaults = UserDefaults.standard
        
        cell?.nameContact.text = getDefaults.string(forKey: "ContactName")
        cell?.ageContact.text = getDefaults.string(forKey: "ContactAge")
        cell?.designationContact.text = getDefaults.string(forKey: "ContactDesignation")

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
