//
//  ListingImageCarouselView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI


struct ListingImageCarouselView: View {
    
    let images: [String]
    let cornerRadius: CGFloat
    let height: CGFloat
    let alignment: Alignment
    let systemName: String
    let action: () -> Void
    
    init(
        images: [String],
        cornerRadius: CGFloat = 16,
        height: CGFloat = 320,
        alignment: Alignment = .topTrailing,
        systemName: String = "suit.heart",
        action: @escaping () -> Void = { }
    ) {
        self.images = images
        self.cornerRadius = cornerRadius
        self.height = height
        self.alignment = alignment
        self.systemName = systemName
        self.action = action
    }
    
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
        .frame(height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .overlay(alignment: alignment) {
            if alignment == .topTrailing {
                ListingActionButtonView(
                    systemName: systemName,
                    alignment: alignment,
                    action: action
                )
            } else {
                ListingActionButtonView(
                    systemName: systemName,
                    alignment: alignment,
                    action: action
                )
                    
            }
        }
    }
}

#Preview(body: {
    ListingImageCarouselView(images: ["home1","home2","home3","home4","home5"])
})


struct ListingActionButtonView: View {
    let systemName : String
    let alignment: Alignment
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemName)
                .imageScale(.large)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(alignment == .topTrailing ? Color(.white) : Color(.darkGray))
                .padding(alignment == .topTrailing ? 8 : 12)
                .background( alignment == .topTrailing ?  Color(.clear) : Color(.systemGray6))
                .clipShape(Circle())  
        })
        .offset(x: alignment == .topTrailing ? -10 : 20, y: 20)
    }
}


