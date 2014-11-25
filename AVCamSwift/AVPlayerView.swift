//
//  AVPlayerView.swift
//  AVCamSwiftPro
//
//  Created by sunset on 14-11-25.
//  Copyright (c) 2014年 sunset. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayerView: UIView{
    
    
    override class func layerClass() -> AnyClass{
        return AVPlayerLayer.self
    }
    
    var player: AVPlayer {
        get {
            return (self.layer as AVPlayerLayer).player
        }
        set(player) {
            (self.layer as AVPlayerLayer).player = player
        }
    }
}