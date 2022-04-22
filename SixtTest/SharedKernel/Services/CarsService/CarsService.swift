//
//  CarsService.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation
import SixtTestCore

final class CarsService: ObservableObject {
    
    // MARK: - Public properties
    
    @Published private(set) var cars = [Car]()
    
    // MARK: - Private properties
    
    private let networkService: NetworkingService<CarsClient>
    
    // MARK: - Initalization
    
    init(networkService: NetworkingService<CarsClient>) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    @MainActor
    func reloadData() async throws {
        cars = try await networkService.requestDecodable(.carsList)
    }
}
