import UIKit


protocol Coffee {
    var cost: Int {get}
}

protocol CoffeeDecorator: Coffee {
    var coffeeBase: Coffee {get}
    init(base: Coffee)
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 40
    }
}

class Milk: CoffeeDecorator {
    var coffeeBase: Coffee
    
    required init(base: Coffee) {
        self.coffeeBase = base
    }
    
    var cost: Int {
        return coffeeBase.cost + 40
    }
}

class Whip: CoffeeDecorator {
    var coffeeBase: Coffee
    
    required init(base: Coffee) {
        self.coffeeBase = base
    }
    
    var cost: Int {
        return coffeeBase.cost + 60
    }
}

class Sugar: CoffeeDecorator {
    var coffeeBase: Coffee
    
    required init(base: Coffee) {
        self.coffeeBase = base
    }
    
    var cost: Int {
        return coffeeBase.cost + 20
    }
}

let coffee = SimpleCoffee()
let sugarCoffee = Sugar(base: coffee)
let milkySugarCoffee = Milk(base: sugarCoffee)
let WhipMilkySugarCoffee = Whip(base: milkySugarCoffee)

