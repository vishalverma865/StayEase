//
//  ListingItemView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-03.
//

import SwiftUI

struct ListingItemView: View {
    var id:Int
    var city:String
    var pricePerNight:Double
    var rating:Double
    
    //let formattedDoubleString = String(format: "%.2f", doubleValue)

    var body: some View {
        VStack(spacing: 8){
                //Image
            ListingComponentViews(cellId: id)
            
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            
       //item name and details
            HStack(alignment:.top){
                //details
                VStack(alignment: .leading){
                    Text(city)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("34 mi away")
                        .foregroundColor(.gray)
                    Text("March 5- 10")
                        .foregroundColor(.gray)
                    HStack(spacing:4){
                        Text(String(format: "$%.2f", pricePerNight))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                        
                    }
                    
                }
                Spacer()
                HStack{
                   Image(systemName: "star.fill")
                        .foregroundStyle(.black)
                    Text(String(format: "%.2f", rating))
                        .foregroundStyle(.black)
                        
                }
                //rating
            }
            .font(.footnote)
            
        }
        .padding()
       
    }
       
}

struct ListingItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemView(id: 4, city: "Windor", pricePerNight: 70, rating: 5.6)
    }
}
