//
//  ExploreView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView  = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                VStack {
                    SearchAndFilterBar(searchLocation: $viewModel.searchLocation)
                        .onTapGesture {
                            showDestinationSearchView.toggle()
                        }
                    
                    ScrollView {
                        LazyVStack (spacing: 32){
                            ForEach(viewModel.listings) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                }
                            }
                        }.padding()
                    }
                }
                .navigationDestination(for: Listing.self, destination: { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                })
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .animation(.snappy, value: showDestinationSearchView)
    }
}

#Preview {
    ExploreView()
}
