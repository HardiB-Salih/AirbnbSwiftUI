//
//  SearchAndFilterBar.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var searchLocation : String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(searchLocation.isEmpty ? "Where to?" : searchLocation)
                    .footnote()
                    .semibold()
                
                Text("\(searchLocation.isEmpty ? "Anywhere - " : "")Any week - Add guests")
                    .caption()
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(Color(.label))
            })
        }
        
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(Color(.systemGray4), lineWidth: 1.0)
        }
        .padding(.horizontal)
        .padding(.bottom, 12)
        .clipShape(.rect(cornerRadii: .init(bottomLeading: 12, bottomTrailing: 12), style: .continuous))
    }
}

#Preview {
    SearchAndFilterBar(searchLocation: .constant("Los An"))
}
