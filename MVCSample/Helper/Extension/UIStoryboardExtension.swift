//
//  UIStoryboardExtension.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

// Storyboard files name
enum StoryBoardId : String {
    case Main = "Main"
}

//
// Extension UIStoryboard 
//
extension UIStoryboard {
    // Get storyboard
    static func name(_ boardId: StoryBoardId) ->UIStoryboard {
        return UIStoryboard(name: boardId.rawValue, bundle: Bundle.main)
    }
    
    // get controller from storyboard
    static func controller(_ boardId: StoryBoardId, _ nameId: String) ->UIViewController {
        return UIStoryboard.name(boardId).instantiateViewController(withIdentifier: nameId)
    }
    
    /**
     * @desc get view controller from story board, you must matched with class name and storyboard id
     * @param type StoryBoardId, classType class
     * @return classType
     */
    static func viewController<T: UIViewController>(_ boardId: StoryBoardId, _ classType: T.Type) -> T {
        guard let typeViewController = UIStoryboard.name(boardId).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Misconfigured typeViewController, \(classType)!")
        }
        return typeViewController
    }
}
