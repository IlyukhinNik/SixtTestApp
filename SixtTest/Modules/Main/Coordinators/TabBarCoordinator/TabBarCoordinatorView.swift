//
//  TabBarCoordinatorView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import SwiftUI
import Combine
import SixtTestCore

struct TabBarCoordinatorView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var object: TabBarCoordinatorObject
    
    // MARK: - View
    
    var body: some View {
        VStack {
            contentView
        }.task {
            await object.loadData()
        }
    }
    
    // MARK: - Private views
    
    @ViewBuilder
    private var contentView: some View {
        
        switch object.state {
        case .idle:
            ZStack {
                Color.background
            }
            .ignoresSafeArea()
        case .loading:
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
        case .loaded:
            TabView(selection: $object.tab) {
                
                CarListCoordinatorView(object: object.carListCoordinatorObject)
                    .tabItem { Label(Tab.list.title, systemImage: Tab.list.imageName) }
                    .tag(Tab.list)
                
                CarMapCoordinatorView(object: object.carMapCoordinatorObject)
                    .tabItem { Label(Tab.map.title, systemImage: Tab.map.imageName) }
                    .tag(Tab.map)
                
            }
        case . loadError(let error):
            ZStack {
                Color.background
                VStack(alignment: .center, spacing: 20.0) {
                    
                    Text(error.localizedDescription)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.textColor)
                    
                    reloadButton
                }
            }
        }
    }
    
    private var reloadButton: some View {
        
        Button {
            Task {
                await object.loadData()
            }
        } label: {
            Text(Localizable.Button.reload)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)

    }
    
}
