//
//  GumballMachine.swift
//  DesignMode
//
//  Created by Cocoa on 2020/7/18.
//  Copyright © 2020 Talent. All rights reserved.
//

import UIKit

class GumballMachine: NSObject {
    var soldOutState:State!
    var noQuarterState:State!
    var quarterState:State!
    var soldState:State!


    var state:State!
    var count:Int = 0
    
    init(numGumballs:Int) {
        super.init()
        
        self.count = numGumballs
        self.soldOutState = SoldoutState(machine: self)
        self.noQuarterState = NoQuarterState(machine: self)
        self.quarterState = HasQuarterState(machine: self)
        self.soldState = SoldState(machine: self)
        
        self.state = soldOutState
        
        if numGumballs > 0 {
            self.state = noQuarterState
        }
    }
}

// Machine Operation
extension GumballMachine {
    
    func insertQuarter() {
        state.insertQuarter()
    }
    
    func ejectQuarter() {
        state.ejectQuarter()
    }
    
    func trunCrank() {
        state.turnCrank()
        state.dispence()
    }
    
    func releaseBall() {
        print("A ball comes rolling out the solt...")
        if self.count != 0 {
            self.count -= 1
        }
    }
}
