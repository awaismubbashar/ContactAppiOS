//
//  ViewController.swift
//  Person
//
//  Created by Awais on 16/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var gridButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedMe))
//        openListImageview.addGestureRecognizer(tap)
//        openListImageview.isUserInteractionEnabled = true

    }
    
    private func gotoContactsScreen() {
        print("Tapped on Image")
        let contactVc = self.storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        self.navigationController?.pushViewController(contactVc, animated: true)
    }
    
    @IBAction func listButtonAction(_ sender: Any) {
        print("List button pressed")
        
        gotoContactsScreen()
    }
    
    @IBAction func gridButtonAction(_ sender: Any) {
        print("Grid button pressed")
        let collectionContactVc = self.storyboard?.instantiateViewController(withIdentifier: "CollectionContactVC") as! CollectionContactVC
        self.navigationController?.pushViewController(collectionContactVc, animated: true)
    }
}

