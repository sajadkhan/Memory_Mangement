//: [Previous](@previous)

import Foundation

// This is the solution of the problem presented in the page 'Closure Strong Cycle', where a person instance was not being deintialized due to strong reference cycle because of a closure.

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
    // Specifying a closure list i.e references being used in closure either as weak or unowned
    lazy var details: () -> String = { [unowned self] in
        //Now we are not caputring self strongly, instead we are using unowned reference specified in the capture list.
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
// Did you see "John is being deinitialized"? It will print this time because there john will be released. 
