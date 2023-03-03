//
//  VC_AddEdit.swift
//  CoreDataBeginnerProject
//
//  Created by Hande Nur Yavaş on 3.03.2023.
//

import UIKit
import CoreData

class VC_AddEdit: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSurName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if contact != nil
        {
            tfName.text = contact!.name
            tfSurName.text = contact!.surname
            tfEmail.text = contact!.email
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  
    
    @IBAction func cancel(_ sender: Any)
    {
    
    dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonSave_TUI(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if contact == nil
        {
            
        
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)
        
        let contact = NSManagedObject(entity: entity!, insertInto: context)
        
        contact.setValue(tfName.text!, forKey: "name")
        contact.setValue(tfSurName.text!, forKey: "surname")
        contact.setValue(tfEmail.text!, forKey: "email")
            
        }
        else
        {
            contact!.name = tfName.text!
            contact!.surname = tfSurName.text!
            contact!.email = tfEmail.text!
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
}
