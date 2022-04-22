//
//  CarListItemView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import SwiftUI

struct CarListItemView: View {
    
    // MARK: - Public properties
    
    let viewModel: CarsListItemViewModel
    
    // MARK: - View
    
    var body: some View {
        HStack(alignment: .top) {
                carInfoView
                
                Spacer()
                
                carImageView
            }
            .padding(.horizontal, 20.0)
            .padding(.bottom, 15)
    }
    
    // MARK: - Private views
    
    private var carInfoView: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(viewModel.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.textSecondaryColor)
                .padding(5)
                .background(Color.main)
            
            Text(viewModel.subtitle)
                .font(.caption)
                .fontWeight(.medium)
            
        }
        .padding(.top, 25.0)
    }
    
    private var carImageView: some View {
        
        AsyncImage(url: viewModel.imageUrl) { image in
            image
                .resizable()
        } placeholder: {
            Image(IconName.Asset.Placeholder.car)
                .resizable()
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: 140.0, height: 120.0)
        .padding(.top, -10)
        
    }
}

// MARK: - PreviewProvider

struct CarListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CarListItemView(viewModel: CarsListItemViewModel(model: .testCar))
        
    }
    
}
