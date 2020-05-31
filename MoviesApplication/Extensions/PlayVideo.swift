//
//  PlayVideo.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 29.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation
import XCDYouTubeKit
import AVKit

extension UIViewController {
    
    func playVideo(key :String){
           let playerViewController = AVPlayerViewController()
           self.present(playerViewController, animated: true, completion: nil)
           
           XCDYouTubeClient.default().getVideoWithIdentifier(key) { (video: XCDYouTubeVideo?, error: Error?) in
               if let streamURL = video?.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] {
                   playerViewController.player = AVPlayer(url: streamURL)
               } else {
                   self.dismiss(animated: true, completion: nil)
               }
           }
       }
}
