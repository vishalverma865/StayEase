//
//  ProfileView.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.semibold)
        Text("Log In to start planning your new trip")
                
            Text("  ")
            Button{
                
            } label: {
                Text("Log in")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            
            .frame(width: 360, height: 48)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text("  ")
            HStack{
                Text("Dont have an account?")
                    //.font(.caption)
                Button{
                    
                } label: {
                    Text("Sign up")
                        .font(.caption)
                        .foregroundStyle(.black)
                        .underline()
                        .fontWeight(.bold)
                }
                
            }
            Text(" ")
            
            ExtractedView(serviceName: "Settings", serviceIamge: "gear")
            Divider()
            ExtractedView(serviceName: "Accessbility", serviceIamge: "gear")
            Divider()
            ExtractedView(serviceName: "Visit the help center", serviceIamge: "questionmark.circle")

            Divider()
            
        }
        .padding()
        
    }
}

#Preview {
    ProfileView()
}

struct ExtractedView: View {
    let serviceName:String
    let serviceIamge:String

    var body: some View {
        Button{
        } label: {
            HStack{
                Image(systemName: serviceIamge)
                    .imageScale(.small)
                    .foregroundStyle(.black)
                Text(serviceName)
                    .foregroundStyle(.black)
                    .font(.headline)
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                }
            }
            //.padding()
        }
           
        
    }
}
