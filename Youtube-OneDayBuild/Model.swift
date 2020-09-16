//
//  Model.swift
//  Youtube-OneDayBuild
//
//  Created by Daniel Coyle on 9/15/20.
//  Copyright © 2020 Daniel Coyle. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            
            return
            
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors and that there is data
            if error != nil || data == nil {
                return
            }
            else {
                
                
                
            }
            
            // Parsing the data into video objects
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = .iso8601
            
            do{
                
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
            }
            catch{
                // Catch any errors
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
        
        
    }
    
}
