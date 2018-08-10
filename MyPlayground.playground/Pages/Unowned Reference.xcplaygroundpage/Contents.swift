//: [Previous](@previous)

import Foundation

class Container {
    let name: String
    var liquid: Liquid?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deintialize")}
}

class Liquid {
    let name: String
    //Unowned reference to container
    unowned var container: Container
    init(name: String, container: Container) {
        self.name = name
        self.container = container
    }
    deinit { print("Liquid \(name) is being deinitialize") }
}

var container: Container?
container = Container(name: "Glass")
container!.liquid = Liquid(name: "Water", container: container!)

container = nil
