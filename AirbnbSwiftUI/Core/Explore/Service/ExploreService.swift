//
//  ExploreService.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import Foundation

class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        return Listing.listings
    }
}
