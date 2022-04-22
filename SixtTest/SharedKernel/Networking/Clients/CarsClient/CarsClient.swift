//
//  File.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation
import SixtTestCore

enum NetworkingConstants {
    static let serverURL = URL(string: "https://cdn.sixt.io")!
    static let baseHeaders: [String: String] = ["Content-Type": "application/json"]
}


enum CarsClient: TargetType {
    
    case carsList
    
    var baseURL: URL { NetworkingConstants.serverURL }
    
    var path: String {
        switch self {
        case .carsList:
            return "/codingtask/cars"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .carsList:
            return .get
        }
    }
    
    var sampleData: Data { "CarListMock.json".fileToData() }
    
    var task: NetworkTask {
        switch self {
        case .carsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? { nil }
}
