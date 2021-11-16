import UIKit

protocol AddContactVCViewControllerDelegate {
    func contactData(data: String)
}

class AddContactVCViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var designationTF: UITextField!
    
    var contactDelegate: AddContactVCViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addContact(_ sender: UIButton) {
        let name: String = nameTF.text ?? ""
        let age: String = ageTF.text ?? ""
        let designation: String = designationTF.text ?? ""
        
        contactDelegate?.contactData(data: name)
        self.navigationController?.popViewController(animated: true)

//
//        if (!name.isEmpty && !age.isEmpty && !designation.isEmpty) {
////            let defaults = UserDefaults.standard
////            defaults.set(name, forKey: "ContactName")
////            defaults.set(age, forKey: "ContactAge")
////            defaults.set(designation, forKey: "ContactDesignation")
//
//            contactDelegate?.contactData(data: name)
//            dismiss(animated: true, completion: nil)
//        }
//        else{
//            print("Please Fill All the Fields")
//        }
    }
}

struct DefaultsKeys {
    static let keyOne = "firstStringKey"
    static let keyTwo = "secondStringKey"
}
