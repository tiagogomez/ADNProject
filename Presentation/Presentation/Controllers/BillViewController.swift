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
    private var parkingService: ParkingService?
    
    let storedVehicle: StoredVehicle
    let billService = BillService(billEntity: BillEntity())
    
    init(storedVehicle: StoredVehicle) {
        self.storedVehicle = storedVehicle
        super.init(nibName: nil, bundle: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.parkingService = appDelegate.diContainer.getContainer().resolve(ParkingService.self)!
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
        let bill = billService.generateBill(for: storedVehicle, with: Date())
        self.numberOfDaysLabel.text = String(bill.stayedDays ?? 0)
        self.numberOfHoursLabel.text = String(bill.stayedHours ?? 0)
        priceLabel.text = String(bill.billCost ?? 0)
    }
    
    @IBAction func exitVehicleButtonPressed(_ sender: Any) {
        parkingService?.exitVehicle(storedVehicle: storedVehicle)
        self.navigationController?.popViewController(animated: true)
    }
}
