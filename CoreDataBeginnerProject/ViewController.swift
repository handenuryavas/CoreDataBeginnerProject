//
//  ViewController.swift
//  CoreDataBeginnerProject
//
//  Created by Hande Nur Yavaş on 3.03.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var tvContactList: UIButton!
    
    var contactList : [Contact]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        bringPeople()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contactList != nil
        {
            return contactList!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var line = UITableViewCell()
        
        line.textLabel?.text = contactList![indexPath.row].name! + " " + contactList![indexPath.row].surname!
        return line
    }

    func bringPeople()
    {
        let fr : NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do
        {
            contactList = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fr)
            
            contactTableView.reloadData()
        }
        
        catch{}
       
    }
    

}

