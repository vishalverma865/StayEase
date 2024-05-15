//
//  ListingDetailView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-06.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    var cellId:Int
    var propertyAds = AdData()
  
    var images = [
        "a1",
        "a2",
        "listing_3"
    ]
    //var latitude = propertyAds.propDetails.description
    var latitude: String {
            propertyAds.propDetails.description
        }
    
   
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 25.7617,
                longitude: 80.1918
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 10,
                longitudeDelta: 10
            )
        )

    @Environment(\.dismiss) var dismiss // create variable to dismiss the current screen and go to initial screen.... by call this variable inside from button
    
    
    
    var body: some View {
        
        let propDetail = propertyAds.propDetails[cellId]

        ScrollView{
            //            TabView{
            //                ForEach(images, id:\.self) {image in
            //                    Image(image)
            //
            //                }
            //            }
            //                .frame(height: 320)
            //                .clipShape(RoundedRectangle(cornerRadius: 10))
            //                .tabViewStyle(.page)
            
           
            //MARK: Ad pictures
            ZStack(alignment: .topLeading){
                ListingComponentViews(cellId: cellId)
                    .frame(height: 320)
                
                Button {
                   
                    dismiss()
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 42, height: 32)
                        }
                        .padding(30)
                        .padding(.top)
                        .padding(.top)
                    
                       
                    
                }
            }
            
            
            
            //MARK: Ad info
            VStack(alignment: .leading, spacing: 8){
                Text(propDetail.propTitle)
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                VStack(alignment:.leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("4.6")
                        Text("-")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    Text("\(propDetail.city), \(propDetail.State)")
                }
                .font(.caption)
                
                
            }
            
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
Group{   // here group is used to hold V,H,S stack views if they are more then 10. In swift ui we are not allowed to use more than 10 views in single container:- good for code readability
            
            //MARK: Host listing Info
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire Villa hosted by")
                        .fontWeight(.semibold)
                        .font(.headline)
                    Text(propDetail.hostName)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    HStack(spacing: 2){
                        Text("\(propDetail.guestCount) Guests")
                        Text("-")
                        Text("\(propDetail.numberOfBedRoom) bedrooms")
                        Text("-")
                        Text("\(propDetail.numberOfBed) beds")
                        Text("-")
                        Text("\(propDetail.numberofBaths) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                Image(propDetail.hostProfileImageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            
            
            
            //MARK: Ad Details
            VStack(alignment:.leading, spacing: 16){
                ForEach(0..<propDetail.feature.count) { feature in
                    HStack(spacing:12){
                        Image(systemName: propDetail.feature[feature].imageName)
                        VStack(alignment:.leading){
                            Text(propDetail.feature[feature].title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(propDetail.feature[feature].subTitle)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            //Here  maxWidth is used to shift the medal and self check text to left edge
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Divider()
            
            
            //MARK: Number of Bedroom
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        
                        ForEach(1..<propDetail.numberOfBedRoom+1) { bed in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bed)")
                            }
                            .frame(width: 132, height: 100)
                            
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                
                                    .foregroundStyle(Color(.systemGray4))
                                    .shadow(color: .black.opacity(0.4) ,radius: 2)
                                
                            }
                        }
                    }
                    
                    
                }
            }
            .padding()
            Divider()
            
            
            
            //MARK: Offers with Booking
            VStack(alignment:.leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach (0..<propDetail.amenities.count) {offer in
                    HStack{
                        Image(systemName: propDetail.amenities[offer].imageName)
                            .frame(width: 32)
                        Text(propDetail.amenities[offer].title)
                            .font(.footnote)
                        Spacer()
                        
                    }
                }
                
            }
            
            .padding()
            
}           // group end
            
            Divider()
            
            VStack(alignment: .leading){
                Text("Where you'll be")
                    .font(.headline)
               Map(coordinateRegion: $region)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(height:200)
                    
            }
           .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()// This is to cover all the area around the upper notch
        .padding(.bottom, 64) // this is because when we scroll down the map will get cover with buttom reserve stack
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading, spacing: 2){
                        Text(String(format: "$%.2f", propDetail.pricePerNight))
                            .fontWeight(.bold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    Spacer()
                    Button{
                        
                    } label: {
                        Text("Reserve")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                            
                    }
                    
                }
                .padding(.horizontal)
         
            }
           // .preferredColorScheme(.dark)
            .background(Color.white)
            .preferredColorScheme(.light)
        }
    
        
        
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(cellId: 1)
    }
}
