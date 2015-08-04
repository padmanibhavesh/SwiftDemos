//
//  AVPlayerController.swift
//  PlayerApp
//
//  Created by Apple on 30/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import AVFoundation

class AVPlayerController: UIViewController {

    var index:Int?
    var urlString:String?
    var songURL:[NSURL] = []
    var songTitle:[String] = []
    
    
    var flag: Bool = false
    
    @IBOutlet var playerView: UIView!
    @IBOutlet var btnPlay:UIButton!
    @IBOutlet var uiSlider:UISlider!
    @IBOutlet var song_title:UILabel!
    
    let avPlayer: AVPlayer = AVPlayer()
    var avPlayerItem: AVPlayerItem = AVPlayerItem()
    var avPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.navigationController?.navigationBarHidden = true
        self.song_title.text = String(songTitle[index!])
        self.playMusic(urlString!)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    func playMusic(urlString: String){
        
        var avURLAsset: AVURLAsset?
        let url = NSURL(string: urlString)
        
        avURLAsset = AVURLAsset(URL: url, options: nil)
        
        //asset?.resourceLoader.setDelegate(self, queue: dispatch_get_main_queue())
        avURLAsset?.loadValuesAsynchronouslyForKeys(["playable"], completionHandler: { () -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.avPlayerItem = AVPlayerItem(asset: avURLAsset)
                self.avPlayer.replaceCurrentItemWithPlayerItem(self.avPlayerItem)
                self.avPlayerLayer = AVPlayerLayer(player: self.avPlayer)
                self.avPlayerLayer?.frame = self.playerView.bounds
                self.avPlayerLayer?.videoGravity =  AVLayerVideoGravityResizeAspect
                self.playerView.layer.addSublayer(self.avPlayerLayer)
                self.avPlayer.play()
            })
        })

    }
    
    @IBAction func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func previousSong(){
        
        if index > 0{
            index = index! - 1
            var urlString = "\(self.songURL[index!])"
            self.playMusic(urlString)
            
            btnPlay.setTitle("Play", forState: .Normal)
            self.avPlayer.play()
            flag = false
            self.uiSlider.setValue(0, animated: false)
            
            self.song_title.text = self.songTitle[index!]

        }
    }
    @IBAction func playSong(){
        
        if flag{
           
            btnPlay.setTitle("Play", forState: .Normal)
            self.avPlayer.play()
            flag = false
        }
        else
        {
            flag = true
            btnPlay.setTitle("Pause", forState: .Normal)
            self.avPlayer.pause()
        }
        
    }
    @IBAction func nextSong(){
        
        if index < songURL.count - 1 {
             index = index! + 1
            var urlString = "\(self.songURL[index!])"
            self.playMusic(urlString)
            
            btnPlay.setTitle("Play", forState: .Normal)
            self.avPlayer.play()
            flag = false
            self.uiSlider.setValue(0, animated: false)
            
            self.song_title.text = self.songTitle[index!]
            
        }
        
    }
    
    @IBAction func sliderChanged(slider: UISlider) {
        var duration = Float(CMTimeGetSeconds(self.avPlayerItem.duration))
        self.avPlayer.seekToTime(CMTimeMake(Int64(slider.value * duration / 100), Int32(1)), completionHandler: { (val : Bool) -> Void in
            if val == false {
                println("seek failed")
            }
        });
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
       var orientation: UIDeviceOrientation = UIDevice.currentDevice().orientation
/*
        if orientation.isPortrait{
            println("portraite")
            self.avPlayerLayer?.frame = self.playerView.bounds
            self.avPlayerLayer?.transform = CATransform3DMakeTranslation(200,200,0)
        }
        if orientation.isLandscape{
            println("landscape")
            self.avPlayerLayer?.transform = CATransform3DMakeTranslation(200,200,0)
        }*/
        
        
        //self.avPlayerLayer?.frame = self.playerView.bounds
        
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        if toInterfaceOrientation.isPortrait {
             NSLog("P %@", NSStringFromCGRect(self.playerView.frame))
            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 768.0, 844.0)
        } else {
             NSLog("L %@", NSStringFromCGRect(self.playerView.frame))
            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 1024.0, 588.0)
        }
        
        //self.avPlayerLayer?.frame = self.playerView.bounds
        
        //self.avPlayerLayer?.transform = CATransform3DMakeTranslation(200,200,0)

    }

}
