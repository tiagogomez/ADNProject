//
//  BillViewController.swift
//  Presentation
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 8/03/21.
//

import UIKit
import Domain

class BillViewController: UIViewController {
    
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var ccLabel: UILabel!
    @IBOutlet weak var vehicleType: UILabel!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var numberOfHoursLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    private var parkingService: Parking?
    
    let storedVehicle: StoredVehicle
    let billService = Bill()
    
    init(storedVehicle: StoredVehicle) {
        self.storedVehicle = storedVehicle
        super.init(nibName: nil, bundle: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.parkingService = appDelegate.diContainer.getContainer().resolve(Parking.self)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bill View"
        self.plateLabel.text = storedVehicle.vehicle.getLicensePlate()
        self.ccLabel.text = String(storedVehicle.vehicle.getCylinderCapacity())
        self.vehicleType.text = storedVehicle.vehicle.vehicleType().rawValue
        let (days, hours) = billService.getStayedDaysAndHours(from: storedVehicle.entryDate, to: Date())
        self.numberOfDaysLabel.text = String(days)
        self.numberOfHoursLabel.text = String(hours)
        let cost = billService.generateBill(for: storedVehicle, with: Date())
        priceLabel.text = String(cost)
    }
    
    @IBAction func exitVehicleButtonPressed(_ sender: Any) {
        parkingService?.exitVehicle(storedVehicle: storedVehicle)
        self.navigationController?.popViewController(animated: true)
    }
}
