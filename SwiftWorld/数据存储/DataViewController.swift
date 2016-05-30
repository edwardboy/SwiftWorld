//
//  DataViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/30.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit


class DataViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orangeColor()
        
        // 归档
        usageOfNSKeywedarchive()
        
    }
    
    /**
     归档的使用
     */
    func usageOfNSKeywedarchive(){
        
        /* 
        注意：
            1、归档模型时，模型必须要遵守NSCoding协议，实现其中的方法
        
            2、输出模型信息
                override var description : String{
        
                let infoStr = info.componentsJoinedByString("---")
        
                return "书本名称:" + "\(name!)" + ",出版状态为:" + "\(published)" + ",价格为:" + "\(price)" + "元，书本信息:" + infoStr
                }
        
            3、
        */
        let lastPathComponent : String = "book.plist"
        
        let book : BookModel = BookModel()
        book.name = "Swift 2.0"
        book.published = true
        book.price = 35.0
//        book.info.addObject()
        book.info = NSMutableArray(array: ["swift参考书籍","人民教育出版社"])
        
        
        let path = (getDocumentPath() as NSString).stringByAppendingPathComponent(lastPathComponent)
        
        NSKeyedArchiver.archiveRootObject(book, toFile: path)
        
        let newBook = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! BookModel
        
        print(book)
        print("===")
        print(newBook)
    }
    
    func getDocumentPath() ->String {
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        
        return documentPath!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
