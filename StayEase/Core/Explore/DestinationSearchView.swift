//
//  DestinationSearchView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-20.
//

import SwiftUI

enum searchOptions {
    case location
    case date
    case guests
}




struct DestinationSearchView: View {
    @Binding var show:Bool

    @State private var textFieldLocation = ""       //Store value recevied from text field
    @State private var   LocationString = "destination" // String to show selected location
    @State private var dateText = "Add dates"   //String to Show Date after selection
    @State private var guestText = "Add guests" //String to show guest counts if
    @State private var guestCounts = 0          // store stepper value for guest count
    @State private var startDate = Date()       //start date by user
    @State private var endDate = Date()          // end date by user
    @State private var searchOption:searchOptions = .guests // enum toggle for animation for all the stacks
    
    
    var body: some View {
        VStack{
            HStack {
                Button{
                    show.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.black)
                        .imageScale(.large)
            }
                Spacer()
                if (textFieldLocation != "" || guestCounts != 0 || dateText != "Add dates") {
                    Button("Clear") {
                       textFieldLocation = ""
                        guestText = "Add guests"
                        guestCounts = 0
                        dateText = "Add dates"
                        startDate = Date()
                        endDate = Date()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            
            }
            .padding()
            
            
            
            //Get Location
 //MARK: Where to: get Location
            
            VStack{
                if searchOption == .location {
                    VStack(alignment:.leading){
                        Text("Where to ?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Enter your location", text: $textFieldLocation)
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            
                        }
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 3)
                        
                        
                        Spacer()
                       
                            .fontWeight(.semibold)
                    }
                    .frame(height: 100)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 10)
                    .padding()
                }
                else{
                    if textFieldLocation != "" {
                        collapsedPickerView(title: "Where", description: textFieldLocation)
                            .onTapGesture {
                        guestText = guestCounts != 0 ? "\(guestCounts) guests" : guestText
                        dateText = dateFormat(date: startDate)
                        searchOption = .location
                            }
                    }
                    else{
                        collapsedPickerView(title: "Where", description: LocationString)
                            .onTapGesture {
                                dateText = dateFormat(date: startDate)
                                guestText = guestCounts != 0 ? "\(guestCounts) guests" : "guests"
                                searchOption = .location
                            }
                    }
                }
                
//MARK: When: get Date
                
                
                if searchOption == .date {
                    VStack(alignment: .leading){
                        Text("When's your trip?")
                            .font(.title3)
                            .fontWeight(.semibold)
                            
                        VStack{
                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                            
                                .font(.headline)
                                .foregroundColor(.gray)
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                                .font(.headline)
                                .foregroundColor(.gray)
                           
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 10)
                    .padding()
                    
                   
                }

                else{
                    collapsedPickerView(title: "When", description: dateText)
                        .onTapGesture {
                            guestText = guestCounts != 0 ? "\(guestCounts) guests" : guestText
                            searchOption = .date
                        }
                }
                
//MARK: Wh0: get how many
 
                if searchOption == .guests {
                    VStack(alignment: .leading){
                        Text("Who's Coming?")
                            .font(.title3)
                            .fontWeight(.semibold)
                            
                        HStack{
                            Text(" \(guestCounts) Adults")
                                .font(.headline)
                            
                            Spacer()
                            Stepper(value: $guestCounts, in: 0...10) {
                               
                            }
                            
                        }
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 10)
                    .padding()
   
                    
                }
                
                else{
                    collapsedPickerView(title: "Who", description: guestText)
                        .onTapGesture {
                            
                            dateText = dateFormat(date: startDate)
                            searchOption = .guests
                        }
                }
        
                
           Spacer()
        }
    }
        
      
    }
}



struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(show: .constant(false))
    }
}
//MARK: CollapsedView
struct collapsedPickerView: View {
    let title:String
    let description:String
    
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(description)
                .fontWeight(.semibold)
        }
        .frame(height: 40)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 10)
        .padding()
    }
}


//MARK: Date Format Function
func dateFormat(date:Date)->String {
    let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
   return "\(dateFormatter.string(from: date))"
}
