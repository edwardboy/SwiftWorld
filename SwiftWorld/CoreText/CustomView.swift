
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

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // CTFrameRef   一块文字
        // CTLineRef    一行文字
        // CTRunRef     一片段文字
        
        // 创建CTFrameRef的范围
        let path = CGPathCreateMutable()
        CGPathAddRect(path, nil, rect)
        
        var mutableString = NSMutableAttributedString(string: "哈哈哈哈哈哈哈哈")
        
        // 设置段落样式
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        style.headIndent = 10
        style.firstLineHeadIndent = 20
        
//        Range range = Range(start: 0, end: mutableString.length-1)
//        NSRange range = NSMakeRange(location:0 length:mutableString.length)
//        mutableString.addAttribute(NSParagraphStyleAttributeName, value: style, range: )
        
    }

}
