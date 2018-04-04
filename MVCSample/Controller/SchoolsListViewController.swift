//
//  SchoolsListViewController.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit

//
// SchoolsListViewController
//
class SchoolsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Schools Array, Grouped by City (city, [School]])
    var schools = [(key: String, values: [School])]()
    
    // Presenter
    var schoolsListViewPresenter = SchoolsListViewPresentor(networkManager: SchoolNetworkManager(client: SchoolNetworkClient()))
    
    // Create TableView ell configurer
    var cellConfigurer = SchoolTableViewCellConfigure()
    
    // Activity Indicator View
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        return ActivityIndicatorViewFactory.create(superview: self.view)
    }()
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup UI
        self.tableView.tableFooterView = UIView()
        
        schoolsListViewPresenter.attachView(self)
        fetchSchoolList()
    }

    // MARK: - private
    
    /**
     * @desc Fetch Schools List, Request schools list
     */
    fileprivate func fetchSchoolList() {
        schoolsListViewPresenter.getSchoolsList()
    }
    
    /**
     * @desc Get Schools Information with index path(section, row)
     * @return School information(optional)
     */
    fileprivate func getSchoolBy(indexPath: IndexPath)-> School? {
        guard let cityGroup = schools[safe: indexPath.section] else {
            return nil
        }
        return cityGroup.values[safe: indexPath.row]
    }
}

extension SchoolsListViewController : UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools[safe: section]?.values.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SchoolListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        guard let school = getSchoolBy(indexPath: indexPath) else {
            return cell
        }
        // Cell configure
        cellConfigurer.configure(cell: cell, shcool: school, indexPath: indexPath)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let school = getSchoolBy(indexPath: indexPath) else {
            return
        }
        
        // Show Detail View, Create SchoolSAT View Controller
        let schoolSATView = UIStoryboard.viewController(.Main, SchoolSATViewController.self)
        schoolSATView.school = school
        self.navigationController?.pushViewController(schoolSATView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Set Tableview section title
        return schools[safe: section]?.key
    }
}

extension SchoolsListViewController : SchoolListView {
    
    func setSchoolsList(success: Bool, schools: [(key: String, values: [School])]) {
        self.schools =  schools
        self.tableView.reloadData()
    }
    
    func startLoading() {
        // Show Activity Indicator
        activityIndicatorView.startAnimating()
    }
    
    func endLoading() {
        // Hide Activity Indicator
        self.activityIndicatorView.stopAnimating()
    }
    
    func isLoading()-> Bool {
        return activityIndicatorView.isAnimating
    }
}
