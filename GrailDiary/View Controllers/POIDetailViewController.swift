//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Steven Leyva on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clues in poi.clues {
            cluesText += "\(clues)\n"
        }
        cluesListTextView.text = cluesText
    }

 

}
