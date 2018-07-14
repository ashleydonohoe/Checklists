//
//  ViewController.swift
//  Checklists
//
//  Created by Ashley Donohoe on 7/10/18.
//  Copyright © 2018 Ashley Donohoe. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var items: [CheckListItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        item1.checked = false
        items.append(item1)
        
        let item2 = CheckListItem()
        item2.text = "Brush teeth"
        item2.checked = false
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn iOS development"
        item3.checked = false
        items.append(item3)
        
        let item4 = CheckListItem()
        item4.text = "Soccer practice"
        item4.checked = false
        items.append(item4)
        
        let item5 = CheckListItem()
        item5.text = "Go to bed"
        item5.checked = false
        items.append(item5)
        
        let item6 = CheckListItem()
        item6.text = "Go to grocery store"
        item6.checked = false
        items.append(item6)
        
        let item7 = CheckListItem()
        item7.text = "Pay bills"
        item7.checked = false
        items.append(item7)
        
        let item8 = CheckListItem()
        item8.text = "Eat dinner"
        item8.checked = false
        items.append(item8)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let textArray = ["Some item", "Some other item", "One item", "Your item"]
        let item = CheckListItem()
        let random = arc4random_uniform(UInt32(textArray.count))
        let title = textArray[Int(random)]
        item.text = title
        item.checked = true
        items.append(item)
        
       tableView.reloadData()
    }
}

