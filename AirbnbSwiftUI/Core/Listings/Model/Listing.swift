//
//  Listing.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerId: String
    let ownerName: String
    let ownerImageUrl: String
    
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state : String
    let title : String
    var rating : Double
    var features : [ListingFeatures]
    var amenites : [ListingAmenites]
    let type: ListingType
    var imageUrls: [String]
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subTitle: String {
        switch self {
        case .selfCheckIn: return "Check your sell in with the keypad."
        case .superHost: return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }
    
    var id: Int  { return self.rawValue}
}

enum ListingAmenites: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id: Int  { return self.rawValue}
    
    
    var title : String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "wifi"
        case .laundry: return "laundry"
        case .tv: return "tv"
        case .alarmSystem: return "alarm System"
        case .office: return "office"
        case .balcony: return "balcony"
        }
    }
    
    var imageName : String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
}


enum ListingType : Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String
    {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int  { return self.rawValue}
    
}


extension Listing {
    static func placeholder(_ index: Int = 0) -> Listing { return listings[index] }
    
    
    
    static let listings: [Listing] = [
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "John Doe",
            ownerImageUrl: "ant-man",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 6,
            numberOfBeds: 4,
            pricePerNight: 120,
            latitude: 37.7749,
            longitude: -122.4194,
            address: "123 Main St",
            city: "San Francisco",
            state: "CA",
            title: "Cozy Apartment in SF",
            rating: 4.5,
            features: [.selfCheckIn, .superHost],
            amenites: [.wifi, .kitchen, .laundry, .tv],
            type: .apartment, 
            imageUrls: ["image2", "image7", "image5"]
        ),
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "Jane Smith",
            ownerImageUrl: "captain-america",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 8,
            numberOfBeds: 5,
            pricePerNight: 200,
            latitude: 34.0522,
            longitude: -118.2437,
            address: "456 Elm St",
            city: "Los Angeles",
            state: "CA",
            title: "Luxury Villa in LA",
            rating: 4.8,
            features: [.superHost],
            amenites: [.pool, .wifi, .balcony, .alarmSystem],
            type: .villa, imageUrls: ["image3", "image8", "image1", "image6"]
        ),
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "Alice Johnson",
            ownerImageUrl: "profile-pic",
            numberOfBedrooms: 2,
            numberOfBathrooms: 1,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 90,
            latitude: 40.7128,
            longitude: -74.0060,
            address: "789 Maple St",
            city: "New York",
            state: "NY",
            title: "Charming Townhouse in NYC",
            rating: 4.7,
            features: [.selfCheckIn],
            amenites: [.wifi, .kitchen, .office],
            type: .townHouse, imageUrls: ["image7", "image3", "image10"]
        ),
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "Michael Brown",
            ownerImageUrl: "loki",
            numberOfBedrooms: 5,
            numberOfBathrooms: 4,
            numberOfGuests: 10,
            numberOfBeds: 6,
            pricePerNight: 250,
            latitude: 41.8781,
            longitude: -87.6298,
            address: "1010 Oak St",
            city: "Chicago",
            state: "IL",
            title: "Spacious House in Chicago",
            rating: 4.9,
            features: [.superHost],
            amenites: [.wifi, .kitchen, .pool, .office, .balcony],
            type: .house, imageUrls: ["image9", "image6", "image1"]
        ),
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "Emily Davis",
            ownerImageUrl: "black-widow",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 5,
            numberOfBeds: 3,
            pricePerNight: 110,
            latitude: 29.7604,
            longitude: -95.3698,
            address: "2020 Pine St",
            city: "Houston",
            state: "TX",
            title: "Modern Apartment in Houston",
            rating: 4.6,
            features: [.selfCheckIn],
            amenites: [.wifi, .kitchen, .laundry, .tv, .alarmSystem],
            type: .apartment, imageUrls: ["image4", "image2", "image10"]
        ),
        Listing(
            id: UUID().uuidString,
            ownerId: UUID().uuidString,
            ownerName: "David Wilson",
            ownerImageUrl: "gamora",
            numberOfBedrooms: 6,
            numberOfBathrooms: 5,
            numberOfGuests: 12,
            numberOfBeds: 7,
            pricePerNight: 300,
            latitude: 25.7617,
            longitude: -80.1918,
            address: "3030 Cedar St",
            city: "Miami",
            state: "FL",
            title: "Luxury Villa in Miami",
            rating: 5.0,
            features: [.superHost],
            amenites: [.wifi, .kitchen, .pool, .laundry, .balcony],
            type: .villa, imageUrls: ["image1", "image3", "image7"]
        )
    ]
}
