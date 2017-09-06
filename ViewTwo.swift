//
//  ViewTwo.swift
//  Quiz_App
//
//  Created by Savio Neyyan on 2017-08-19.
//  Copyright © 2017 Savio Neyyan. All rights reserved.
//

import Foundation

import UIKit

class ViewTwo : UIViewController {
    
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    
    var scoreText=String();
    
    
    override func viewDidLoad() {
        
        Score.text=scoreText;
        Label2.text="Your Score is "
    }
}