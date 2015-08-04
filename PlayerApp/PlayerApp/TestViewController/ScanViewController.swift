//
//  ScanViewController.swift
//  PlayerApp
//
//  Created by Apple on 30/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import MediaPlayer

class ScanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var songs:Songs = Songs()
        var albums: [AlbumModel] =  songs.getAlbumModels()
        println(albums.count)
        
        for album in albums{
            println(album.albumTitle)
            
            var songModels:[SongModel] = album.songModels
            
            for songModel in songModels{
                var songId = songModel.songId
               
                println(songModel.songId)
                println(songModel.songTitle)
                println(songModel.albumTitle)
                println(songModel.artistName)
               // println(songModel.artworkImg)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
struct  SongModel {
    
    var songId:NSNumber
    var albumTitle:String
    var artistName:String
    var songTitle:String
   // var artworkImg:UIImage
}

struct AlbumModel {
    var albumTitle:String
    var songModels:[SongModel]
}

class Songs{
    
    func getAlbumModels() -> [AlbumModel] {
        
        var albums: [AlbumModel] = []
        
        var query: MPMediaQuery = MPMediaQuery.songsQuery()
        
        var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
        query.addFilterPredicate(predicate)
        
        var mediaCollection:MPMediaItemCollection = MPMediaItemCollection(items: query.items)
        println(mediaCollection.count)
        
        
        
        
      // var predicate = MPMediaPropertyPredicate(value: MPMediaType.AnyVideo.rawValue, forProperty: MPMediaItemPropertyMediaType)
      // query.addFilterPredicate(predicate)
        
        var albumItems:[MPMediaItemCollection] = query.collections as![MPMediaItemCollection]
        var album:MPMediaItemCollection
        
        //making album model
        for album in albumItems{
            
            var albumItem:[MPMediaItem] = album.items as! [MPMediaItem]
            
            var song:MPMediaItem
            var songs: [SongModel] = []
            var albumTitle: String = ""
            
            //making song model
            for song in albumItem {
                albumTitle = song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String
                
                var songModel: SongModel = SongModel(
                    songId:     song.valueForProperty( MPMediaItemPropertyPersistentID ) as! NSNumber,
                    albumTitle: song.valueForProperty( MPMediaItemPropertyAlbumTitle ) as! String,
                    artistName: song.valueForProperty( MPMediaItemPropertyArtist ) as! String,
                    songTitle:  song.valueForProperty( MPMediaItemPropertyTitle ) as! String)
                
                //adding song model to song models array
                songs.append( songModel )
                
            }
            var albumModel: AlbumModel = AlbumModel(albumTitle: albumTitle,songModels: songs)
            
            //adding album model to album models array
            albums.append( albumModel )
        }
        
        return albums
    }
}

