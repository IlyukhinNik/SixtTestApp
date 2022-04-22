//
//  CarMapPreviewView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import SwiftUI

struct CarMapPreviewView: View {
    
    // MARK: - Public properties
    
    let viewModel: CarMapItemViewModel
    
    // MARK: - View
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                carImageView
                
                carMainInfoView

            }

            Spacer()
            
            VStack(alignment: .leading, spacing: 20.0) {
                
                carAdditionalInfoView
                
                showDetailsButton
                
            }
            
        }
        .padding(20)
        .background(Color.background)
        .frame(maxHeight: 200)
        
    }
    
    // MARK: - Private views
    
    private var carImageView: some View {
        
        AsyncImage(url: viewModel.imageUrl) {
                $0
                .resizable()
                .scaledToFill()
            } placeholder: {
                Image(IconName.Asset.Placeholder.car)
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 120.0, height: 120.0)
            .padding(.top, -40)
            .padding(.leading, 10)
        
    }
    
    private var carMainInfoView: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            
            Text(viewModel.title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(viewModel.subtitle)
                .font(.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(.background)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background {
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Color.textColor)
                }
            
        }
        
    }
    
    private var carAdditionalInfoView: some View {
        
        VStack(alignment: .leading, spacing: 8.0) {
            
            AdditionalInfoView(info: viewModel.fuelInfo)
            
            AdditionalInfoView(info: viewModel.transmissionInfo)
            
        }
        
    }
    
    private var showDetailsButton: some View {
        
        Button {
            viewModel.handleEvent(event: .onShowDetails)
        } label: {
            Text(viewModel.detailsButtonTitle)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
    struct AdditionalInfoView: View {
        
        // MARK: - Public properties
        
        let info: AdditionalCarInfo
        
        // MARK: - View
        
        var body: some View {
            
            Text("\(info.title): \n \(info.description)")
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.background)
                .padding(4)
                .background(Color.textColor)
            
        }
        
    }
    
}

// MARK: - PreviewProvider

struct CarMapPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CarMapPreviewView(viewModel: CarMapItemViewModel(model: .testCar, navigationEventHandler: nil))
                .padding(20)
        }
        .previewDevice("iPhone 8")
        .ignoresSafeArea()
    }
}
