//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/16/24.
//

import SwiftUI

struct WeatherDetailView: View {
    let weather: Weather?
    
    var body: some View {
        HStack {
            makeDetailStack(title: "Humidity", value: "\(Int(weather?.humidity ?? 0.0))%")
            Spacer()
            makeDetailStack(title: "UV", value: "\(Int(weather?.uv ?? 0.0))")
            Spacer()
            makeDetailStack(title: "Feels Like", value: "\(Int(weather?.feelslikeF ?? 0.0))°")
        }
        .background(Color.grayBackground)
        .cornerRadius(16)
        .frame(width: 274, height: 117)
        .padding(.horizontal)
    }
    
    func makeDetailStack(title: String, value: String) -> some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.custom("Poppins-Regular", size: 12))
                .foregroundStyle(Color.placeholderText)
            
            Text(value)
                .font(.custom("Poppins-Bold", size: 12))
                .foregroundStyle(Color.detailText)
        }
        .padding()
    }
}

#Preview {
    WeatherDetailView(weather: nil)
}
