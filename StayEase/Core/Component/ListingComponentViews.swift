//
//  ListingComponentViews.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-07.
//

import SwiftUI

struct ListingComponentViews: View {
    
    var cellId:Int
//    var images = [
//        "a1",
//        "listing_2",
//        "listing_3"
//    ]
    
   
    var propertyAds = AdData()
   // var image = propertyAds.propDetails[].
    
    
    
    
    
    
    
    var body: some View {
        
        TabView{
            ForEach(propertyAds.propDetails[cellId].propImagesURLs, id:\.self) {image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                
            }
        }
          //  .frame(height: 320)
            //.clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
    }
}

struct ListingComponentViews_Previews: PreviewProvider {
    static var previews: some View {
        ListingComponentViews(cellId:1)
    }
}
