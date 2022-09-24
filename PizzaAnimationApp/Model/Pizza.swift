//
//  Pizza.swift
//  PizzaAnimationApp
//
//  Created by pavel on 24.09.22.
//

import Foundation


// MARK: Pizza model and sample data

struct Pizza: Identifiable {
    let id = UUID().uuidString
    let pizzaImage: String
    let pizzaTitle: String
    let pizzaDescription: String
    let pizzaPrice: String
}

var pizzes: [Pizza] = [
    Pizza(pizzaImage: "Pizza1", pizzaTitle: "Classic Red", pizzaDescription: "Special pizza sauce, tomatoes, mozzarella, parmesan cheese, red pepper flakes.", pizzaPrice: "10.50"),
    Pizza(pizzaImage: "Pizza2", pizzaTitle: "Chicken Carbonara", pizzaDescription: "Creamy sauce, mozzarella, chicken, bacon, mushrooms and crushed red pepper flakes.", pizzaPrice: "12.50"),
    Pizza(pizzaImage: "Pizza3", pizzaTitle: "Mediterranean", pizzaDescription: "Hummus, mozzarella, feta, spinach, red onion, banana pepper, green bel pepper, olives.", pizzaPrice: "11.90")
]
