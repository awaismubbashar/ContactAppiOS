import UIKit

class AddContactVCViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var designationTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addContact(_ sender: UIButton) {
        let name: String = nameTF.text!
        let age: String = ageTF.text!
        let designation: String = designationTF.text!
        
        if (!name.isEmpty && !age.isEmpty && !designation.isEmpty) {
//            print("Name: \(name), \(age), \(designation)")
            
            let defaults = UserDefaults.standard
            defaults.set(name, forKey: "ContactName")
            defaults.set(age, forKey: "ContactAge")
            defaults.set(designation, forKey: "ContactDesignation")

            // Getting
            let getDefaults = UserDefaults.standard
            if let stringOne = getDefaults.string(forKey: "ContactName") {
                print(stringOne)
            }
            if let stringTwo = getDefaults.string(forKey: "ContactAge") {
                print(stringTwo)
            }
            if let stringThree = getDefaults.string(forKey: "ContactDesignation") {
                print(stringThree)
            }
            
            
        }
        else{
            print("Please Fill All the Fields")
        }
    }
}

struct defaultsKeys {
    static let keyOne = "firstStringKey"
    static let keyTwo = "secondStringKey"
}
