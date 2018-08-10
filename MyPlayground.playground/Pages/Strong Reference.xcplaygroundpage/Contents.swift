//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being intialized")
    }
    deinit {
        print("\(name) is being deintialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

//reference1 points strongly to this person
reference1 = Person(name: "John Appleseed")

//more reference pointing to John
//Makes it three
reference2 = reference1
reference3 = reference1

//remove two of them
reference1 = nil
reference2 = nil

//Still having one strong reference to it
//Remove that and it'll be released i.e deintialized
reference3 = nil


