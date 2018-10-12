//
//  ContactListController.swift
//  MCPTT
//
//  Created by Harman on 10/11/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import UIKit

class ContactListController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self
        
         self.tableView.register(ContactsCell.self, forCellReuseIdentifier: "ContactsCell")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as? ContactsCell
        
        //cell?.contactAvailabiltyStatus.isHidden = true
        // cell?.callContactButton.isHidden = true
        // cell?.separatorLineLabel.isHidden = true
        
        cell?.NameLabel?.text = "Raju"
        return cell ?? ContactsCell()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
