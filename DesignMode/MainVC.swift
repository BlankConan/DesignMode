//
//  MainVC.swift
//  DesignMode
//
//  Created by Cocoa on 2020/6/12.
//  Copyright © 2020 Talent. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let machine = GumballMachine(numGumballs: 100)
        
        for _ in 1...100 {
            machine.insertQuarter()
            machine.trunCrank()
        }
        
        
        
    }

    
}

