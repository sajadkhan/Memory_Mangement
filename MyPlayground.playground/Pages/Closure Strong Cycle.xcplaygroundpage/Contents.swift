//: [Previous](@previous)

import Foundation

class Person {
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
    }
    
    //A closure to person's detail as a String
    //details is a strong reference to this closures
    lazy var details: () -> String = {
        //Using self will capture it strongly.
        //now clouser has strong reference to the instance which has strong reference to it i.e Strong Reference Cycle.
        let personDetails = "Name: \(self.firstName) \(self.lastName), Date of Birth: \(self.dateOfBirth)"
        return personDetails
    }
    
    deinit { print("\(firstName) is being deinitialized") }
}

// a person, just born
var john: Person? = Person(firstName: "John", lastName: "Appleseed", dateOfBirth: Date())
// calling the detail closure will create it as it was lazy.
print(john!.details())

john = nil
// Did you see "John is being deinitialized"? No? Thats because it is pointing strongly to a closure which also has a strong reference to john. 

