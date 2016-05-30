//
//  OtherViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/19.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let mainVC : HMMainViewController = HMMainViewController();
        self.presentViewController(mainVC, animated: true, completion: nil)
    }
    
}
