//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Steven Leyva on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POIWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clues1TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!
    
    var delegate: AddPOIDelegate?

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location =  locationTextField.text,
        let country = countryTextField.text,
        !location.isEmpty,
        !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clues1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clues2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clues3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.POIWasAdded(poi)
    }
}

extension AddPOIViewController: UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clues1TextField.becomeFirstResponder()
            case clues1TextField:
                clues2TextField.becomeFirstResponder()
            case clues2TextField:
                clues2TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
                
            }
        }
        return false
    }
}
