//
//  CheckListItem.swift
//  Checklists
//
//  Created by Ashley Donohoe on 7/12/18.
//  Copyright © 2018 Ashley Donohoe. All rights reserved.
//

import Foundation

class CheckListItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
