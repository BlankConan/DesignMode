//
//  StateInterface.swift
//  DesignMode
//
//  Created by Cocoa on 2020/7/18.
//  Copyright © 2020 Talent. All rights reserved.
//

protocol State {
    var gumballMachine:GumballMachine? { set get }
    
    func insertQuarter() -> Void
    
    func ejectQuarter() -> Void
    
    func turnCrank() -> Void
    
    func dispence() -> Void
}


class SoldoutState:State {
    weak var gumballMachine: GumballMachine?
    
    init(machine:GumballMachine) {
        self.gumballMachine = machine
    }
    
    func insertQuarter() {
        print("Sorry, gumballs alread sold out")
    }
    
    func ejectQuarter() {
        print("Sorry, gumballs alread sold out")
    }
    
    func turnCrank() {
        print("Sorry, gumballs alread sold out")
    }
    
    func dispence() {
        print("Sorry, gumballs alread sold out")
    }
}



class NoQuarterState: State {
    weak var gumballMachine:GumballMachine?
    
    init(machine:GumballMachine) {
        self.gumballMachine = machine
    }
    
    
    func insertQuarter() {
        print("You insert a quarter")
        gumballMachine?.state = gumballMachine?.quarterState
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You truned, but there's no quarter")
    }
    
    func dispence() {
        print("You need to pay first")
    }
}

class HasQuarterState: State {
    weak var gumballMachine:GumballMachine?
    
    init(machine:GumballMachine) {
        self.gumballMachine = machine
    }
    
    
    func insertQuarter() {
        print("You can't insert another quarter ")
    }
    
    func ejectQuarter() {
        print("Quarter returned")
        gumballMachine?.state = gumballMachine?.noQuarterState
    }
    
    func turnCrank() {
        print("You turned...")
        // winner 机会 (10次多给一颗糖果)
        let w = Int.random(in: 1...10)
        if w == 1 && (gumballMachine?.count ?? 0) > 1 {
            gumballMachine?.state = gumballMachine?.winnerState
        } else {        
            gumballMachine?.state = gumballMachine?.soldState
        }
        
    }
    
    func dispence() {
        print("No gumball dispenced")
    }
}

class SoldState: State {
    weak var gumballMachine:GumballMachine?
    
    init(machine:GumballMachine) {
        self.gumballMachine = machine
    }
    
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        print("Sorry, you already turned the crank")
    }
    
    func turnCrank() {
        print("Turned twice does'nt get you another gumball")
    }
    
    func dispence() {
        gumballMachine?.releaseBall()
        if (gumballMachine?.count ?? 0) > 0 {
            gumballMachine?.state = gumballMachine?.noQuarterState
        } else {
            print("Oops, out of gumball")
            gumballMachine?.state = gumballMachine?.soldOutState
        }
    }
}


class WinnerState: State {
    weak var gumballMachine:GumballMachine?
    
    init(machine:GumballMachine) {
        self.gumballMachine = machine
    }
    
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        print("Sorry, you already turned the crank")
    }
    
    func turnCrank() {
        print("Turned twice does'nt get you another gumball")
    }
    
    func dispence() {
        print("YOU'RE A WINNER! You get two gumballs for your quarter")
        gumballMachine?.releaseBall()
        var leftBalls = gumballMachine?.count ?? 0
        if leftBalls == 0 {
            gumballMachine?.state = gumballMachine?.soldOutState
        } else {
            gumballMachine?.releaseBall()
            leftBalls = gumballMachine?.count ?? 0
            
            if leftBalls > 0 {
                gumballMachine?.state = gumballMachine?.noQuarterState
            } else {
                print("Oops, out of gumball")
                gumballMachine?.state = gumballMachine?.soldOutState
            }
        }
    }
}
