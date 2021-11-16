import UIKit

private let reuseIdentifier = "ContactCollectionViewCell"

class CollectionContactVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionV: UICollectionView!
    var contactsData: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        // Only register if cell is not in cellectionview
        //self.collectionV.register(ContactCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        title = "Contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(tapToAddContact))
        
        collectionV.delegate = self
        collectionV.dataSource = self
    }


    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return contactsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ContactCollectionViewCell
        
        let contact = contactsData[indexPath.item]
        
        cell?.contactName.text = contact.name
        cell?.contactAge.text = contact.age
        cell?.contactDesignation.text = contact.designation
        
//        let getDefaults = UserDefaults.standard
//
//        cell?.contactName.text = getDefaults.string(forKey: "ContactName")
//        cell?.contactAge.text = getDefaults.string(forKey: "ContactAge")
//        cell?.contactDesignation.text = getDefaults.string(forKey: "ContactDesignation")
        
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 1
        cell?.layer.cornerRadius = 10
        
        return cell ?? UICollectionViewCell()
    }
    
    @objc func tapToAddContact(){
        let addContactVc = self.storyboard?.instantiateViewController(withIdentifier: "AddContactVCViewController") as! AddContactVCViewController
        addContactVc.contactDelegate = self
        self.navigationController?.pushViewController(addContactVc, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension CollectionContactVC: AddContactVCViewControllerDelegate {
    func contactData(data: Contact) {
        contactsData.append(data)
        collectionV.reloadData()
    }
}
