//
//  CarDetailView.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import SwiftUI
import MapKit

struct CarDetailView: View {
    
    // MARK: - Public properties
    
    @ObservedObject var viewModel: CarDetailViewModel
    
    // MARK: - View
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
           VStack(alignment: .leading, spacing: 35.0) {
               
               carImageView
               
               mainInfoView
                   
               additionalInfoView
               
               mapView
               
            }
       }
       .background(Color.background)
        
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
            .padding(.bottom, 50)
            .frame(height: 120)
        
    }
    
    private var mainInfoView: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            Text(viewModel.title)
                .font(.title)
                .fontWeight(.heavy)
            Text(viewModel.subtitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.horizontal, 20)
        
    }
    
    private var additionalInfoView: some View {
        
        VStack(alignment: .leading, spacing: 10.0) {
            Text(viewModel.additionalInfoTitle)
                .font(.title)
                .fontWeight(.heavy)
            
            VStack(alignment: .leading, spacing: 5) {
                AdditionalInfoView(info: viewModel.transmissionInfo)
                AdditionalInfoView(info: viewModel.fuelInfo)
                AdditionalInfoView(info: viewModel.innerCleanlinessInfo)
            }
        }
        .padding(.horizontal, 20)
        
    }
    
    private var mapView: some View {
        
        Map(coordinateRegion: .constant(viewModel.coordinateRegion),
            annotationItems: [viewModel.annotationViewModel]) { item in
            
            MapAnnotation(coordinate: item.coordinate,
                          anchorPoint: CGPoint(x: 0.5, y: 1.0),
                          content: {
                
                CarMapAnnotationView(viewModel: item)
                    .scaleEffect(3)
                
            })
            
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        
    }
    
    
    private struct AdditionalInfoView: View {
        
        let info: AdditionalCarInfo
        
        var body: some View {
            
            HStack(alignment: .center) {
                
                Text(info.title)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                
                Text(info.description)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.textColor)
                
            }
        }
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        CarDetailView(viewModel: CarDetailViewModel(model: .testCar, navigationEventHandler: nil))
    }
    
}
