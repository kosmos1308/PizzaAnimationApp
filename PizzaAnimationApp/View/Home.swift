//
//  Home.swift
//  PizzaAnimationApp
//
//  Created by pavel on 24.09.22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "square.grid.2x2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
                    
                Spacer()
                
                Button {
                    
                } label: {
                    Image("man")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 38, height: 38)
                        .clipShape(Circle())
                }
            }
            .overlay {
                Text(attributedTitle)
                    .font(.title)
            }
            
            Text("Select Your Pizza")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 15)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
    }
    
    // MARK: Attributed title
    var attributedTitle: AttributedString {
        var string = AttributedString("EATPIZZA")
        if let range = string.range(of: "PIZZA") {
            string[range].font = .system(size: 28, weight: .bold)
        }
        return string
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
