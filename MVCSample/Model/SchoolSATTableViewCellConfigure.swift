//
//  SchoolSATTableViewCellConfigure.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

//
// SchoolSATTableViewCellConfigure
//
class SchoolSATTableViewCellConfigure {
    
    func configure(cell: SchoolSATTableViewCell, schoolSAT: SchoolSAT, indexPath: IndexPath) {
        guard let display = schoolSAT.displays[safe: indexPath.row] else {
            return
        }
        
        cell.titleLbl.text = display.name
        cell.scoreLbl.text = display.score
    }
}
