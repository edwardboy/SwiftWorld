
//
//  CustomView.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/6/1.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit
import CoreText

class CustomView: UIView {
    
    var str : String?
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(showText text:String) {
        self.init() // 此处调用的是self的init方法
        str = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // CTFrameRef   一块文字
        // CTLineRef    一行文字
        // CTRunRef     一片段文字
        
        // 创建CTFrameRef的范围
        let path = CGPathCreateMutable()
        CGPathAddRect(path, nil, rect)
        
        let mutableString = NSMutableAttributedString(string: str!)
        
        // 设置段落样式
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10  // 行距
        style.headIndent = 0    //
        style.firstLineHeadIndent = 0
        
        let length = mutableString.length
        
        let range = NSMakeRange(0 ,length)
        
        mutableString.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
     
        let setter: CTFramesetterRef = CTFramesetterCreateWithAttributedString(mutableString)
        
        // 通过CTFramesetterRef创建CTFrameRef
        let frame:CTFrameRef = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, nil)
        
        let lines:CFArrayRef = CTFrameGetLines(frame)
        
        let linesCount  = CFArrayGetCount(lines)
        
        print("行数为:" + "\(linesCount)")
        
        // 转换坐标系
        let context : CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextTranslateCTM(context, 0, rect.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        // 画CTFrameRef
        CTFrameDraw(frame, context)
        
        // 释放内存
        
    }

}
