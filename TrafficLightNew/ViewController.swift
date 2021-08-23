//
//  ViewController.swift
//  TrafficLightNew
//
//  Created by Oğuzhan Angın on 14.08.2021.
//

import UIKit

class ViewController: UIViewController {

    //typealias StartButtonAction = () -> Void
    
    @IBOutlet var redLightImage: UIImageView!
    @IBOutlet var yellowLightImage: UIImageView!
    @IBOutlet var greenLightImage: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
    }
    
    @objc func startButtonAction(_ sender: Any) {
        //Light switching delays in seconds
        let redToYellow = 4.0
        let yellowToGreen = 2.0
        let greenToOff = 3.0
        
        //Save off colors of the lights
        let offRedColor = redLightImage.tintColor
        let offYellowColor = yellowLightImage.tintColor
        let offGreenColor = greenLightImage.tintColor
        
        //Delay light switching operations
        perform(#selector(switchToYellow), with: offRedColor, afterDelay: redToYellow)
        perform(#selector(switchToGreen), with: offYellowColor, afterDelay: redToYellow +  yellowToGreen)
        perform(#selector(turnOffGreen), with: offGreenColor, afterDelay: redToYellow +  yellowToGreen + greenToOff)
        
        //Turn on the red light initially
        redLightImage.tintColor = .red
    }
    @objc func switchToYellow(offColor: UIColor){
        redLightImage.tintColor = offColor
        yellowLightImage.tintColor = UIColor.yellow
    }
    @objc func switchToGreen(offColor: UIColor){
        yellowLightImage.tintColor = offColor
        greenLightImage.tintColor = UIColor.green
    }
    @objc func turnOffGreen(offColor: UIColor){
        greenLightImage.tintColor = offColor
    }


}

