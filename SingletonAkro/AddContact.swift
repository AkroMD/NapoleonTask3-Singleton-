//
//  AddContact.swift
//  SingletonAkro
//
//  Created by Admin on 09/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddContact: UIViewController{
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lastnameText: UITextField!
    @IBOutlet weak var telText: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var textWarning: UILabel!
    
    @IBAction func saveAction(_ sender: Any) {
        if (nameText.text == "" ){
            textWarning.isHidden = false
            return
        }
        
        let contact = Contact(name: nameText.text, lastname: lastnameText.text, tel: telText.text)
        if (Contacts.kind == -1){
           Contacts.Add(contact: contact)
        }
        else {
            Contacts.Change(index: Contacts.kind,contact:  contact)
        }
        Contacts.save()
        navigationController?.popViewController(animated: true)
    }
    
//    Методы жизненного цикла лучше бы переносить повыше,
//    так обычно принято для удобства чтения
//    Т.е. сначала функция viewWillApper, а потом уже saveAction
    override func viewWillAppear(_ animated: Bool) {
        if (Contacts.kind == -1) {
            nameText.text = ""
            lastnameText.text = ""
            telText.text = ""
            titleText.text = "Добавить новый контакт"
            buttonSave.setTitle("Add", for: .normal)
        }
        else {
            let contact = Contacts.getContact(index: Contacts.kind)
            nameText.text = contact.name
            lastnameText.text = contact.lastname
            telText.text = contact.tel
            titleText.text = "Редактировать контакт"
            buttonSave.setTitle("Save", for: .normal)
        }
    }
    
}
