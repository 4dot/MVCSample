//
//  SchoolsListViewPresentor.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/13/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation



protocol SchoolListView : NSObjectProtocol {
    func setSchoolsList(success: Bool, schools: [(key: String, values: [School])])
    func startLoading()
    func endLoading()
    func isLoading()-> Bool
}



class SchoolsListViewPresentor {
    // Network manager with NetworkClient
    fileprivate var schoolNetworkManager: SchoolNetworkManager
    fileprivate weak var schoolsListView: SchoolListView?
    
    
    
    
    init(networkManager: SchoolNetworkManager){
        self.schoolNetworkManager = networkManager
    }
    
    func attachView(_ view: SchoolListView){
        schoolsListView = view
    }
    
    func detachView() {
        schoolsListView = nil
    }
    
    func getSchoolsList() {
        if (self.schoolsListView?.isLoading() ?? false) {
            return
        }
        
        self.schoolsListView?.startLoading()
        
        // Request Schools List
        schoolNetworkManager.requestSchoolsList { (result) in
            switch result {
            case .success(let schools):
                // Group by city and Sort by city name(ascending)
                let schools = schools.group(by: \School.city).sorted(by: { $0.key < $1.key })
                
                self.schoolsListView?.setSchoolsList(success: true, schools: schools)
                
            case .failure(_):
                // show Alert view
                self.schoolsListView?.setSchoolsList(success: false, schools: [])
            }
            
            // Hide loading
            self.schoolsListView?.endLoading()
        }
    }
}
