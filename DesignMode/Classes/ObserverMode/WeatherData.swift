//
//  WeatherData.swift
//  DesignMode
//
//  Created by Cocoa on 2020/6/12.
//  Copyright © 2020 Talent. All rights reserved.
//

import UIKit

class WeatherData: NSObject {
    
    private var temprature = 0.0    // 温度
    private var humidity = 0.0      // 湿度
    private var pressure = 0.0      // 压强
    
    private var timer:DispatchSourceTimer = {
        let timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now(), repeating: 2)
        return timer
    }()
    
    override init() {
        
        super.init()
        addTimerEvent()
    }
    
    // 公共接口
    func measurementsChanged() {
        
    }
    
}

// 数据
extension WeatherData {
    
    func addTimerEvent() {
        self.timer.setEventHandler {
            
        }
    }
}
