//
//  DelailedVC.swift
//  josnswifty
//
//  Created by Vishnu on 05/11/19.
//  Copyright © 2019 Vishnu.json. All rights reserved.
//

import UIKit

class DetailedVC: UIViewController {

    @IBOutlet weak var alpha2: UILabel!
    @IBOutlet weak var alpha3: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subregion: UILabel!
    var strregion = ""
    var strsubregion = ""
    var stralpha2 = ""
    var stralpha3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alpha2.text = stralpha2
        alpha3.text = stralpha3
        region.text = strregion
        subregion.text = strsubregion

    }
    

    
}
