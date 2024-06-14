//
//  ListingDetailView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    @State private var cameraPostion: MapCameraPosition
    
    init(
        listing: Listing
    ) {
        self.listing = listing
        let center = CLLocationCoordinate2D(
            latitude: listing.latitude,
            longitude: listing.longitude
        )
        let region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        )
        self._cameraPostion = State(initialValue: .region( region ))
    }
    
    var body: some View {
        ScrollView {
            ListingImageCarouselView(
                images: listing.imageUrls,
                cornerRadius: 0,
                alignment: .topLeading,
                systemName: "chevron.backward",
                action: { dismiss() }
            )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .semibold()
                
                VStack(alignment: .leading) {
                    HStack (spacing: 2){
                        Image(systemName: "star.fill")
                        Text("\(listing.rating.formattedToOneDecimal)")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .semibold()
                    }
                    Text("\(listing.city), \(listing.state)")
                    .caption()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding()
            
            Divider()
            
            //MARK: Host Info View
            HStack {
                VStack (alignment: .leading){
                    Text("Entier \(listing.type.description) hosted by \n\(listing.ownerName)")
                        .headline()
                    
                    HStack {
                        Text("\(listing.numberOfGuests) guets -") +
                        Text("\(listing.numberOfBedrooms) bedrooms -") +
                        Text("\(listing.numberOfBeds) bed -") +
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .caption()
                }
                
                Spacer()
                Image(listing.ownerImageUrl)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .scaledToFill()
                    .background(Color(.systemPurple))
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            //MARK: Listing Feature
            VStack (alignment: .leading , spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack (spacing: 12){
                        Image(systemName: feature.imageName)
                        VStack (alignment: .leading){
                            Text(feature.title).footnote().semibold()
                            Text(feature.subTitle)
                                .caption()
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //MARK: Where you sleep
            VStack (alignment: .leading) {
                Text("Where you sleep").headline()
                
                ScrollView (.horizontal){
                    HStack (spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { beadroom in
                            VStack (alignment: .leading, spacing: 12) {
                                Image(systemName: "bed.double.fill")
                                Text("Beadroom \(beadroom)")
                            }
                            .frame(width: 140, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                    .stroke(Color(.systemGray4), lineWidth: 1.0)
                            }
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                
            }
            .padding(.horizontal)
            
            Divider()
            
            //MARK: listing amenities
            VStack (alignment: .leading, spacing: 16){
                Text("What this Place Offers")
                    .headline()
                
                ForEach(listing.amenites) { amenite in
                    HStack {
                        Image(systemName: amenite.imageName)
                        Text(amenite.title).footnote()
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
            VStack (alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .headline()
                
                Map(position: $cameraPostion)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
            .padding(.horizontal)
        }
        .toolbar(.hidden, for: .tabBar)
        .scrollIndicators(.hidden)
        .padding(.bottom, 64)
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(8)
                
                HStack {
                    
                    VStack (alignment: .leading){
                        Text("$\(listing.pricePerNight)").semibold()
                        Text("Total before taxes")
                        Text("Oct 15 - 20")
                    }
                    
                    Spacer()
                    Button("Reserve") {
                        
                    }
                    .foregroundStyle(.white)
                    .subheadline()
                    .semibold()
                    .frame(width: 140, height: 40)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
            }
            .padding(.horizontal)
            .background(Color(.systemBackground))
            
        }
    }
}

#Preview {
    ListingDetailView(listing: .placeholder() )
}
