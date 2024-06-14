//
//  ExploreViewModel.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings : [Listing] = []
    @Published var searchLocation = ""
    private var copyListings : [Listing] = []

    
    let service = ExploreService()
    init(service: ExploreService) {
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
            copyListings = listings
        } catch {
            print("Faild to fetch listing because \(error.localizedDescription)")
        }
    }
    
    
    func updateListingForLocation() {
        let filterdListing = listings.filter( {
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filterdListing.isEmpty ? copyListings : filterdListing
    }
}
