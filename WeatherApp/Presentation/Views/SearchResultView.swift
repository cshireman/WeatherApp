//
//  SearchResultView.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/16/24.
//

import SwiftUI

struct SearchResultView: View {
    @StateObject var viewModel: SearchResultViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.custom("Poppins-Bold", size: 20))
                    .foregroundStyle(Color.bodyText)
                
                Text(viewModel.temp)
                    .font(.custom("Poppins-Bold", size: 60))
                    .foregroundStyle(Color.bodyText)
            }
            .padding()
                     
            Spacer()
            AsyncImage(
                url: viewModel.iconURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 83, height: 83)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
        .background(Color.grayBackground)
        .cornerRadius(16)
        .frame(height: 117)

    }
}
