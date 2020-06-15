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
       
        let hb = HouseBlend()
        print("price:\(hb.cost())")
        print("des:" + hb.getDescription)
        
        let milk = Milk(beverage: hb)
        let whip = Whip(beverage: milk)
        
        print("price:\(whip.cost())")
        print("des:" + whip.getDescription)
    }

    
}

