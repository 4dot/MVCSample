//
//  SchoolTableViewCellConfigure.swift
//  MVCSample
//
//  Created by chanick park on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit


//
// SchoolTableViewCellConfigure
//
class SchoolTableViewCellConfigure {
    
    func configure(cell: SchoolListTableViewCell, shcool: School, indexPath: IndexPath) {
        cell.nameLbl.text = shcool.school_name
    }
}
