//
//  Home.swift
//  PizzaAnimationApp
//
//  Created by pavel on 24.09.22.
//

import SwiftUI

struct Home: View {
    
    @State var selectedPizza: Pizza = pizzas[0]
    @State var swipeDirection: Alignment = .center
    
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
            
            Text("Select Your Pizza".uppercased())
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 15)
            
            // MARK: Custom slider
            animatedSlider()
            

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
    
    // MARK: Animated custom slider
    @ViewBuilder
    func animatedSlider() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            LazyHStack {
                ForEach(pizzas) { pizza in
                    VStack(spacing: 10) {
                        Text(pizza.pizzaTitle)
                            .font(.largeTitle.bold())
                        
                        Text(pizza.pizzaDescription)
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    .frame(width: size.width, height: size.height, alignment: .top)
                }
            }
            
            //
            pizzaView()
                .padding(.top, 120)
        }
        .padding(.horizontal, -15)
        .padding(.top, 35)
    }
    
    // MARK: Pizza view
    @ViewBuilder
    func pizzaView() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack(alignment: .top) {
                Image(selectedPizza.pizzaImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .background(alignment: .top, content: {
                        Image("Powder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.width)
                            .offset(y: -30)
                    })
                    .scaleEffect(1.5)
                
                ZStack(alignment: .top) {
                    // Hidding if it's first slide
                    if pizzas.first?.id != selectedPizza.id {
                        // MARK: Left Side
                        ArcShape()
                            .trim(from: 0.05, to: 0.3)
                            .stroke(Color.gray, lineWidth: 2)
                            .offset(y: 75)
                        
                        // MARK: Arrows image
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: -30))
                            .offset(x: -(size.width / 2) + 30, y: 53)
                    }
                    
                    // Hidding if it's last slide
                    if pizzas.last?.id != selectedPizza.id {
                        // MARK: Right Side
                        ArcShape()
                            .trim(from: 0.7, to: 0.95)
                            .stroke(Color.gray, lineWidth: 2)
                            .offset(y: 75)
                        
                        // MARK: Arrows image
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: 30))
                            .offset(x: (size.width / 2) - 30, y: 53)
                    }
                    
                    // MARK: Price attributed string
                    Text(priceAttributtedString(value: selectedPizza.pizzaPrice))
                        .font(.largeTitle.bold())
                }
                .offset(y: -120)
                
                // MARK: Adding Gesturess
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let translation = value.translation.width
                            if translation < 0 && -translation > 20 {
                                swipeDirection = .leading
                                handleSwipe()
                            }
                            // MARK: If for right swipe
                            if translation > 0 && translation > 20 {
                                swipeDirection = .trailing
                                handleSwipe()
                            }
                        })
                )
            }
            .offset(y: size.height / 2)
        }
        .padding(.top)
    }
    
    // MARK: Handle swipe
    func handleSwipe() {
        if swipeDirection == .leading {
            print("left")
        }
        
        if swipeDirection == .trailing {
            print("right")
        }
    }
    
    
    // MARK: Price string
    func priceAttributtedString(value: String) -> AttributedString {
        var attrString = AttributedString(stringLiteral: value)
        if let range = attrString.range(of: "$") {
            attrString[range].font = .system(size: 25, weight: .bold)
        }
        return attrString
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
