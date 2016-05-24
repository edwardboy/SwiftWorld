//
//  WaterPrinpleViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/5/19.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit

class WaterPrinpleViewController: UIViewController {

    private let btn : UIButton = UIButton()
    
    private let testView : UIView = UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // 波纹效果
        setupWaterRipple()
        
    }
    
    /**
     构建界面
     */
    func setupView(){
        self.view.backgroundColor = UIColor.whiteColor()
        
        // 验证码
        btn.frame = CGRectMake(10, 20, 150, 30)
        btn.setTitle("获取验证码", forState: .Normal)
        btn.layer.cornerRadius = 5
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.backgroundColor = UIColor.orangeColor()
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        testView.frame = CGRectMake(10, 60, 100, 100)
        self.view.addSubview(testView)
    }
    
    /**
     水波纹效果
     */
    func setupWaterRipple(){
        
        let pulseLayer : CAShapeLayer = CAShapeLayer()
        pulseLayer.frame = testView.bounds
        pulseLayer.path = UIBezierPath(ovalInRect: pulseLayer.bounds).CGPath
        pulseLayer.fillColor = UIColor.redColor().CGColor
        pulseLayer.opacity = 0.0
        
        // 可以复制的layer
        let replicatorLayer : CAReplicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = testView.bounds
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceDelay = 1
        replicatorLayer.addSublayer(pulseLayer)
        testView.layer.addSublayer(replicatorLayer)
        
        // 透明度动画
        let opacityAnimation : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.5
        opacityAnimation.toValue = 0.0
        
        // 放大动画
        let scaleAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform")
        scaleAnimation.fromValue = NSValue(CATransform3D: CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0))
        scaleAnimation.toValue = NSValue(CATransform3D: CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0))
        
        let groupAnimation : CAAnimationGroup = CAAnimationGroup()
        groupAnimation.animations = [opacityAnimation,scaleAnimation]
        groupAnimation.duration = 4.0
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = HUGE
        pulseLayer.addAnimation(groupAnimation, forKey: "groupAnimation")
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let p = (touches as NSSet).anyObject()!.locationInView(self.view)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: .CurveEaseInOut, animations: { () -> Void in
            self.testView.center = p
            }, completion: nil)
    }
    
    /**
     发送验证码
     
     - parameter btn: 显示于按钮
     */
    func btnClick(btn:UIButton){
        print("====btnClick")
        
        var timeout : Int = 29;
        
        let queue : dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let timer : dispatch_source_t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, dispatch_walltime(nil, 0), NSEC_PER_SEC * 1, 0)
        
        // 每秒执行
        dispatch_source_set_event_handler(timer) { () -> Void in
            
            btn.enabled = false
            
            if(timeout <= 0){
                
                dispatch_source_cancel(timer)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    btn.setTitle("发送验证码", forState: .Normal)
                    btn.enabled = true
                })
                
            }else{
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    btn.setTitle(String(format: "%d秒后重新发送", timeout), forState: .Normal)
                })
                
                timeout--
            }
        }
        
        dispatch_resume(timer)
    }

    
}
