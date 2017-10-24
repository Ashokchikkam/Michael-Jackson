//
//  SongsTableVC.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit
import CoreData

class SongsTableVC: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
    //Mark: Properties

    var controller: NSFetchedResultsController<SongsDB>!
    let pendingOperations = PendingOperations()
    let client = ItunesAPIClient()
    let urlRequest = URLRequest(url: URL(string: BASE_URL)!)
    

    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptFetch()
        self.navigationItem.title = "Michael Jackson Songs"
        
        loadData()
        
        
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let objs = controller.fetchedObjects , objs.count > 0 {
            print("number of objects in collection: \(objs.count)")
            return objs.count
        }
        print("returning zero number of items.")
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCellTableViewCell
        
        if let objs = controller.fetchedObjects , objs.count > 0 {
            print("number of objects in collection: \(objs.count)")
            
            self.configureCel(cell: cell, indexPath: indexPath)
        }
        return cell
    }
    
    //Configuring cell.

    func configureCel(cell: SongCellTableViewCell, indexPath: IndexPath){
        let obj = controller.object(at: indexPath as IndexPath)
        
        let song = Song(trackId: obj.trackId!, songTitle: obj.songTitle!, albumTitle: obj.albumTitle!, imageLoaded: obj.imageLoaded)
        
        if obj.imageLoaded == false{
            downloadImageData(obj: obj, atIndexPath: indexPath)
        }
        else{
            song.image = UIImage(data: obj.imageData!)
            song.imageLoaded = true
        }
        cell.configureCell(song: song)
    }

    //Helper method for configuring cell.
    func downloadImageData(obj: SongsDB, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ImageDownloader(obj: obj)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    // MARK: - Navigation
    
    //Preparing the segue before navigating to the DetailVC.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ShowSegue" {
            
            guard let destination = segue.destination as? DetailVC else {
                fatalError("Unexpected Destination")
            }
            guard let itemCell = sender as? SongCellTableViewCell else {
                fatalError("Unexpected cell")
            }
            guard let indexPath = tableView.indexPath(for: itemCell) else {
                fatalError("The selected cell is not being displayed by the Collection.")
            }
            
            let detailItem = controller.object(at: indexPath)
            
            destination.detailItem = detailItem
            print("inside prepare for segue")
            
        }
        
    }
 
    
    //MARK: Private Methods
    
    //TO setup CoreData.
    private func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<SongsDB> = SongsDB.fetchRequest()
        
        let imageIdSort = NSSortDescriptor(key: "trackId", ascending: true)
        
        fetchRequest.sortDescriptors = [imageIdSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            
            try controller.performFetch()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
            
        }
        
    }
    
    //Loading initial Data

  private func loadData(){
        
        if let objs = controller.fetchedObjects , objs.count < 50 {
            print("number of objects in collection: \(objs.count) reloading data")
            //getData()
            
            getData { (boolValue) in
                if boolValue{
                    //To reaload tableview on the main threaad.
                    DispatchQueue.main.async {
                        self.attemptFetch()
                        print("After loading data")
                        self.tableView.reloadData()
                    }
                }
                else{
                    return
                }
            }

        }
    }
    
    typealias temp = (Bool) -> Void
    
    //Helper method to load initial Data.
    
    func getData(completionHandler completion: @escaping temp){
        
        client.performRequest(with: urlRequest){ results, error in
            
            guard let results = results else {
                completion(false)
                return
            }
            for row in results{
                
                let newItem = SongsDB(context: context)
                if let trackID = row["trackId"] as? Int{
                    newItem.trackId = String(trackID)
                }
                else{
                    newItem.trackId = ""
                }
                if let albumTitle = row["collectionName"] as? String{
                    newItem.albumTitle = albumTitle
                }else{
                    newItem.albumTitle = ""
                }
                if let songTitle = row["trackName"] as? String{
                    newItem.songTitle = songTitle
                }
                else{
                    newItem.songTitle = ""
                }
                if let imageUrl = row["artworkUrl100"] as? String{
                    newItem.imageUrl = imageUrl
                    print("imageURL: \(imageUrl)")
                }
                if let genre = row["primaryGenreName"] as? String{
                    newItem.genre = genre
                }
                if let previewUrl = row["previewUrl"] as? String{
                    newItem.previewUrl = previewUrl
                }
                newItem.imageLoaded = false
                
                DispatchQueue.main.async {
                    print("saving the object to core data")
                    ad.saveContext()
                }
            }
            completion(true)
        }
        tableView.reloadData()
    }
}



