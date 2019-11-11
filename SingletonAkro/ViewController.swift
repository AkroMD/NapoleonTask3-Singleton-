//
//  ViewController.swift
//  SingletonAkro
//
//  Created by Admin on 09/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    
    @IBOutlet weak var startView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Contacts.load()
    }

    @IBAction func ShowAddContact(_ sender: Any) {
        Contacts.kind = -1;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
        startView.isHidden = Contacts.Lenght() != 0
        table.isHidden = Contacts.Lenght() == 0
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

