//
//  ExploreView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-03.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationView = false
    var propertyAds = AdData()
    var count = 0
    var body: some View {
        
        
        NavigationStack{
            if showDestinationView {
                DestinationSearchView(show: $showDestinationView)
            }
            else {
                ScrollView{
                    
                    SearchAndFilter()
                        .onTapGesture {
                            showDestinationView.toggle()
                        }
                    LazyVStack(spacing: 32){
                        ForEach(1...propertyAds.propDetails.count, id: \.self) { listing in
                            
                           
                            NavigationLink(value: listing) {
                                ListingItemView(id:listing-1, city: propertyAds.propDetails[listing - 1].city, pricePerNight: propertyAds.propDetails[listing - 1].pricePerNight, rating: propertyAds.propDetails[listing - 1].rating)
                                    .frame(height:400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                           
                               
                        }
                        
                    }
                    .navigationDestination(for: Int.self) { listing in
                       
                        ListingDetailView(cellId: listing-1)
                            .navigationBarBackButtonHidden()
                        
                    }
                }
            }
           
        }
        
        
        
        
    }
}


struct ExlporeView: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}



/*
 
 
 

 */
