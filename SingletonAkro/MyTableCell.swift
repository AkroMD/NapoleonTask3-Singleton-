//
//  MyTableCell.swift
//  SingletonAkro
//
//  Created by Admin on 09/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {


    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var telText: UILabel!
    @IBOutlet weak var lastText: UILabel!
    
    var cellindex: Int = 0
    
    func EditText(index: Int){
        let contact = Contacts.getContact(index: index)
        nameText.text = contact.name
        lastText.text = contact.lastname
        telText.text = contact.tel
        cellindex = index
    }

    @IBAction func Delete(_ sender: Any) {
        Contacts.kind = cellindex
    }
    
    @IBAction func ShowEditContact(_ sender: Any) {
//        ; не нужны практически никогда в свифте
        Contacts.kind = cellindex;
    }
    
//    Пустая функция?
    @IBAction func EditAction(_ sender: Any) {
    }
}
