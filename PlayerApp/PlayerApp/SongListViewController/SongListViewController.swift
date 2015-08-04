//
//  SongListViewController.swift
//  PlayerApp
//
//  Created by Apple on 29/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

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
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songTitle.count
       // return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! TableViewCell
        
        customCell.lblSongTitle.text = songTitle[indexPath.row] as String
        customCell.songImgView.image = songImg[indexPath.row]as UIImage
        
        customCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return customCell
    }
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var songViewController = AVPlayerController(nibName: "AVPlayerController",bundle:nil)
        
        songViewController.urlString = "\(self.songURL[indexPath.row])"
        songViewController.index = indexPath.row
        //songViewController.song_title.text = "\(self.songTitle[indexPath.row])"
        songViewController.songURL = self.songURL
        songViewController.songTitle = self.songTitle
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
//    
//    func getAlbumModels() -> [AlbumModel] {
//        
//        var albums: [AlbumModel] = []
//        
//        var query:MPMediaQuery = MPMediaQuery.albumsQuery()
//        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        query.addFilterPredicate(predicate)
//        
//        var albumItems:[MPMediaItemCollection] = query.collections as![MPMediaItemCollection]
//        var album:MPMediaItemCollection
//        
//        //making album model
//        for album in albumItems{
//            
//            var albumItem:[MPMediaItem] = album.items as! [MPMediaItem]
//            
//            var song:MPMediaItem
//            var songs: [SongModel] = []
//            var albumTitle: String = ""
//            
//            //making song model
//            for song in albumItem {
//                albumTitle = song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String
//                
//                var songModel: SongModel = SongModel(
//                    songId:     song.valueForProperty( MPMediaItemPropertyPersistentID ) as! NSNumber,
//                    albumTitle: song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String,
//                    artistName: song.valueForProperty( MPMediaItemPropertyArtist ) as! String,
//                    songTitle:  song.valueForProperty( MPMediaItemPropertyTitle ) as! String,
//                    artworkImg: song.valueForProperty(MPMediaItemPropertyArtwork) as! UIImage)
//                
//                    //adding song model to song models array
//                    songs.append( songModel )
//                
//            }
//            var albumModel: AlbumModel = AlbumModel(albumTitle: albumTitle,songModels: songs)
//            
//            //adding album model to album models array
//            albums.append( albumModel )
//        }
//        
//        return albums
//    }
//}

//class SongQuery {
//    
//    func get() -> [AlbumInfo] {
//        var albums: [AlbumInfo] = []
//        
//        var albumsQuery: MPMediaQuery = MPMediaQuery.albumsQuery()
//        
//        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        albumsQuery.addFilterPredicate(predicate)
//        
//        //        let predicateByGenre = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre )
//        //        albumsQuery.filterPredicates = NSSet(object: predicateByGenre) as Set<NSObject>
//        
//        var albumItems: [MPMediaItemCollection] = albumsQuery.collections as! [MPMediaItemCollection]
//        var album: MPMediaItemCollection
//        
//        for album in albumItems {
//            
//            var albumItems: [MPMediaItem] = album.items as! [MPMediaItem]
//            var song: MPMediaItem
//            
//            var songs: [SongInfo] = []
//            
//            var albumTitle: String = ""
//            
//            for song in albumItems {
//                
//                albumTitle = song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String
//                
//                var songInfo: SongInfo = SongInfo(
//                    albumTitle: song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String,
//                    artistName: song.valueForProperty( MPMediaItemPropertyArtist ) as! String,
//                    songTitle:  song.valueForProperty( MPMediaItemPropertyTitle ) as! String,
//                    //artwork: song.valueForProperty(MPMediaItemPropertyArtwork) as! UIImage,
//                    songId:     song.valueForProperty( MPMediaItemPropertyPersistentID ) as! NSNumber
//                )
//                
//                songs.append( songInfo )
//            }
//            
//            var albumInfo: AlbumInfo = AlbumInfo(albumTitle: albumTitle,songs: songs)
//            albums.append( albumInfo )
//            
//        }
//        return albums
//    }
//    
//    func getItem( songId: NSNumber ) -> MPMediaItem {
//        
//        var property: MPMediaPropertyPredicate = MPMediaPropertyPredicate( value: songId, forProperty: MPMediaItemPropertyPersistentID )
//        
//        var query: MPMediaQuery = MPMediaQuery()
//        query.addFilterPredicate( property )
//        
//        var items: [MPMediaItem] = query.items as! [MPMediaItem]
//        
//        return items[items.count - 1]
//        
//    }
//    
//}
//
//
//
