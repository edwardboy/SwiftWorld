//
//  DataViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/30.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit
import LocalAuthentication


class DataViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orangeColor()
        
        // 归档
        usageOfNSKeywedarchive()
        
        //字符串与字符数组转换
        transformBetweenCharacterArrayAndString()
    }
    
    /**
     指纹的使用
     */
    func usageOfLAContext(){
        if #available(iOS 8.0, *) {
            let myContext : LAContext = LAContext()
            let localizedString : String = "请录入指纹"
            
            let pointer = NSErrorPointer()
            
            if (myContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: pointer)){
                myContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: localizedString, reply: { (success, error) -> Void in
                    
                    if (success){
                        print("成功")
                    }else{
                        print("失败")
                    }
                    
                })
            }
            
        } else {
            // Fallback on earlier versions
            print("当前系统版本较低，指纹不可用");
        };
    }
    
    /**
     字符串与字符数组之间的转换
     */
    func transformBetweenCharacterArrayAndString(){
        
        /*
        oc中转换方式：
        
        NSString *str = @"abc123";
        
        NSInteger count = str.length;
        
        const char *a = [str cStringUsingEncoding:NSUTF8StringEncoding];
        
        NSMutableString *muStr = [NSMutableString stringWithUTF8String:a];
        NSLog(@"muStr=%@",muStr);
        
        for (int i = 0; i<count; i++) {
        char s = a[i];
        NSLog(@"s%d=%c",i,s);
        }
        */
        
        let string = "abc123"
        
        for i in string.characters {
            print("string -" + "\(i)")
        }
        
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
    
    /**
     获取应用所在的沙盒路径
     */
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
