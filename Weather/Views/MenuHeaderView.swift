//
//  MenuHeaderView.swift
//  Weather
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 23.05.2021.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "Moscow"
    
    var body: some View {
        
        HStack {
            
            TextField("", text: $searchTerm)
                .padding()
            
            Button(action: {
                cityVM.city = searchTerm
            }, label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                
                Image(systemName: "location.fill")
                
            })
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
                
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}


