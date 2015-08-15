//
//  InterfaceController.swift
//  PersonalTrainer WatchKit Extension
//
//  Created by Marta Wozniak on 15/08/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var repeats = 1
    @IBOutlet weak var congratsLabel: WKInterfaceLabel!
    @IBOutlet weak var image: WKInterfaceImage!
    @IBAction func stopAnimation() {
        image.stopAnimating()
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let dict = context as? NSDictionary,
            exercise = dict["key"] as? String,
            repeats = dict["repeats"] as? Int
        {
                image.setImageNamed(exercise)
                image.startAnimatingWithImagesInRange(NSMakeRange(0, 17), duration: 2, repeatCount: repeats)
            self.repeats = repeats
        }
        let val = 2 * repeats
        NSTimer.scheduledTimerWithTimeInterval(Double(val), target: self, selector: Selector("updateLabel"), userInfo: nil, repeats: false)
    }
    
    func updateLabel() {
        congratsLabel.setText("Well done!")
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
