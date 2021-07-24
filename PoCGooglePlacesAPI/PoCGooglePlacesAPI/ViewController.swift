//
//  ViewController.swift
//  PoCGooglePlacesAPI
//
//  Created by Dilum De Silva on 2021-06-25.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textFieldTapped(_ sender: Any) {
        addressTextField.resignFirstResponder()
        let autoCompeteVC = GMSAutocompleteViewController()
        autoCompeteVC.delegate = self
        present(autoCompeteVC, animated: true, completion: nil)
    }

}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        addressTextField.text = place.name
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}

