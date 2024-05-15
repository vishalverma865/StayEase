//
//  Listing.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-24.
//

import Foundation

struct Listing {
    let id:String
    let hostUid:String
    let hostName:String
    let hostProfileImageURL:String
    let propTitle:String
    let propImagesURLs:[String]
    let longitude: Double
    let latitude: Double
//    var propAddress: String {
//               return "Longitude: \(longitude), Latitude: \(latitude)"
//           }
    let address:String
    let city:String
    let State:String
    let numberOfBedRoom:Int
    let numberOfBed:Int
    let numberofBaths:Int
    let guestCount:Int
    let pricePerNight:Double
    let rating:Double
    var feature: [listingFeature]
    var amenities: [ListingAmenities]
    var type: listingType
    
}

enum listingFeature {
    case selfCheckIn
    case superHost
    
    var imageName:String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
            
        }
    }
    var title:String {
        switch self {
        case .selfCheckIn: return "Self Checkin"
        case .superHost: return "SuperHost"
        }
    }
    var subTitle:String {
        switch self {
        case .selfCheckIn: return "Check yourself in with the key"
        case .superHost: return "Superhost are experienced, highly rated hosts who are commited to providing greater stars for guests"
        }
    }

}

enum ListingAmenities {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    var title:String {
        
        switch self{
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
        
    }
    
    var imageName:String {
        
        switch self{
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
        
    }
}
    
    enum listingType:String {
        case apartment
        case house
        case townHouse
        case villa
        var description:String {
            switch self {
            case .apartment: return "Apartment"
            case .house: return "House"
            case .townHouse: return "TownHouse"
            case .villa: return "Villa"
                
            }
        }
    }

