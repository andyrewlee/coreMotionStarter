//
//  ViewController.swift
//  stepCounter
//
//  Created by Jae Hoon Lee on 5/1/15.
//  Copyright (c) 2015 Jae Hoon Lee. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var stepCount: UILabel!
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        pedometer.stopPedometerUpdates()
        stepCount.text = "0"
    }
    
    @IBAction func startButtonPressed(sender: UIButton) {
        pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
            println("Update \(data.numberOfSteps)")
            dispatch_async(dispatch_get_main_queue()) {
                self.stepCount.text = String(stringInterpolationSegment: data.numberOfSteps)
            }
        })
    }
    
    let pedometer: CMPedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

