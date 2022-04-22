//
//  CarsListView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import SwiftUI
import SixtTestCore

struct CarsListView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var viewModel: CarsListViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 0) {
            contentView
        }
    }
    
    // MARK: - Private views
    
    @ViewBuilder
    private var contentView: some View {
        
        switch viewModel.state {
        case .idle:
            EmptyView()
        case .list(let listItems):
            List(listItems) { item in
                
                CarListItemView(viewModel: item)
                    .onNavigation {
                        viewModel.handleEvent(event: .onSelectCar(item))
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 24))
                    .listRowBackground(Color.background)
                
            }
            .listStyle(.plain)
        }
        
    }
}
