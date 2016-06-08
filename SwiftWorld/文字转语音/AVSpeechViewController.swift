//
//  AVSpeechViewController.swift
//  SwiftWorld
//
//  Created by Groupfly on 16/6/8.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

import UIKit
import AVFoundation

class AVSpeechViewController: UIViewController,AVSpeechSynthesizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  speechSynthesizer 可以看成说话的嘴巴
        let speechSynthesizer : AVSpeechSynthesizer = AVSpeechSynthesizer()
        
        //  代理可以监听说话的状态(开始，结束，暂停等)
        speechSynthesizer.delegate = self;
        
        let text = "关雎 朝代：先秦 作者：西门庆 原文：关关雎鸠，在河之洲。窈窕淑女，君子好逑。参差荇菜，左右流之。窈窕淑女，寤寐求之。求之不得，寤寐思服。悠哉悠哉，辗转反侧。 参差荇菜，左右采之。窈窕淑女，琴瑟友之。参差荇菜，左右芼之。窈窕淑女，钟鼓乐之。";
        //  utterance要说的话 由文本生成
        let utterance : AVSpeechUtterance = AVSpeechUtterance(string: text)
        
        let localLanguage = AVSpeechSynthesisVoice.currentLanguageCode()
        
        if #available(iOS 9.0, *) {
            let voice = AVSpeechSynthesisVoice(identifier: localLanguage)
            utterance.voice = voice
        } else {
            // Fallback on earlier versions
        }
        
        utterance.rate = 0.5
        // 高音
        utterance.pitchMultiplier = 0.8
        // 读完停顿0.1s
        utterance.postUtteranceDelay = 0.1
        
        speechSynthesizer.speakUtterance(utterance)
        
    }

}
