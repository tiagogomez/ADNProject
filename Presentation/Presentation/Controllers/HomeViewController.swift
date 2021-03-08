//
//  HomeViewController.swift
//  Presentation
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import UIKit
import Domain

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var platesTextField: UITextField!
    @IBOutlet weak var cylinderCapacityTextField: UITextField!
    @IBOutlet weak var vehicleType: UISegmentedControl!
    @IBOutlet weak var entryVehicleButton: UIButton!
    
    private var plateString: String?
    private var ccValue: Int?
    private var vehicleTypeString: VehicleType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        platesTextField.delegate = self
        cylinderCapacityTextField.delegate = self
        self.title = "Parking view"
    }
    
    @IBAction func entryVehicleButtonPressed(_ sender: Any) {
        
        guard let platesText = platesTextField.text, !platesText.isEmpty,
              let ccText = cylinderCapacityTextField.text, !ccText.isEmpty else {
            self.present(setupAlert(), animated: true, completion:nil)
            return
        }
        getInputData()
        let didStoreVehicle = Parking.shared.enterVehicle(licensePlate: plateString ?? String(),
                                                          cylinderCapacity: ccValue ?? Int(),
                                                          type: vehicleTypeString ?? .car)
        guard didStoreVehicle else {
            self.present(setupAlert(), animated: true, completion:nil)
            return
        }
        clearFields()
    }
    
    private func setupAlert() -> UIAlertController {
        let alert = UIAlertController(title: "No puede ingresar",
                                      message: "El vehiculo que ingresó no es valido",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
    }
    
    @IBAction func exitVehicleButtonPressed(_ sender: Any) {
        let vc = StoredVehiclesViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func clearFields() {
        platesTextField.text = String()
        cylinderCapacityTextField.text = String()
    }
    
    func getInputData() {
        plateString = platesTextField.text
        ccValue = Int(cylinderCapacityTextField.text ?? "0")
        vehicleTypeString = VehicleType(rawValue: vehicleType.titleForSegment(at: vehicleType.selectedSegmentIndex) ?? "car")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(platesTextField) {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            return updatedText.count <= 6 && string.containsValidCharacter
        } else if textField.isEqual(cylinderCapacityTextField) {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) && string.containsValidCharacter
        }
        return false
    }
}
