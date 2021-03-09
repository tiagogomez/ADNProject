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
    private var parkingService: Parking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        platesTextField.delegate = self
        cylinderCapacityTextField.delegate = self
        self.title = "Parking view"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.parkingService = appDelegate.diContainer.getContainer().resolve(Parking.self)!
    }
    
    @IBAction func entryVehicleButtonPressed(_ sender: Any) {
        guard let platesText = platesTextField.text, !platesText.isEmpty,
              let ccText = cylinderCapacityTextField.text, !ccText.isEmpty else {
            self.present(setupAlert(message: "Debe ingresar una placa y un cilindraje"),
                         animated: true,
                         completion:nil)
            return
        }
        getInputData()

        do {
            try parkingService?.enterVehicle(licensePlate: plateString ?? String(),
                                             cylinderCapacity: ccValue ?? Int(),
                                             type: vehicleTypeString ?? .car)
        }  catch ParkingErrors.PlateAlreadyIngressed(let message) {
            self.present(setupAlert(message: message), animated: true, completion:nil)
            return
        } catch ParkingErrors.InvalidPlateForDay(let message) {
            self.present(setupAlert(message: message), animated: true, completion:nil)
            return
        } catch ParkingErrors.NoCapacityForVehicle(let message) {
            self.present(setupAlert(message: message), animated: true, completion:nil)
            return
        } catch {
            self.present(setupAlert(message: "No se pudo realizar el ingreso del vehículo"), animated: true, completion:nil)
            return
        }
        self.present(setupAlert(message: "Su vehículo ingresó correctamente",
                                title: "Ingreso exitoso"), animated: true, completion:nil)
        clearFields()
    }
    
    private func setupAlert(message: String, title: String = "No puede ingresar") -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
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
