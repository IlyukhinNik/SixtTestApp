//
//  Car.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

struct Car: Decodable, Identifiable {
    
    // MARK: - Properties
    
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: Group
    let series: String
    let color: String
    let fuelType: FuelType
    let fuelLevel: Double
    let transmission: Transmission
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: InnerCleanliness
    let carImageUrl: String
    
}

extension Car {
    
    static let testCar = Car(id: "WMWSW31030T222518", modelIdentifier: "mini", modelName: "MINI", name: "Vanessa", make: "BMW",
                             group: .mini, series: "MINI", color: "midnight_black", fuelType: .diesel, fuelLevel: 0.7,
                             transmission: .manual, licensePlate: "M-VO0259", latitude: 48.134557, longitude: 11.576921,
                             innerCleanliness: .regular, carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png")
    
}
