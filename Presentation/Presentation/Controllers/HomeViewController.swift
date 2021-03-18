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
    private var parkingService: ParkingService?
    
    private let viewTitle = "Parking view"
    private let noDataErrorMessage = "Debe ingresar una placa y un cilindraje"
    private let errorMessageTitle = "No puede ingresar"
    private let defaultErrorMessage = "No se pudo realizar el ingreso del vehículo"
    private let successfulEntryMessage = "Su vehículo ingresó correctamente"
    private let successfulEntryTitle = "Ingreso exitoso"
    private let okButtonString = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        platesTextField.delegate = self
        cylinderCapacityTextField.delegate = self
        self.title = viewTitle
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.parkingService = appDelegate.diContainer.getContainer().resolve(ParkingService.self)!
    }
    
    @IBAction func entryVehicleButtonPressed(_ sender: Any) {
        guard let platesText = platesTextField.text, !platesText.isEmpty,
              let ccText = cylinderCapacityTextField.text, !ccText.isEmpty else {
            self.present(setupAlert(message: noDataErrorMessage, title: errorMessageTitle),
                         animated: true,
                         completion:nil)
            return
        }
        getInputData()

        do {
            try parkingService?.enterVehicle(licensePlate: plateString ?? String(),
                                             cylinderCapacity: ccValue ?? Int(),
                                             type: vehicleTypeString ?? .car)
        } catch let error as ParkingErrors {
            self.present(setupAlert(message: error.errorDescription, title: errorMessageTitle),
                         animated: true,
                         completion:nil)
            return
        } catch {
            self.present(setupAlert(message: defaultErrorMessage, title: errorMessageTitle),
                         animated: true,
                         completion:nil)
            return
        }
        self.present(setupAlert(message: successfulEntryMessage, title: successfulEntryTitle),
                     animated: true,
                     completion:nil)
        clearFields()
    }
    
    @IBAction func exitVehicleButtonPressed(_ sender: Any) {
        let vc = StoredVehiclesViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private func setupAlert(message: String, title: String) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: okButtonString, style: .default, handler: nil)
        alert.addAction(alertAction)
        return alert
    }
    
    private func clearFields() {
        platesTextField.text = String()
        cylinderCapacityTextField.text = String()
    }
    
    private func getInputData() {
        plateString = platesTextField.text
        ccValue = Int(cylinderCapacityTextField.text ?? "0")
        vehicleTypeString = VehicleType(rawValue: vehicleType.titleForSegment(at: vehicleType.selectedSegmentIndex) ?? "car")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(platesTextField) {
            let currentText = textField.text ?? String()
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

fileprivate extension String {
    
    // Si hay muchas crear carpeta aparte String+CheckValidCharacters
    // Si son especificas de un proyecto crear clase propia
    var containsValidCharacter: Bool {
        guard self != "" else { return true }
        let hexSet = CharacterSet(charactersIn: "1234567890ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")
        let newSet = CharacterSet(charactersIn: self)
        return hexSet.isSuperset(of: newSet)
    }
}
