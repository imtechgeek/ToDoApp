//
//  ViewController.swift
//  ToDo
//
//  Created by Usman on 26/11/2019.
//  Copyright © 2019 Usman. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {
   
    var itemArray = ["transworld", "fuel", "Bills"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add item to Todo List", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let todoText = textField.text {
                self.itemArray.append(todoText)
                self.tableView.reloadData()

            }
        })
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        self.present(alert,animated: true)
    }
}

