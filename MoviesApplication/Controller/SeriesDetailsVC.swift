//
//  SeriesDetailsVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 1.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class SeriesDetailsVC: UIViewController {
    
     var seriesID : String = ""
       var genresCount = Int()
       var castCount = Int()
       var trailerKey = String()
    
      private var seriesDetailsViewModel = SeriesDetailsViewModel()
       private var SDM = [SeriesDetailsModel]()
       private var trailersViewModel = TrailersViewModel()
       private var TRM = [TrailersModel]()
       private var seriesCastViewModel = SeriesCastViewModel()
       private var SCM = [SeriesCastModel]()
    
    
    
    private let scrollView = UIScrollView()
      private func setScrollView(){
          view.addSubview(scrollView)
          scrollView.snp.makeConstraints { (make) in
              make.top.leading.bottom.trailing.equalTo(view).offset(0)
          }
      }
    
    
    private let container = UIView()
      private func setContainer(){
          scrollView.addSubview(container)
          container.snp.makeConstraints { (make) in
              make.top.equalTo(scrollView.snp.top)
              make.left.width.equalTo(scrollView)
              make.height.equalTo(1100)
              make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
          }
      }
    
    
    private let posterImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    private func setPosterImage(){
        self.container.addSubview(posterImage)
        paddingPosterImage()
        tappedPosterImage()
        posterImage.snp.makeConstraints { (make) in
            make.top.equalTo(container.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(450)
            make.width.equalTo(300)
        }
    }
    private func paddingPosterImage(){
        posterImage.layer.masksToBounds = true
        posterImage.layer.cornerRadius = 15.0
    }
    private func tappedPosterImage(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        posterImage.isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(tapGestureRecognizer)
    }

    
    
    
    private let movieNameLabel = UILabel()
       private func setmovieNameLabel() {
           container.addSubview(movieNameLabel)
           paddingMovieNameLabel()
           movieNameLabel.snp.makeConstraints { (make) -> Void  in
               make.height.equalTo(40)
               make.top.equalTo(posterImage.snp_bottomMargin).offset(10)
               make.leading.equalTo(container).offset(20)
               make.trailing.equalTo(container).offset(-10)
           }
       }
       private func paddingMovieNameLabel(){
           movieNameLabel.textColor = .white
           movieNameLabel.font = UIFont.boldSystemFont(ofSize: 30)
       }
    
    
    
    private let dateLabel = UILabel()
     private func setdateLabel() {
         container.addSubview(dateLabel)
         paddingdateLabel()
         dateLabel.snp.makeConstraints { (make) -> Void  in
             make.height.equalTo(30)
             make.top.equalTo(movieNameLabel.snp.bottom)
             make.leading.equalTo(container).offset(20)
         }
     }
     private func paddingdateLabel(){
         dateLabel.textColor = .lightGray
         dateLabel.font = UIFont.boldSystemFont(ofSize: 30)
     }
    
    
    
    private let voteAvarageImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    private func setVoteAvarageImage(){
        voteAvarageView.addSubview(voteAvarageImage)
        paddingvoteAvarageImage()
        voteAvarageImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    private func paddingvoteAvarageImage(){
        voteAvarageImage.image = UIImage(named: "Laurel")
    }
    
    
    
    private let voteAvagareLabel = UILabel()
       private func setVoteAvagareLabel() {
           voteAvarageView.addSubview(voteAvagareLabel)
           paddingVoteAvagareLabel()
           voteAvagareLabel.snp.makeConstraints { (make) -> Void  in
               make.height.equalTo(15)
               make.leading.equalTo(voteAvarageImage.snp_leadingMargin).offset(20)
               make.trailing.equalTo(voteAvarageImage.snp_trailingMargin).offset(-10)
               make.bottom.equalTo(voteAvarageImage.snp_bottomMargin).offset(-20)
           }
       }
       private func paddingVoteAvagareLabel(){
           voteAvagareLabel.text = "IMDb"
           voteAvagareLabel.textColor = .lightGray
           voteAvagareLabel.font = UIFont.boldSystemFont(ofSize: 15)
       }
    
    
    private let voteAvarageCountLabel = UILabel()
    private func setVoteAvarageCountLabel() {
        voteAvarageView.addSubview(voteAvarageCountLabel)
        paddingVoteAvarageCountLabel()
        voteAvarageCountLabel.snp.makeConstraints { (make) -> Void  in
            make.height.equalTo(20)
            make.leading.equalTo(voteAvarageImage.snp_leadingMargin).offset(20)
            make.trailing.equalTo(voteAvarageImage.snp_trailingMargin).offset(-10)
            make.top.equalTo(voteAvarageImage.snp_topMargin)
        }
    }
    
    
    private func paddingVoteAvarageCountLabel() {
          voteAvarageCountLabel.textColor = .white
          voteAvarageCountLabel.font = UIFont.boldSystemFont(ofSize: 20)
      }
      
      private let voteAvarageView = UIView()
      private func setLaurelView(){
          container.addSubview(voteAvarageView)
          voteAvarageView.snp.makeConstraints { (make) in
              make.top.equalTo(dateLabel.snp_bottomMargin).offset(10)
              make.leading.equalTo(container).offset(20)
              make.width.equalTo(90)
              make.height.equalTo(70)
          }
      }
    
    
    private let runTimeCountLabel = UILabel()
       private func setRunTimeCountLabel() {
           runTimeView.addSubview(runTimeCountLabel)
           paddingRunTimeCountLabel()
           runTimeCountLabel.snp.makeConstraints { (make) -> Void  in
               make.height.equalTo(20)
               make.leading.equalTo(runTimeView.snp_leadingMargin).offset(20)
               make.trailing.equalTo(runTimeView.snp_trailingMargin).offset(-10)
               make.top.equalTo(runTimeView.snp_topMargin)
           }
       }
       private func paddingRunTimeCountLabel(){
           runTimeCountLabel.textColor = .white
           runTimeCountLabel.font = UIFont.boldSystemFont(ofSize: 20)
       }
       
       private let runTimeLabel = UILabel()
       private func setRunTimeLabel() {
           runTimeView.addSubview(runTimeLabel)
           paddingRunTimeLabel()
           runTimeLabel.snp.makeConstraints { (make) -> Void  in
               make.height.equalTo(15)
               make.leading.equalTo(runTimeView.snp_leadingMargin).offset(20)
               make.trailing.equalTo(runTimeView.snp_trailingMargin).offset(-10)
               make.bottom.equalTo(runTimeView.snp_bottomMargin).offset(-17)
           }
       }
       private func paddingRunTimeLabel() {
           runTimeLabel.text = "Mins"
           runTimeLabel.textColor = .lightGray
           runTimeLabel.font = UIFont.boldSystemFont(ofSize: 15)
       }
       
       private let runTimeView = UIView()
       private func setTimeView(){
           container.addSubview(runTimeView)
           runTimeView.snp.makeConstraints { (make) in
               make.top.equalTo(dateLabel.snp_bottomMargin).offset(10)
               make.leading.equalTo(voteAvarageView.snp.trailing).offset(10)
               make.width.equalTo(90)
               make.height.equalTo(70)
           }
       }
       
       private let dividingLine : UIView = {
           let dividingLine = UIView()
           dividingLine.backgroundColor = .white
           return dividingLine
       }()
       private func setDividingLineImage(){
           container.addSubview(dividingLine)
           dividingLine.snp.makeConstraints { (make) in
               make.top.equalTo(voteAvarageView.snp_bottomMargin).offset(15)
               make.leading.trailing.equalTo(25)
               make.trailing.equalTo(-25)
               make.height.equalTo(1)
           }
       }
       
       private let synopsisLabel = UILabel()
       private func setSynopsisLabel() {
           container.addSubview(synopsisLabel)
           paddingSynopsisLabel()
           synopsisLabel.snp.makeConstraints { (make) -> Void  in
               make.height.equalTo(20)
               make.top.equalTo(dividingLine.snp_bottomMargin).offset(20)
               make.leading.equalTo(container.snp_leadingMargin).offset(20)
               make.trailing.equalTo(container.snp_trailingMargin).offset(-10)
           }
       }
       private func paddingSynopsisLabel(){
           synopsisLabel.text = "Synopsis"
           synopsisLabel.textColor = .white
           synopsisLabel.font = UIFont.boldSystemFont(ofSize: 20)
       }
       
       private let SynopsisTextLabel = UILabel()
       private func setSynopsisTextLabel() {
           container.addSubview(SynopsisTextLabel)
           paddingOverview()
           SynopsisTextLabel.snp.makeConstraints { (make) -> Void  in
               make.top.equalTo(synopsisLabel.snp_bottomMargin).offset(20)
               make.leading.equalTo(container.snp_leadingMargin).offset(20)
               make.trailing.equalTo(container.snp_trailingMargin).offset(-10)
               
           }
       }
       private func paddingOverview() {
           SynopsisTextLabel.textColor = .lightGray
           SynopsisTextLabel.font = UIFont.boldSystemFont(ofSize: 15)
           SynopsisTextLabel.numberOfLines = 0
           SynopsisTextLabel.sizeToFit()
           SynopsisTextLabel.lineBreakMode = .byWordWrapping
       }
       
       private let playIcon = UIImageView()
       private func setPlayIcon(){
           posterImage.addSubview(playIcon)
           paddingPlayIcon()
           playIcon.snp.makeConstraints { (make) in
               make.trailing.bottom.equalTo(posterImage).offset(-20)
               make.height.width.equalTo(50)
           }
       }
       private func paddingPlayIcon(){
           playIcon.backgroundColor = UIColor.white
           playIcon.layer.cornerRadius = 25
           playIcon.image = UIImage(named: "playIcon")
       }
       
       private let genresLabel = UILabel()
       private func setGenresLabel(){
           container.addSubview(genresLabel)
           paddingGenresLabel()
           genresLabel.snp.makeConstraints { (make) in
               make.height.equalTo(20)
               make.top.equalTo(SynopsisTextLabel.snp_bottomMargin).offset(20)
               make.leading.equalTo(container.snp_leadingMargin).offset(20)
               make.trailing.equalTo(container.snp_trailingMargin).offset(-10)
           }
       }
       private func paddingGenresLabel(){
           genresLabel.text = "Genres"
           genresLabel.textColor = .white
           genresLabel.font = UIFont.boldSystemFont(ofSize: 20)
       }
       
       
       let genresScrollView =  UIScrollView()
       func setgenresScrollView(){
           container.addSubview(genresScrollView)
           paddingGenresScrollView()
           genresScrollView.snp.updateConstraints { (make) in
               make.top.equalTo(genresLabel.snp_bottomMargin).offset(10)
               make.leading.trailing.equalTo(container).offset(0)
               make.height.equalTo(50)
           }
       }
       private func paddingGenresScrollView(){
           genresScrollView.translatesAutoresizingMaskIntoConstraints = false
           genresScrollView.showsHorizontalScrollIndicator = false
       }
       
       private let genresStackView = UIStackView()
       private func setgenresStackView(){
           genresScrollView.addSubview(genresStackView)
           paddingStackView()
           genresStackView.snp.updateConstraints { (make) in
               make.leading.equalTo(20)
               make.centerY.equalToSuperview()
               make.trailing.equalTo(genresScrollView.snp.trailing)
           }
           for i in 0...genresCount-1 {
               createStackViewButton(i:i)
           }
       }
       private func paddingStackView(){
           genresStackView.axis = .horizontal
           genresStackView.spacing = 10.0
           genresStackView.alignment = .center
           genresStackView.distribution = .equalSpacing
           genresStackView.translatesAutoresizingMaskIntoConstraints = false
       }
       
       func createStackViewButton (i:Int){
           let button = UIButton()
           genresStackView.addArrangedSubview(button)
           button.snp.updateConstraints { (make) in
               make.height.equalTo(40)
           }
           button.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
           button.layer.cornerRadius = 15
           button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           button.setTitleColor(.lightGray, for: .normal)
           button.tag = i
           
           if(button.tag == i){
               button.setTitle(SDM[0].genres![i].name, for: .normal)
           }
       }
       //--------------------------------------------------------------------------------------------------//
       private let castLabel = UILabel()
       private func setCastLabel(){
           container.addSubview(castLabel)
           paddingCastLabel()
           castLabel.snp.makeConstraints { (make) in
               make.height.equalTo(20)
               //     make.top.equalTo(genresScrollView.snp.bottomMargin).offset(20)
               make.leading.equalTo(container.snp_leadingMargin).offset(20)
               make.trailing.equalTo(container.snp_trailingMargin).offset(-10)
               make.top.equalTo(genresLabel.snp.bottomMargin).offset(70)
           }
       }
       private func paddingCastLabel(){
           castLabel.text = "Cast"
           castLabel.textColor = .white
           castLabel.font = UIFont.boldSystemFont(ofSize: 20)
       }
       
       
       let castScrollView =  UIScrollView()
       func setCastScrollView(){
           container.addSubview(castScrollView)
           paddingCastScrollView()
           castScrollView.snp.updateConstraints { (make) in
               make.top.equalTo(castLabel.snp_bottomMargin).offset(10)
               make.leading.trailing.equalTo(container).offset(0)
               make.height.equalTo(150)
           }
       }
       private func paddingCastScrollView(){
           castScrollView.translatesAutoresizingMaskIntoConstraints = false
           castScrollView.showsHorizontalScrollIndicator = false
       }
       
       private let castStackView = UIStackView()
       private func setCastStackView(){
           castScrollView.addSubview(castStackView)
           paddingCastStackView()
           castStackView.backgroundColor = .yellow
           castStackView.snp.updateConstraints { (make) in
               make.leading.trailing.equalTo(20)
               make.trailing.equalTo(-20)
               make.top.equalTo(10)
           }
           for i in 0...castCount-1 {
               createCastImage(i:i)
           }

       }
       private func paddingCastStackView(){
           castStackView.backgroundColor = .purple
           castStackView.axis = .horizontal
           castStackView.spacing = 10.0
           castStackView.alignment = .center
           castStackView.distribution = .equalSpacing
           castStackView.translatesAutoresizingMaskIntoConstraints = false
       }
       
       func createCastImage (i:Int){
           let createCastImage = UIImageView()
           let imageLabel = UILabel()
           castStackView.addArrangedSubview(createCastImage)
           
           createCastImage.snp.updateConstraints { (make) in
               make.height.equalTo(80)
               make.width.equalTo(80)
           }
           
           
           createCastImage.backgroundColor = UIColor.lightGray
           createCastImage.layer.masksToBounds = true
           createCastImage.contentMode = .scaleAspectFill
           createCastImage.layer.cornerRadius = 40
           
           
           if ((SCM[0].cast![i].profile_path?.isEmpty) != nil){
               createCastImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + SCM[0].cast![i].profile_path!, completed: {})
               imageLabel.isHidden = true
           }
           else{
               imageLabel.isHidden = false
           }
           
           
           createCastImage.addSubview(imageLabel)
           imageLabel.snp.updateConstraints { (make) in
               make.top.leading.trailing.bottom.equalToSuperview()
               
           }
           
           imageLabel.textAlignment = .center
           
           imageLabel.text = firstLetterName(a: SCM[0].cast![i].name!)
           
           let nameLabel = UILabel()
           castStackView.addSubview(nameLabel)
           nameLabel.textColor = .lightGray
           nameLabel.lineBreakMode = .byWordWrapping
           nameLabel.numberOfLines = 0
           nameLabel.textAlignment = .center
           nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
           
           
           nameLabel.snp.updateConstraints { (make) in
               make.leading.trailing.equalTo(createCastImage)
               make.top.equalTo(createCastImage.snp_bottomMargin).offset(5)
               make.height.equalTo(50)
               make.centerX.equalTo(createCastImage)
               
           }
           nameLabel.text = SCM[0].cast![i].name!
       }
       
       //--------------------------------------------------------------------------------------------------//
       
       let watchButton = UIButton()
       func setWatchButton(){
           container.addSubview(watchButton)
           watchButton.setTitleColor(.lightGray, for: .normal)
           watchButton.layer.cornerRadius = 15
           watchButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
           watchButton.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
           watchButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20)
           watchButton.setTitle("Watched", for: .normal)
           watchButton.snp.makeConstraints { (make) in
               make.top.equalTo(runTimeCountLabel)
               make.trailing.equalTo(posterImage.snp_trailingMargin)
               make.bottom.equalTo(runTimeLabel.snp_bottomMargin)
               make.width.equalTo(120)
               make.height.equalTo(30)
           }
           watchButton.addTarget(self, action: #selector( watchButtonAction), for: .touchUpInside)
       }
       
       @objc func watchButtonAction(sender: UIButton!) {
           print("Button tapped")
       }
       
       
    func UI(){
        view.backgroundColor = .black
        setScrollView()
        setContainer()
        setPosterImage()
        setmovieNameLabel()
        setdateLabel()
        setLaurelView()
        setVoteAvarageImage()
        setVoteAvagareLabel()
        setVoteAvarageCountLabel()
        setTimeView()
        setRunTimeLabel()
        setRunTimeCountLabel()
        setDividingLineImage()
        setSynopsisLabel()
        setPlayIcon()
        setSynopsisTextLabel()
        setGenresLabel()
        setCastLabel()
        setWatchButton()
    }
    func atamalarYapilacak(){
        
        
        if (SDM[0].name == nil){
           movieNameLabel.text  = "N/A"
        }
        else{
            movieNameLabel.text = String(SDM[0].name!)
        }
//        if let seriesName = SDM[0].name {
//                   movieNameLabel.text  = seriesName
//               }
      //  movieNameLabel.text = SDM[0].name
        dateLabel.text = SDM[0].first_air_date!.convertDatetring_TopreferredFormat(currentFormat: "yyyy-MM-dd", toFormat: "dd MMM yyyy")
        self.voteAvarageCountLabel.text =  String(format: "%.1f", SDM[0].vote_average!)
        posterImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + SDM[0].poster_path!, completed: {})
    
        if let asdas3d = SDM[0].overview{
            SynopsisTextLabel.text = asdas3d
        }
        
    //    trailerKey = String(TRM[0].results![0].key ??  "" )
        
        
        genresCount = SDM[0].genres!.count
        castCount = SCM[0].cast!.count
        
        
        
        //Sayfa Kapanmadan RemoveAll()
        seriesDetailsViewModel.seriesDetailsArray.removeAll()
        trailersViewModel.trailersArray.removeAll()
        seriesCastViewModel.seriesCastArray.removeAll()
        castStackView.removeAllSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        genresStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        castStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        seriesDetailsViewModel.getDataSeriesDetails(id: seriesID, completed: {} )
        seriesCastViewModel.getMoviesCast(id: seriesID, completed: {})
        trailersViewModel.getData(id: seriesID)
        SDM = seriesDetailsViewModel.seriesDetailsArray
        TRM = trailersViewModel.trailersArray
        SCM = seriesCastViewModel.seriesCastArray
        
        atamalarYapilacak()
        
        setgenresScrollView()
        setgenresStackView()
        
        setCastScrollView()
        setCastStackView()
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UI()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           _ = tapGestureRecognizer.view as! UIImageView
           print("resime tıklandı")
           playVideo(key: trailerKey)
       }
       
}
