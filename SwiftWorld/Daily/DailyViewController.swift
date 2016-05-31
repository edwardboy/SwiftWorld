//
//  DailyViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/31.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "参考项目（视频播放）";
        
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let launchVC : launcherViewController = launcherViewController()
        
        self.presentViewController(launchVC, animated: true, completion: nil)
    }

}
