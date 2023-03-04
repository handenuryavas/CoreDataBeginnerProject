//
//  ViewController.swift
//  CoreDataBeginnerProject
//
//  Created by Hande Nur Yavaş on 3.03.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    
    @IBOutlet weak var tvContactList: UITableView!
    
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
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do
        {
            contactList = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fr)
            
            tvContactList.reloadData()
        }
        
        catch{}
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "sgEdit", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "sgEdit"
        {
            let targetVc = segue.destination as! VC_AddEdit
            targetVc.contact = contactList![sender as! Int]
        }
            
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(contactList![indexPath.row])
            
            bringPeople()
        }
    }

}

