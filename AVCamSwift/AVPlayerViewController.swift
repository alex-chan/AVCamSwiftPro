//
//  AVPlayerViewController.swift
//  AVCamSwiftPro
//
//  Created by sunset on 14-11-25.
//  Copyright (c) 2014年 sunset. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

var ItemStatusContext = "ItemStatusContext"

class AVPlayerViewController: UIViewController{
    
    var tmpMovieURL: NSURL?
    

    
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    
    @IBOutlet weak var playerView: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var asset: AVURLAsset = AVURLAsset(URL: self.tmpMovieURL!, options: nil)
        
        var tracksKey = "tracks"
        
        asset.loadValuesAsynchronouslyForKeys([tracksKey], completionHandler: {
            
            dispatch_async(dispatch_get_main_queue(), {
                var error: NSError? = nil
                var status: AVKeyValueStatus = asset.statusOfValueForKey(tracksKey, error: &error)
                
                if status == AVKeyValueStatus.Loaded{
                    self.playerItem = AVPlayerItem(asset: asset)
                    self.playerItem!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.Initial, context: &ItemStatusContext)
                    
                    self.player = AVPlayer(playerItem: self.playerItem)
                    
                    
                    self.playerView.player = self.player!
                    
                    self.player!.play()
                    
                }else{
                    println(error)
                }
                
            })
            
            
        })

    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.playerItem!.removeObserver(self, forKeyPath: "status", context: &ItemStatusContext)
        super.viewWillDisappear(animated)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if context == &ItemStatusContext {
            
            
            
        }else{
            return super.observeValueForKeyPath(keyPath, ofObject: object , change: change, context: context)
        }
    }
    
}