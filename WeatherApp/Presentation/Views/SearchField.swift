//
//  SearchField.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/16/24.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    
    var onSubmit: () -> Void = {}
    
    var body: some View {
        HStack {
            TextField("", text: $searchText, prompt: Text("Search Location"))
                .foregroundStyle(Color.bodyText)
                .onSubmit {
                    onSubmit()
                }
                .padding(.vertical, 11)
                .padding(.horizontal, 20)
                .font(.custom("Poppins-Regular", size: 15.0))
                .background(Color.grayBackground)
                .foregroundColor(.bodyText)
                    
            Image(systemName: "magnifyingglass")
                .frame(width: 17.49, height: 17.49)
                .foregroundColor(.placeholderText)
                .padding(.trailing, 20)
        }
        .background(Color.grayBackground)
        .cornerRadius(18)
        .padding()
    }
}

