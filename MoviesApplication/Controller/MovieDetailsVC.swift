//
//  MovieDetailsVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 25.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import AVKit

class MovieDetailsVC: UIViewController{
    
    let scrollView = UIScrollView()
    func setScrollView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(0)
            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
        }
    }
    
    let container = UIView()
    func setContainer(){
        scrollView.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(1300)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }
    }
    
    let posterImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    private func setPosterImage(){
        self.container.addSubview(posterImage)
        posterImage.backgroundColor = .systemPink
        posterImage.layer.masksToBounds = true
        posterImage.layer.cornerRadius = 15.0
        posterImage.snp.makeConstraints { (make) in
            make.top.equalTo(container.snp.top).offset(10)
            make.centerX.equalToSuperview()
            // make.centerY.equalToSuperview()
            make.height.equalTo(450)
            make.width.equalTo(300)
            
        }
        
    }
    
    func loadImage(posterPath : String){
        
        let url = URL(string: "https://image.tmdb.org/t/p/original" + posterPath)
        
        posterImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + posterPath, completed: {})
    }
    
    let movieNameLabel = UILabel()
    func setmovieNameLabel() {
        container.addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { (make) -> Void  in
            movieNameLabel.textColor = .white
            movieNameLabel.font = movieNameLabel.font.withSize(30)
            make.height.equalTo(40)
            make.top.equalTo(posterImage.snp_bottomMargin).offset(10)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    let dateLabel = UILabel()
    func setdateLabel() {
        container.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) -> Void  in
           
            dateLabel.textColor = .lightGray
            dateLabel.font = dateLabel.font.withSize(25)
            make.height.equalTo(30)
            make.top.equalTo(movieNameLabel.snp.bottom)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    
    let laurelImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    private func setLaurelImage(){
          laurelView.addSubview(laurelImage)
        laurelImage.image = UIImage(named: "Laurel")
      
          laurelImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
          }
      }
    
    let imdb = UILabel()
    func setimdb() {
        laurelView.addSubview(imdb)
        imdb.snp.makeConstraints { (make) -> Void  in
            imdb.text = "IMDb"
            imdb.textColor = .lightGray
            imdb.font = dateLabel.font.withSize(15)
            make.height.equalTo(15)
            make.leading.equalTo(laurelImage.snp_leadingMargin).offset(20)
            make.trailing.equalTo(laurelImage.snp_trailingMargin).offset(-10)
            make.bottom.equalTo(laurelImage.snp_bottomMargin).offset(-20)
        }
    }
    let laurelView = UIView()
       func setLaurelView(){
           container.addSubview(laurelView)
           laurelView.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp_bottomMargin).offset(10)
            make.leading.equalTo(container).offset(10)
            make.width.equalTo(90)
            make.height.equalTo(70)
              
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContainer()
        setPosterImage()
        setmovieNameLabel()
        setdateLabel()
        setLaurelView()
        setLaurelImage()
        setimdb()
        view.backgroundColor = .black
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        posterImage.isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
   
    var movies = String()
    func playVideo(key :String) {
        
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
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("resime tıklandı")
        playVideo(key: movies)
        
    }
    
    
    
    
    
    
    
    
    
    
    
}


