//
//  CarMapCoordinatorView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import SwiftUI
import SixtTestCore

struct CarMapCoordinatorView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var object: CarMapCoordinatorObject
    
    // MARK: - View
    
    var body: some View {
        
        NavigationView {
            
            CarMapView(viewModel: object.mapViewModel)
                .navigationBarHidden(true)
                .background(Color.background)
                .navigation(item: $object.detailViewModel ) { CarDetailView(viewModel: $0)}
            
        }
        
    }
}
