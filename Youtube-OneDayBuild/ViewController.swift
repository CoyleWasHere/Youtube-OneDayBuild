//
//  ViewController.swift
//  Youtube-OneDayBuild
//
//  Created by Daniel Coyle on 9/15/20.
//  Copyright © 2020 Daniel Coyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

