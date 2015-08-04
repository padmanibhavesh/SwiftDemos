//
//  TestViewController.swift
//  PlayerApp
//
//  Created by Apple on 30/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Do any additional setup after loading the view.
        
//        self.title = "Player"
//          self.navigationController?.navigationBarHidden = true
//        
//                var player = AVPlayer(URL: NSURL(string: "<pathToAudioResource>"))
//                player.play()
//        
//                player = AVPlayer(URL: urlString)
//                let playerController = SongViewController()
//        
//                playerController.player = player
//                self.addChildViewController(playerController)
//                self.view.addSubview(playerController.view)
//                playerController.view.frame = self.view.frame
//                
//                player!.play()
        
        
        
        
//                self.title = [_item valueForProperty:MPMediaItemPropertyTitle];
//                self.reading_value = [_item valueForProperty:MPMediaItemPropertyTitle];
//                self.artistName = [_item valueForProperty:MPMediaItemPropertyAlbumArtist];
//                self.albumName = [_item valueForProperty:MPMediaItemPropertyAlbumTitle];
//                self.assetUrl = [_item valueForProperty:MPMediaItemPropertyAssetURL];
//                self.artWork = [_item valueForProperty:MPMediaItemPropertyArtwork];
//        
        
                var sq = SongQuery()
                var albums: [AlbumInfo] = sq.get()
        
                if albums.count > 0{
        
                    var albumInfo:AlbumInfo = albums[1]
        
                    var songs:[SongInfo] = albumInfo.songs
        
                    if songs.count > 0{
                        var song:SongInfo = songs[1]
                        println(albumInfo.albumTitle)
                        println(song.artistName)
                        println(song.songId)
                        println(song.songTitle)
                        println(song.albumTitle)
                    }else{
                        println("song is empty")
                    }
                   
                }
                else
                {
                    println("album is empty")
                }
        


    }
    
    
    @IBAction func goBack(){
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    
    let destination = segue.destinationViewController as! SongViewController
    let url = NSURL(string:"http://www.ebookfrenzy.com/ios_book/movie/movie.mov")
    destination.player = AVPlayer(URL: url)
    
    }
    */

}

struct SongInfo {
    
    var albumTitle: String
    var artistName: String
    var songTitle:  String
    // var artwork: UIImage
    
    var songId   :  NSNumber
}


struct AlbumInfo {
    
    var albumTitle: String
    var songs: [SongInfo]
}



class SongQuery {
    
    func get() -> [AlbumInfo] {
        var albums: [AlbumInfo] = []
        
        var albumsQuery: MPMediaQuery = MPMediaQuery.albumsQuery()
        
        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
        albumsQuery.addFilterPredicate(predicate)
        
        //        let predicateByGenre = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre )
        //        albumsQuery.filterPredicates = NSSet(object: predicateByGenre) as Set<NSObject>
        
        var albumItems: [MPMediaItemCollection] = albumsQuery.collections as! [MPMediaItemCollection]
        var album: MPMediaItemCollection
        
        for album in albumItems {
            
            var albumItems: [MPMediaItem] = album.items as! [MPMediaItem]
            var song: MPMediaItem
            
            var songs: [SongInfo] = []
            
            var albumTitle: String = ""
            
            for song in albumItems {
                
                albumTitle = song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String
                
                var songInfo: SongInfo = SongInfo(
                    albumTitle: song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String,
                    artistName: song.valueForProperty( MPMediaItemPropertyArtist ) as! String,
                    songTitle:  song.valueForProperty( MPMediaItemPropertyTitle ) as! String,
                    //artwork: song.valueForProperty(MPMediaItemPropertyArtwork) as! UIImage,
                    songId:     song.valueForProperty( MPMediaItemPropertyPersistentID ) as! NSNumber
                )
                
                songs.append( songInfo )
            }
            
            var albumInfo: AlbumInfo = AlbumInfo(albumTitle: albumTitle,songs: songs)
            albums.append( albumInfo )
            
        }
        return albums
    }
    
    func getItem( songId: NSNumber ) -> MPMediaItem {
        
        var property: MPMediaPropertyPredicate = MPMediaPropertyPredicate( value: songId, forProperty: MPMediaItemPropertyPersistentID )
        
        var query: MPMediaQuery = MPMediaQuery()
        query.addFilterPredicate( property )
        
        var items: [MPMediaItem] = query.items as! [MPMediaItem]
        
        return items[items.count - 1]
        
    }
    
}





//  SongListViewController.swift


/*
import UIKit
import MediaPlayer

class SongListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    var songTitle:[String] = []
    var songAlbum:[String] = []
    var songURL:[NSURL] = []
    var songArtWork:[MPMediaItemArtwork] = []
    var songImg:[UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "CustomCell")
        tableView.rowHeight = 107.0
        
        tableView.dataSource = self
        tableView.delegate = self
        
        var query = MPMediaQuery()
        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
        query.addFilterPredicate(predicate)
        
        var flag = 0
        
        for (flag = 0; flag < query.items.count; flag++ ){
            
            var item: AnyObject = query.items[flag]
            
            var title:String!  = item.valueForProperty(MPMediaItemPropertyTitle) as! String
            var url: NSURL! = item.valueForProperty(MPMediaItemPropertyAssetURL) as! NSURL
            var artwork:MPMediaItemArtwork! = item.valueForProperty(MPMediaItemPropertyArtwork) as! MPMediaItemArtwork
            var image = artwork.imageWithSize(CGSize(width: 80, height: 80))
            
            songTitle.append(title)
            songURL.append(url)
            songArtWork.append(artwork)
            songImg.append(image)
            
            
        }
        println(songTitle.count)
        println(songURL.count)
        println(songArtWork.count)
        println(songImg.count)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songTitle.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! TableViewCell
        
        customCell.lblSongTitle.text = songTitle[indexPath.row] as String
        customCell.songImgView.image = songImg[indexPath.row]as UIImage
        
        return customCell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var songViewController = AVPlayerController(nibName: "AVPlayerController",bundle:nil)
        //songViewController.urlString = songURL[indexPath.row]
        self.navigationController?.pushViewController(songViewController, animated: true)
    }
    
}


//struct  SongModel {
//
//    var songId:NSNumber
//    var albumTitle:String
//    var artistName:String
//    var songTitle:String
//    var artworkImg:UIImage
//}
//
//struct AlbumModel {
//    var albumTitle:String
//    var songModels:[SongModel]
//}
//
//class Songs{
//    func getAlbumModels() -> [AlbumModel]{
//        var albums: [AlbumModel] = []
//
//        var query:MPMediaQuery = MPMediaQuery.albumsQuery()
//        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        query.addFilterPredicate(predicate)
//
//        var albumItems:[MPMediaItemCollection] = query.collections as![MPMediaItemCollection]
//        var album:MPMediaItemCollection
//
//        for album in albumItems{
//
//            var albumItem:[MPMediaItem] = album.items as! [MPMediaItem]
//
//            var song:MPMediaItem
//            var songs: [SongModel] = []
//
//            for song in albumItem{
//
//            }
//        }
//
//        return albums
//    }
//}


AVFoundation AVPlayer and AVKit AVPlayerViewController
*/


