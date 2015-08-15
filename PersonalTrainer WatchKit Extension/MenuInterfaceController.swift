//
//  MenuInterfaceController.swift
//  PersonalTrainer
//
//  Created by appcamp on 15/08/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {

    @IBOutlet weak var repeatsLabel: WKInterfaceLabel!
    @IBOutlet weak var slider: WKInterfaceSlider!
    var repeats: Float = 1;
    @IBAction func goTwisting() {
        pushControllerWithName("InterfaceController", context: ["key": "twist",
            "repeats": repeats])
    }
    
    
    @IBAction func goCrunching() {
        pushControllerWithName("InterfaceController", context: ["key": "crunch",
            "repeats": repeats])
    }
    
    @IBAction func setRepeatsNumber(value: Float) {
        repeats = value;
        repeatsLabel.setText("Repeats: \(value)")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        slider.setValue(1);
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
