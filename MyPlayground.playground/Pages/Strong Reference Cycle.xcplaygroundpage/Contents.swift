//: [Previous](@previous)

import Foundation


class Person {
    let name: String
    init(name: String) { self.name = name }
    var appartment: Apartment?
    deinit { print("\(name) is being deintialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("\(unit) is being deintialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

//unit4A is referenced by appertment var on john also.
john!.appartment = unit4A
//john is referenced by tenant var on appartment also.
unit4A?.tenant = john

//lets release them
john = nil
unit4A = nil

//Did you see deinit print statments?



