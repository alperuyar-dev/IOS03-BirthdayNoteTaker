//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Alper Uyar on 15.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var birthdayTextfield: UITextField!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
       let storedBirthday =  UserDefaults.standard.object(forKey: "birthday")
        if let myName = storedName as? String{
            nameLabel.text = myName
        }
        if let myBirthday = storedBirthday as? String{
            birthdayLabel.text = myBirthday
        }
        

    }

   @IBAction func saveButton(_ sender: Any) {
       UserDefaults.standard.set(nameTextfield.text, forKey: "name")
       UserDefaults.standard.set(birthdayTextfield.text, forKey: "birthday")

       nameLabel.text = nameTextfield.text == "" ? "Name: Empty" : nameTextfield.text

       birthdayLabel.text = birthdayTextfield.text == "" ? "Birthday: Empty" : birthdayTextfield.text
       
    }
    
    
    @IBAction func dleteButton(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday =  UserDefaults.standard.object(forKey: "birthday")
        
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text="Birthday:"
        }

    }
    
}

