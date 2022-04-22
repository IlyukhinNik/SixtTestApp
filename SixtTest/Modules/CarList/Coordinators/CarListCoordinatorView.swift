//
//  CarListCoordinatorView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 20.04.2022.
//

import SwiftUI
import SixtTestCore

struct CarListCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var object: CarListCoordinatorObject
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            CarsListView(viewModel: object.listViewModel)
                .navigationBarHidden(true)
                .background(Color.background)
                .navigation(item: $object.detailViewModel ) { CarDetailView(viewModel: $0)}
        }
    }
}
