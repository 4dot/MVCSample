//
//  SchoolSAT.swift
//  MVCSample
//
//  Created by Park, Chanick on 3/8/18.
//  Copyright © 2018 Chanick Park. All rights reserved.
//

import Foundation


//
// School SAT Model
//
struct SchoolSAT : Codable {
    let dbn: String
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
    
    // Displays List
    var displays: [(name: String, score: String)] {
        return [("Num of SAT Test Takers", num_of_sat_test_takers),
                ("SAT Critical Reading Avg. Score", sat_critical_reading_avg_score),
                ("SAT Math Avg. Score", sat_math_avg_score),
                ("SAT Writing Avg. Score", sat_writing_avg_score)]
    }
}
