//
//  ShowViewController.swift
//  MemeApp
//
//  Created by Nayyer Ali on 10/4/19.
//  Copyright © 2019 Nayyer Ali. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    var createdMemeImage:UIImage?
    
    @IBOutlet weak var memeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = createdMemeImage
        
        // Do any additional setup after loading the view.
    }

}
