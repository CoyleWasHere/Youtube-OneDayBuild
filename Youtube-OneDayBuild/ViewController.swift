//
//  ViewController.swift
//  Youtube-OneDayBuild
//
//  Created by Daniel Coyle on 9/15/20.
//  Copyright © 2020 Daniel Coyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setting the ViewController as the tableview delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        // Get the videos from the model
        model.getVideos()
        
    }
    
    // MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UITableview Protocols
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the cell with the data
        // Get the title for the video
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Return
    
    }
    
}

