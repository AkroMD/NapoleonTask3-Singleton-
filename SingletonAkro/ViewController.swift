//
//  ViewController.swift
//  SingletonAkro
//
//  Created by Admin on 09/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    Лучше не делать лишних переносов между аутлетами
//    в этом случае, т.к. их мало
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var startView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Contacts.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
        startView.isHidden = Contacts.Lenght() != 0
        table.isHidden = Contacts.Lenght() == 0
    }
    
//    Переместил функцию пониже, чтобы она не разбивала
//    методы жизненного цикла контроллера, чтобы потом
//    было проще ориентироваться
    
//    Ну и конечноже нельзя называть функции с большой буквы
    @IBAction func ShowAddContact(_ sender: Any) {
        Contacts.kind = -1;
    }
    
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Contacts.Lenght()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell1") as! MyTableCell
        cell.EditText(index: indexPath.row)
        return cell
    }
        
}

