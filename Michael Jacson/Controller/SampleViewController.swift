//
//  ViewController.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit
import CoreData

class SampleViewController: UIViewController, NSFetchedResultsControllerDelegate{
    
    var controller: NSFetchedResultsController<SongsDB>!
    //var databaseData: [Dictionary<String, AnyObject>] = [["": ""]]
    let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //client.performRequest(with: <#T##URLRequest#>, completion: <#T##(ItunesAPIClient.Results?, ItunesError?) -> Void#>)
        
        
        // Do any additional setup after loading the view, typically from a nib.
       // getJsonFromUrl()
        
        
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        DispatchQueue.main.async {
//            print("saving the object to core data")
//            ad.saveContext()
//        }
//    }
//
//    func getJsonFromUrl(){
//        //creating a NSURL
//        let url = NSURL(string: "https://itunes.apple.com/search?term=Michael+jackson")
//
//        //fetching the data from the url
//        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
//
//            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
//
//                //printing the json in console
//                print(jsonObj!.value(forKey: "resultCount")!)
//                if let data = jsonObj!.value(forKey: "results") as? [Dictionary<String, AnyObject>]{
//                    //print("data:\(data)")
//                    //self.databaseData = data
//                            for row in data{
//
//                                let newItem = SongsDB(context: context)
//                                if let trackID = row["trackId"] as? Int16{
//                                    newItem.trackId = trackID
//                                }
//                                if let albumTitle = row["collectionName"] as? String{
//                                    newItem.albumTitle = albumTitle
//                                }
//                                if let songTitle = row["trackName"] as? String{
//                                    newItem.songTitle = songTitle
//                                }
//                                else{
//                                    print("no data saved")
//                                }
//                                DispatchQueue.main.async {
//                                    print("saving the object to core data")
//                                    ad.saveContext()
//                                }
//                            }
//
//                }
//
//
//                OperationQueue.main.addOperation({
//                    //calling another function after fetching the json
//                    //it will show the names to label
//
//                })
//
//            }
//        }).resume()
//    }
//
//
//    private func attemptFetch() {
//
//        let fetchRequest: NSFetchRequest<SongsDB> = SongsDB.fetchRequest()
//
//        let imageIdSort = NSSortDescriptor(key: "trackId", ascending: true)
//
//        fetchRequest.sortDescriptors = [imageIdSort]
//
//        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//
//        controller.delegate = self
//
//        self.controller = controller
//
//        do {
//
//            try controller.performFetch()
//
//        } catch {
//
//            let error = error as NSError
//            print("\(error)")
//
//        }
//
//    }
//    func addToDb() {
//
//        for row in self.databaseData{
//
//            let newItem = SongsDB(context: context)
//            if let trackID = row["trackId"] as? Int16{
//                newItem.trackId = trackID
//            }
//            if let albumTitle = row["collectionName"] as? String{
//                newItem.albumTitle = albumTitle
//            }
//            if let songTitle = row["trackName"] as? String{
//                newItem.songTitle = songTitle
//            }
//            else{
//                print("no data saved")
//            }
//        }
//
//    }
    
}



//
//func play(url: URL){
//    
//    //let url = URL(string: (detailItem?.previewUrl)!)
//    
//    let player = AVPlayer(url: url)
//    
//    //let player = AVPlayer(URL: url!)
//    let playerController = AVPlayer()
//    
//    //        playerController.play()
//    //
//    //        self.
//    // self.addChildViewController(player)
//    //self.addChildViewController(playerController)
//    //self.view.addSubview(player)
//    //self.view.addSubview(playerController.view)
//    //        playerController.view.frame = self.view.frame
//    
//    player.play()
//}
//
//func playSound() {
//    guard let url = URL(string: (detailItem?.previewUrl)!)
//        else {
//            print("unable to find url")
//            return
//            
//    }
//    
//    do {
//        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//        try AVAudioSession.sharedInstance().setActive(true)
//        
//        
//        
//        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//        
//        /* iOS 10 and earlier require the following line:
//         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//        
//        guard let player = player else { return }
//        
//        player.play()
//        print("after playing")
//        
//    } catch let error {
//        print(error.localizedDescription)
//    }
//}
//
//
//
//override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//    // Dispose of any resources that can be recreated.
//}
//func downloadFileFromURL(){
//    
//    //var downloadTask:URLSessionDownloadTask?
//    //        downloadTask = URLSession.shared.downloadTask(with: URL(string: (detailItem?.previewUrl)!)!, completionHandler:{ [weak self] url, response, error in
//    //            self?.play(url)
//    //
//    //        })
//    
//    //
//    //        //downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(url, completionHandler: { [weak self](URL, response, error) -> Void in
//    //            self?.play(URL)
//    //        })
//    let download = downloadsSession.downloadTask(with: URL(string: (detailItem?.previewUrl)!)!, completionHandler: {
//        url, response, error in
//        self.play(url: url!)
//        
//    })
//    download.resume()
//    
//}

