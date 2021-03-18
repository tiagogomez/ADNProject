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
    private var parkingService: ParkingService?
    
    private let viewTitle = "Stored vehicles"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = viewTitle
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.parkingService = appDelegate.diContainer.getContainer().resolve(ParkingService.self)!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension StoredVehiclesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingService?.getParkedVehicles().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let storedVehicles = parkingService?.getParkedVehicles()
        let vehicle = storedVehicles?[indexPath.row].vehicle
        let vehicleType = vehicle?.vehicleType().rawValue ?? "-"
        let licensePlate = vehicle?.getLicensePlate() ?? "-"
        cell.textLabel?.text = "\(vehicleType) - placa: \(licensePlate)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storedVehicles = parkingService?.getParkedVehicles()
        guard let vehicle = storedVehicles?[indexPath.row] else { return }
        let vc = BillViewController(storedVehicle: vehicle)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
