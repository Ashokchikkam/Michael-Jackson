//
//  SongsTableDataSource.swift
//  Michael Jacson
//
//  Created by Ashok on 10/20/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class SongsTableDataSource: NSObject, UITableViewDataSource {

    private var data = [Dictionary<String, AnyObject>]()
    
    override init() {
        super.init()
    }
    
    func update(with songs: [Dictionary<String, AnyObject>]) {
       
        data = songs
        
        
    }
    
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCellTableViewCell
        
        let song = data[indexPath.row]
        print(song)
        //cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helper
//
//    func song(at indexPath: IndexPath) -> Song {
//        return data[indexPath.row]
//    }

    
}
