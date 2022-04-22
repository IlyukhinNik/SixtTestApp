//
//  CarMapAnnotationView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 20.04.2022.
//

import SwiftUI

struct CarMapAnnotationView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var viewModel: CarMapItemViewModel
    
    // MARK: - View
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            Image(viewModel.groupImageName)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .padding(5)
                .background(Color.background)
                .tint(.textColor)
            
            Image(systemName: IconName.System.triangleFill)
                .resizable()
                .scaledToFit()
                .foregroundColor(.background)
                .frame(width: 6, height: 6, alignment: .top)
                .rotationEffect(.degrees(180))
                .offset(y: -2)

        }
        .scaleEffect(viewModel.state == .selected ? 1.5 : 1)
        .opacity(viewModel.state == .hidden ? 0 : 1)
        
    }
    
}

// MARK: - PreviewProvider

struct CarMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CarMapAnnotationView(viewModel: CarMapItemViewModel(model: Car.testCar, navigationEventHandler: nil))
        }.ignoresSafeArea()
    }
}
