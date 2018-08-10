//: [Previous](@previous)

import Foundation

//Country has to have a capital city
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        //We can use self here because its fully initialize as capital city is optional(implicitly unwraped)
        self.capitalCity = City(name: capitalName, country: self)
    }
}

//City belongs to a country
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

let country = Country(name: "England", capitalName: "London")
print("\(country.name)'s capital is called \(country.capitalCity.name)")
