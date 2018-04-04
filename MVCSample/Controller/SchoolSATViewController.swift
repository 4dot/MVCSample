//
//  SchoolSATViewController.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/9/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import UIKit


//
// SchoolSATViewController
//
class SchoolSATViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    
    // Create Network Manager for School SAT
    var schoolSATNetworkManager = SchoolSATNetworkManager(client: SchoolNetworkClient())
    var cellConfigurer = SchoolSATTableViewCellConfigure()
    
    // ActivityIndicatorView
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        return ActivityIndicatorViewFactory.create(superview: self.view)
    }()
    
    // Selected School, school SAT
    var school = School()
    var schoolSAT = SchoolSAT(dbn: "", school_name: "", num_of_sat_test_takers: "", sat_critical_reading_avg_score: "", sat_math_avg_score: "", sat_writing_avg_score: "")
    
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup UI
        self.nameLbl.text = school.school_name
        self.tableView.tableFooterView = UIView()
        
        fetchSchoolSAT(dbn: school.dbn)
    }
    
    // MARK: - private
    
    /**
     * @desc Fetch School SAT, Request School SAT with 'dbn'
     */
    fileprivate func fetchSchoolSAT(dbn: String) {
        guard !activityIndicatorView.isAnimating else {
            return
        }
        
        // Show Activity Indicator
        activityIndicatorView.startAnimating()
        
        // Request School SAT information
        schoolSATNetworkManager.requestSchoolSAT(dbn: dbn) { (result) in
            switch result {
            case .success(let schoolSAT):
                // Take first index of results
                if let schoolSAT = schoolSAT.first {
                    self.schoolSAT = schoolSAT
                }
                
                // update table view
                self.tableView.reloadData()
                
            case .failure(let errors):
                // show Alt view
                self.presentAlertController(title: "Load Failed.", errors: errors)
            }
            
            // Hide Activity Indicator
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func backBtnTapped(_ sender: Any) {
        // Goto prev view
        self.navigationController?.popViewController(animated: true)
    }
}

extension SchoolSATViewController : UITableViewDataSource {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // get displays count from SchoolSAT model
        return schoolSAT.displays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SchoolSATTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        cellConfigurer.configure(cell: cell, schoolSAT: schoolSAT, indexPath: indexPath)
        return cell
    }
}
