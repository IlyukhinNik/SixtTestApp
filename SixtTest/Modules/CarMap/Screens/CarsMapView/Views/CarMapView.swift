//
//  MapView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import SwiftUI
import SixtTestCore
import MapKit

struct CarMapView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var viewModel: CarMapViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack {
            contentView
        }
    }
    
    // MARK: - Private views
    
    @ViewBuilder
    private var contentView: some View {
        
        switch viewModel.state {
        case .idle:
            EmptyView()
        case .map(let selectedAnnotation, let annotations):
            ZStack(alignment: .bottom) {
                
                Map(coordinateRegion: $viewModel.coordinateRegion, annotationItems: annotations) { annotationViewModel in
                    MapAnnotation(coordinate: annotationViewModel.coordinate,
                                  anchorPoint: CGPoint(x: 0.5, y: 1.0),
                                  content: {
                        CarMapAnnotationView(viewModel: annotationViewModel)
                            .onTapGesture {
                                withAnimation {
                                    
                                    viewModel.handleEvent(event: .onSelectAnnotation(selectedAnnotation: annotationViewModel, annotations: annotations))
                                }
                            }
                    })
                }
                
                if let selectedAnnotation = selectedAnnotation {
                    CarMapPreviewView(viewModel: selectedAnnotation)
                        .padding(20)
                }
                
            }.ignoresSafeArea(.container, edges: .top)
        }
        
    }

}
