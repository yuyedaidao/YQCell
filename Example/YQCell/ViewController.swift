//
//  ViewController.swift
//  YQCell
//
//  Created by wyqpadding@gmail.com on 07/06/2020.
//  Copyright (c) 2020 wyqpadding@gmail.com. All rights reserved.
//

import UIKit
import YQCell

class ViewController: UIViewController {

    @IBOutlet weak var cell: YQCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cell.positions = [.bottom, .top]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

