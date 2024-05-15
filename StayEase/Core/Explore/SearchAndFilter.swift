//
//  SearchAndFilter.swift
//  StayEase
//
//  Created by Vishal Verma on 2024-03-05.
//

import SwiftUI

struct SearchAndFilter: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment: .leading, spacing: 2){
                Text("Where to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("AnyWhere - AnyWeek - AnyGuest")
                    .font(.caption2)
                    .foregroundColor(.gray)
                
                
            }
            Spacer()
            Button(action: {}, label:  {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
        
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4) ,radius: 2)
            
            
        }
        .padding()
        
        
    }
}

struct SearchAndFilter_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilter()
    }
}
