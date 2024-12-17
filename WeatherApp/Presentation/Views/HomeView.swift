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
    
    var body: some View {
        VStack {
            searchField
            if !searchText.isEmpty {
                searchResults
            } else {
                mainView
                    .frame(minHeight: 300)
                    .padding(.top, 75)
            }
            
            Spacer()
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.isError) {
            Button("Close", role: .cancel) {}
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
    
    private var searchField: some View {
        SearchField(searchText: $searchText) {
            Task {
                await viewModel.search(query: searchText)
            }
        }
    }
    
    @ViewBuilder
    private var mainView: some View {
        if viewModel.currentLocationID != nil {
            currentWeather
        } else {
            noCitySelected
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
        VStack(spacing: 35) {
            VStack(spacing: 24) {
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
                        .font(.custom("Poppins-Regular", size: 30))
                    Image(systemName: "location.fill")
                }
                
                Text(viewModel.temp)
                    .font(.custom("Poppins-Regular", size: 70))
            }
            
            WeatherDetailView(weather: viewModel.weather)
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
                    .padding()
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
