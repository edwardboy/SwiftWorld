//
//  BookModel.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/30.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class BookModel: NSObject,NSCoding {//
    // 名称
    var name : String?
    // 是否出版
    var published : Bool = false
    // 价格
    var price : Float = 0.0
    // 信息
     var info : NSMutableArray!
    
    override var description : String{
        
        let infoStr = info.componentsJoinedByString("---")
        
        return "书本名称:" + "\(name!)" + ",出版状态为:" + "\(published)" + ",价格为:" + "\(price)" + "元，书本信息:" + infoStr
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name,forKey: "name")
        aCoder.encodeBool(self.published, forKey:"published")
        aCoder.encodeFloat(self.price, forKey:"price")
        aCoder.encodeObject(self.info, forKey: "info")
    }
    
    override init() {
        
    }
    
    func initWithName(name:String) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.published = aDecoder.decodeBoolForKey("published")
        self.price = aDecoder.decodeFloatForKey("price")
        self.info = aDecoder.decodeObjectForKey("info") as! NSMutableArray
        
    }
    
}
