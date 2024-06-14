//
//  DestinationSearchView.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel : ExploreViewModel

    @State private var selectedOption: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
    
    var body: some View {
        VStack (spacing: 16) {
            HStack {
                Button(action: { show.toggle() }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .semibold()
                        .foregroundStyle(Color(.label))
                })
                
                Spacer()
                
                if viewModel.searchLocation.isNotEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(Color(.label))
                    .subheadline()
                    .semibold()
                }
            }
            .padding(.horizontal)
            
            
            
            
            
            VStack (alignment: .leading, spacing: 6){
                Text("Where to?")
                    .font(.title2)
                    .semibold()
                
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search destination", text: $viewModel.searchLocation)
                        .onSubmit {
                            viewModel.updateListingForLocation()
                            show.toggle()
                        }
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color(.systemGray4) ,lineWidth: 1.0)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(.systemGray4) ,lineWidth: 1.0)
            }
            .padding(.horizontal)
            
            
            //MARK: Date selection
            VStack (alignment : .leading) {
                if selectedOption == .dates {
                    Text("When is your trip?")
                        .font(.title2)
                        .semibold()
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .subheadline()
                    .semibold()
                    
                    
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(.systemGray4) ,lineWidth: 1.0)
            }
            .padding(.horizontal)
            .onTapGesture {
                selectedOption = .dates
            }
            
            //MARK: Date selection
            VStack (alignment : .leading) {
                if selectedOption == .guests {
                    Text("Whow is coming?")
                        .font(.title2)
                        .semibold()
                    
                    Stepper {
                        Text("\(numberOfGuests) Adults")
                    } onIncrement: {
                        numberOfGuests += 1
                    } onDecrement: {
                        guard numberOfGuests > 0 else { return }
                        numberOfGuests -= 1
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "Add guests")
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(.systemGray4) ,lineWidth: 1.0)
            }
            .padding(.horizontal)
            .onTapGesture {
                selectedOption = .guests
            }
            
            Spacer()
        }
        .background(Color(.secondarySystemBackground))
        .animation(.smooth, value: selectedOption)
    }
}

//#Preview {
//    DestinationSearchView(show: .constant(false))
//}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            HStack {
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .subheadline()
            .semibold()
        }
    }
}
