//
//  TableViewModelController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/6/1.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class TableViewModelController: HMCommonViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupData()
    }
    
    func setupData(){
        // 第一组
        let firstGroup : HMCommonGroup = HMCommonGroup()
        groups().addObject(firstGroup)
        
        let readItem  = HMCommonLabelItem(title: "123")
        readItem.text = "有图模式"
        readItem.badgeValue = "12"
        
        let arrowItem = HMCommonArrowItem(title: "阅读模式", icon:"pluginmanager_icon_favor")
        arrowItem.badgeValue = "1"
        
        let common = HMCommonItem(title: "普通样式")
        common.subtitle = "123"
        firstGroup.items = [readItem,arrowItem,common]
        firstGroup.header = "第一组header"
        firstGroup.footer = "第一组footer"
        
        // 第二组
        let secondGroup : HMCommonGroup = HMCommonGroup()
        groups().addObject(secondGroup)
        
        let readItem1  = HMCommonLabelItem(title: "阅读模式", icon:"pluginmanager_icon_favor")
        readItem1.text = "有图模式"
        readItem1.badgeValue = "12"
        
        let common1 = HMCommonItem(title: "普通样式")
        common1.subtitle = "123"
        common1.operation = {
            self.navigationController?.pushViewController(CellPopViewController(), animated: true)
        }
        
        secondGroup.items = [readItem1,common1]
        secondGroup.header = "第二组header"
        secondGroup.footer = "第二组footer"
    }
    
}
