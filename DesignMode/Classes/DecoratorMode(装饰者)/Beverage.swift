//
//  Beverage.swift
//  DesignMode
//
//  Created by Conan on 2020/6/15.
//  Copyright © 2020 Talent. All rights reserved.
//

// 以咖啡和对应的调料为例

import UIKit

protocol Beverage {
    
    func cost() -> Double
    var getDescription:String { get }
    
}

//extension Beverage {
//    func cost() -> Double {
//        return 0.0
//    }
//
//    var getDescription : String {
//        return "Unknown Beverage"
//    }
//}

// MARK: 咖啡类型
// 黑咖
class DarkRoast: Beverage {
    func cost() -> Double {
        return 10.0
    }
    
    var getDescription: String = "Dark Roast Coffee"
    
}

// 首选咖啡
class HouseBlend: Beverage {
    func cost() -> Double {
        return 20.0
    }
    
    var getDescription: String = "House Blend Coffee"
}

// MARK: 调料
class CondimentDecorator: Beverage {
    func cost() -> Double {
        return 0.0
    }
    
    var getDescription: String {
        return "Unknown Condiment"
    }
}


// 摩卡
class Mocha: CondimentDecorator {
    
    var beverage: Beverage
    
    init(beverage:Beverage) {
        self.beverage = beverage
        super.init()
    }
    
    override func cost() -> Double {
        return 5.0 + self.beverage.cost()
    }
    
    override var getDescription:String {
        return self.beverage.getDescription + ", Mocha"
    }
    
}

// 牛奶
class Milk: CondimentDecorator {
    
    var beverage: Beverage
    
    init(beverage:Beverage) {
        self.beverage = beverage
        super.init()
    }
    
    override func cost() -> Double {
        return 10.0 + self.beverage.cost()
    }
    
    override var getDescription:String {
        return self.beverage.getDescription + ", Milk"
    }
}

// 奶油
class Whip: CondimentDecorator {
    
    var beverage: Beverage
    
    init(beverage:Beverage) {
        self.beverage = beverage
        super.init()
    }
    
    override func cost() -> Double {
        return 8.0 + self.beverage.cost()
    }
    
    override var getDescription:String {
        return self.beverage.getDescription + ", Whip"
    }
    
}
