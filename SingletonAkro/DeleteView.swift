//
//  DeleteView.swift
//  SingletonAkro
//
//  Created by Admin on 10/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DeleteView: UIViewController {

//    Функции с маленькой буквы надо
    @IBAction func Delete(_ sender: Any) {
        Contacts.Delete(index: Contacts.kind)
        Contacts.save()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
