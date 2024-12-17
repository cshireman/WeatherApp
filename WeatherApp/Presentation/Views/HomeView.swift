//
//  HomeView.swift
//  WeatherApp
//
//  Created by Chris Shireman on 12/16/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText = ""
    @FocusState private var isSearchFocused
    
    var body: some View {
        VStack {
            searchField
            
            if !searchText.isEmpty {
                searchResults
            } else {
                Group {
                    if viewModel.currentLocationID != nil {
                        currentWeather
                    } else {
                        noCitySelected
                    }
                }
                .frame(minHeight: 300)
                .padding(.top, 75)
            }
            
            Spacer()
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
    
    private var searchField: some View {
        SearchField(searchText: $searchText, isFocused: _isSearchFocused) {
            Task {
                await viewModel.search(query: searchText)
            }
        }
    }
    
    private var noCitySelected: some View {
        VStack(spacing: 15) {
            Text("No City Selected")
                .font(.custom("Poppins-Bold", size: 30))
            Text("Please Search For A City")
                .font(.custom("Poppins-Bold", size: 15))
        }
    }
    
    private var currentWeather: some View {
        VStack {
            AsyncImage(
                url: viewModel.iconURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 123, height: 123)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            HStack {
                Text(viewModel.name)
                    .font(.custom("Poppins-Bold", size: 30))
                Image(systemName: "location.fill")
            }
            
            Text(viewModel.temp)
                .font(.custom("Poppins-Bold", size: 70))
            
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    Text("Humidity")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.placeholderText)
                    
                    Text("\(Int(viewModel.weather?.humidity ?? 0.0))%")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.detailText)
                }
                .padding()
                         
                Spacer()
                
                VStack(alignment: .center, spacing: 4) {
                    Text("UV")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.placeholderText)
                    
                    Text("\(Int(viewModel.weather?.uv ?? 0.0))")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.detailText)
                }
                .padding()
                         
                Spacer()
                
                VStack(alignment: .center, spacing: 4) {
                    Text("Feels Like")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.placeholderText)
                    
                    Text("\(Int(viewModel.weather?.feelslikeF ?? 0.0))°")
                        .font(.custom("Poppins-Bold", size: 12))
                        .foregroundStyle(Color.detailText)
                }
                .padding()
            }
            .background(Color.grayBackground)
            .cornerRadius(16)
            .frame(width: 274, height: 117)
            .padding(.horizontal)

        }
    }
    
    @ViewBuilder
    private var searchResults: some View {
        if !viewModel.searchResults.isEmpty {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.searchResults) { location in
                        SearchResultView(viewModel: SearchResultViewModel(location: location))
                            .onTapGesture { _ in
                                viewModel.selectLocation(location)
                                searchText = ""
                            }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
