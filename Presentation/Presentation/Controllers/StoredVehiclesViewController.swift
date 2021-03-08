//
//  StoredVehiclesViewController.swift
//  Presentation
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 8/03/21.
//

import UIKit
import Domain

class StoredVehiclesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Stored vehicles"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension StoredVehiclesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Parking.shared.storedVehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let vehicle = Parking.shared.storedVehicles[indexPath.row].vehicle
        let vehicleType = vehicle.vehicleType().rawValue
        let licensePlate = vehicle.getLicensePlate()
        cell.textLabel?.text = "\(vehicleType) - placa: \(licensePlate)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehicle = Parking.shared.storedVehicles[indexPath.row]
        let vc = BillViewController(storedVehicle: vehicle)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
