//
//  AVPlayerController.swift
//  PlayerApp
//
//  Created by Apple on 30/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import AVFoundation
import Social
import MediaPlayer

class AVPlayerController: UIViewController {

    //These variables Are Initializing from SongListViewController
    var itemIndex:Int?
    var urlString:String?
    var arrSongURL:[NSURL] = []
    var arrSongTitle:[String] = []
    var arrSongImg:[UIImage] = []
 
    @IBOutlet var playerView: UIView!
    @IBOutlet var btnPlay:UIButton!
    @IBOutlet var uiSlider:UISlider!
    @IBOutlet var song_title:UILabel!
    @IBOutlet var volume: MPVolumeView!
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblTotalTime: UILabel!
    
    var avPlayer: AVPlayer = AVPlayer()
    var avPlayerItem: AVPlayerItem = AVPlayerItem()
    weak  var avPlayerLayer:AVPlayerLayer?
    
    
    var flag: Bool = false
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.navigationController?.navigationBarHidden = true
        self.song_title.text = String(arrSongTitle[itemIndex!])
        self.playMusic(urlString!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    override func viewWillDisappear(animated: Bool) {
        self.invalidateTimer()
    }
    override func viewDidDisappear(animated: Bool) {
        self.invalidateTimer()
    }
    func playMusic(urlString: String){
        let url = NSURL(string: urlString)
        var avURLAsset: AVURLAsset?
        avURLAsset = AVURLAsset(URL: url, options: nil)
        
        avURLAsset?.loadValuesAsynchronouslyForKeys(["playable"], completionHandler: { () -> Void in
            
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.avPlayerLayer?.player = nil
                self.avPlayerLayer?.removeFromSuperlayer()
                self.avPlayerLayer = nil
                self.invalidateTimer()

                
                self.avPlayerItem = AVPlayerItem(asset: avURLAsset)
                self.avPlayer.replaceCurrentItemWithPlayerItem(self.avPlayerItem)
                self.avPlayerLayer = AVPlayerLayer(player: self.avPlayer)
                self.avPlayerLayer?.frame = self.playerView.bounds
                self.avPlayerLayer?.videoGravity =  AVLayerVideoGravityResizeAspect
                //self.playerView.layer.addSublayer(self.avPlayerLayer)
                self.playerView.layer.insertSublayer(self.avPlayerLayer, atIndex: 0)
                self.avPlayer.play()
                    
                self.timer = NSTimer(timeInterval: 0.5, target: self, selector: Selector("updatingSlider"), userInfo: nil, repeats: true)
                NSRunLoop.mainRunLoop().addTimer(self.timer!, forMode: NSDefaultRunLoopMode)
                
            })
           
        })

    }
    
    func invalidateTimer()
    {
        self.timer?.invalidate()
        self.timer = nil
    }
    @IBAction func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.invalidateTimer()
        
    }
    @IBAction func previousSong(){
       
        
        if itemIndex > 0{
            self.invalidateTimer()
            itemIndex = itemIndex! - 1
            var urlString = "\(self.arrSongURL[itemIndex!])"
            self.playMusic(urlString)
            
            self.btnPlay.setTitle("Pause", forState: .Normal)
           
            
            flag = false
            self.uiSlider.setValue(0, animated: false)
            self.song_title.text = self.arrSongTitle[itemIndex!]
            

        }
    }
    @IBAction func playPause(){
        
        if flag{
           
            btnPlay.setTitle("Pause", forState: .Normal)
            self.avPlayer.play()
            flag = false
        }
        else
        {
            flag = true
            btnPlay.setTitle("Play", forState: .Normal)
            self.avPlayer.pause()
        }
        
    }
    @IBAction func nextSong(){
        
        if itemIndex < arrSongURL.count - 1 {
            self.invalidateTimer()
            itemIndex = itemIndex! + 1
            var urlString = "\(self.arrSongURL[itemIndex!])"
            self.playMusic(urlString)
            
            btnPlay.setTitle("Pause", forState: .Normal)
            
            flag = false
            self.uiSlider.setValue(0, animated: false)
            self.song_title.text = self.arrSongTitle[itemIndex!]
            
            
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
    
    func updatingSlider(){
        var duration = Float(CMTimeGetSeconds(self.avPlayerItem.duration))
        var current = Float(CMTimeGetSeconds(self.avPlayerItem.currentTime()))
        
        if  !duration.isNaN && duration < Float.infinity {
            var minutes = Int(duration / 60)
            var seconds = Int(duration % 60)
            self.lblTotalTime.text = "\(minutes):\(seconds)"
            
        }
        
        if !current.isNaN {
            var minutes = Int(current / 60)
            var seconds = Int(current % 60)
            self.lblCurrentTime.text = "\(minutes):\(seconds)"
        }
        
        if  !duration.isNaN && !current.isNaN {
            self.uiSlider?.setValue(current/duration * 100, animated: false)
        }
        
    }

    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {

//        if fromInterfaceOrientation.isPortrait{
//            println("Portrait :     \(self.playerView.bounds)")
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0)
//        }
//        else{
//            println("Landscape :   \(self.playerView.bounds)")
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 768.0, 1024.0)
//
//        }
        
        
  
        
        
//        var height = UIScreen.mainScreen().bounds.height
//        var width = UIScreen.mainScreen().bounds.width
//        
//        println(height)
//        println(width)
//        
//        if fromInterfaceOrientation.isPortrait {
//            
//            //self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, width, height)
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, width, height)
//        } else if fromInterfaceOrientation.isLandscape {
//            //self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, height, width)
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, height, width)
//        }

        
    }
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        
        if toInterfaceOrientation.isPortrait{
            println("Portrait :     \(self.playerView.bounds)")
            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 768.0, 1024.0)
            
        }
        else{
            println("Landscape :   \(self.playerView.bounds)")
            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0)
            
        }
        
        
      //  self.avPlayerLayer?.frame = self.playerView.bounds
      
//        var height = UIScreen.mainScreen().bounds.height
//        var width = UIScreen.mainScreen().bounds.width
//        
//        println(height)
//        println(width)
//
//        if toInterfaceOrientation.isPortrait {
// 
//           //self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, width, height)
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, width, height)
//        } else if toInterfaceOrientation.isLandscape {
//            //self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, height, width)
//            self.avPlayerLayer?.frame = CGRectMake(0.0, 0.0, height, width)
//        }
        
    }

    
    @IBAction func shareOnFacebook(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(String(arrSongTitle[itemIndex!]))
            var selectedImg:UIImage = arrSongImg[itemIndex!]
            facebookSheet.addImage(selectedImg)
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    
    @IBAction func shareOnTwitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(String(arrSongTitle[itemIndex!]))
            var selectedImg:UIImage = arrSongImg[itemIndex!]
            twitterSheet.addImage(selectedImg)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
       
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
}
