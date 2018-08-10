//: [Previous](@previous)

import Foundation

// Examples are in this section of swift docs. https://docs.swift.org/swift-book/LanguageGuide/MemorySafety.html

//Read and write operation overlap
//stepSize is been read in the function and we are also passing it as a number so read and write operations overlap each other.
var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

increment(&stepSize)


//Conflict if the same variable is passed to two different inout parameters.
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK
//balance(&playerOneScore, &playerOneScore)   ///Two write operation overlaping each other


//Conflict access to self in methods
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    //This method is mutating the struct
    //So it has the write access for the from begining of method until method returns
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

//Add another method which has write access for self
extension Player {
    //This method writes to self and onther memory location pointed by this Type
    //So write access overlaps
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

//Scenerio A
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria) //This is fine write operation overlaps but for two differnt locations

//oscar.shareHealth(with: &oscar) //This is wrong write operation overlaps for same memory location


//Conflicting Access to Properties

//A read or write access to a value in structure, enums or tuple means access to the whole structure
// A TUPLE
var playerInformation = (health: 10, energy: 5)
balance(&playerInformation.health, &playerInformation.energy) //write accesses to same tuple that would overlap.

// In case of global instances of structures
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy) // Conflict: write access to same memory location (that of struture) for same duration.

// But it is safe for the local instances of structure
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}



