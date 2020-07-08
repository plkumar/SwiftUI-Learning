//
//  Sandwitch.swift
//  Sandwitches
//
//  Created by Lakshman Peethani on 06/07/20.
//  Copyright © 2020 Lakshman Peethani. All rights reserved.
//

import Foundation

struct Sandwich  : Identifiable, Hashable{
    let id: UUID
    let name : String
    let description : String
    let ingredients : Int
    let image : String
    let spicy : Bool
    
    init(name:String, image:String, spicy:Bool, ingredients:Int, description: String) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.spicy = spicy
        self.ingredients = ingredients
        self.description = description
    }
}

var sandwitches : [Sandwich] = [
    Sandwich(name: "Honey Oat",image: "club-sandwich",spicy: false, ingredients: 3, description: "Some Description Blah, BlahBlah, BlahBlah, BlahBlah, Blah"),
    Sandwich(name: "Pastrami",image: "ham-sandwich",spicy: false, ingredients: 4, description: "Some Description Blah, BlahBlah, Blah"),
    Sandwich(name: "Veg Delight",image: "olive",spicy: true, ingredients: 3, description: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type."),
    Sandwich(name: "Chiken Ceaser",image: "veg-sandwich",spicy: false, ingredients: 4, description: "Some Description Blah, BlahBlah, BlahBlah, Blah"),
    Sandwich(name: "Hot sauce berry delight",image: "veg-sandwich",spicy: true, ingredients: 6, description: "Some DescriptionBlah, BlahBlah, BlahBlah, Blah "),
    Sandwich(name: "Wheat n Oat",image: "olive",spicy: false, ingredients: 3, description: "Some Description Blah, BlahBlah, BlahBlah, BlahBlah, Blah"),
    Sandwich(name: "Peannut Cream",image: "ham-sandwich",spicy: false, ingredients: 4, description: "Some Description Blah, BlahBlah, BlahBlah, BlahBlah, Blah"),
    Sandwich(name: "Veg Hot Delight",image: "club-sandwich",spicy: true, ingredients: 3, description: "Some Description Blah, BlahBlah, BlahBlah, Blah"),
    Sandwich(name: "Chiken Cream Ceaser",image: "olive",spicy: false, ingredients: 4, description: "Some Description Blah, BlahBlah, Blah"),
    Sandwich(name: "Hot n Wild",image: "veg-sandwich",spicy: true, ingredients: 6, description: "Some Description Blah, BlahBlah, BlahBlah, Blah")
]
    

