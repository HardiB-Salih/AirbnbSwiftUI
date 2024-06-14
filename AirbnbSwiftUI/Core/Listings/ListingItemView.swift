//
//  ListingItemView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack {
            //MARK: Imagies
            ListingImageCarouselView(images: listing.imageUrls)

                
            
            //MARK: Details
            HStack (alignment: .top){
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)").fontWeight(.semibold)
                    Text("12 mi away").foregroundStyle(.gray)
                    Text("Nov 3 - 10").foregroundStyle(.gray)
                    
                    (
                        Text("$\(listing.pricePerNight) ").fontWeight(.semibold) +
                        Text("night")
                    )
                }
                .font(.footnote)
                
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating.formattedToOneDecimal)")
                }
            }
            
        }
//        .padding()
        
    }
}

#Preview {
    ListingItemView(listing: .placeholder(4))
}
