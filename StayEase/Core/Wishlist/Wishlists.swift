//
//  Wishlists.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-24.
//

import SwiftUI

struct Wishlists: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading, spacing: 32){
                
                VStack(alignment:.leading, spacing: 4){
                    Text("Log in to view your wishlists.")
                    
                        .font(.headline)
                    
                    Text("You can create view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                Button{
                    print("Login")
                } label: {
                    Text("Log in")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    Wishlists()
}
