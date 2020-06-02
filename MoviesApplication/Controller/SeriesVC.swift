//
//  SeriesVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 26.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class SeriesVC: UIViewController, MovieDetailsViewModelDelegate {
    func requestCompleted76() {
        
    }
    
    
    lazy var seriesViewModel: SeriesViewModel = {
        let seriesVM = SeriesViewModel()
        seriesVM.delegate = self
        return seriesVM
        
    }()
    
    lazy var moviesDetailsViewModel: MovieDetailsViewModel = {
           let moviesDetailsVM = MovieDetailsViewModel()
           moviesDetailsVM.delegate = self
           return moviesDetailsVM
           
       }()
       
       lazy var trailersViewModel: TrailersViewModel = {
           let trailersVM = TrailersViewModel()
           trailersVM.delegate = self
           return trailersVM
       }()
       
    let seriesDetails = SeriesDetailsVC()
    
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
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(1300)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }
    }
    
   
    
    fileprivate let seriesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let seriesCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        seriesCView.translatesAutoresizingMaskIntoConstraints = false
        seriesCView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        return seriesCView
    }()
    
    func setupDelegate(){
           seriesCollectionView.delegate = self
           seriesCollectionView.dataSource = self
           
       }
    
    
    
    let trendsLabel = UILabel()
    func setTrendsLabel() {
        container.addSubview(trendsLabel)
        trendsLabel.snp.makeConstraints { (make) -> Void  in
            trendsLabel.text = "Trends"
            trendsLabel.font = UIFont.boldSystemFont(ofSize: 25)
            trendsLabel.textColor = .white
            make.height.equalTo(45)
            make.top.equalTo(container)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }

    
    
    func setSeriesCollectionView(){
        container.addSubview(seriesCollectionView)
        seriesCollectionView.backgroundColor = .black
        seriesCollectionView.layer.cornerRadius = 10.0
        seriesCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(trendsLabel.snp.bottom)
            make.height.equalTo(430)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContainer()
        setupDelegate()
        setTrendsLabel()
        setSeriesCollectionView()
        
        self.seriesViewModel.getDataSeries()
        
        
        let flowLayout = UPCarouselFlowLayout()
              flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: seriesCollectionView.frame.size.height)
              flowLayout.scrollDirection = .horizontal
              flowLayout.sideItemScale = 0.8
              flowLayout.sideItemAlpha = 1.0
              flowLayout.spacingMode = .fixed(spacing: 5.0)
              seriesCollectionView.collectionViewLayout = flowLayout
              
              
              func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
                  let layout = self.seriesCollectionView.collectionViewLayout as! UPCarouselFlowLayout
                  let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
                  let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
                  currentPage = Int(floor(offset - pageSide / 2) / pageSide + 1)
              }
        
    }
    
    
    fileprivate var currentPage: Int = 0 {
        didSet{
            print("")
        }
    }
    fileprivate var pageSize: CGSize{
        let layout = self.seriesCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
            
        } else{
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
}

extension SeriesVC: TrendsViewModelDelegate, TrailersViewModelDelegate{
    func trailersRequestCompleted() {
        
    }
    
    func requestCompleted() {
        DispatchQueue.main.async {
            self.seriesCollectionView.reloadData()
        }
    }
    
}

extension SeriesVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return seriesViewModel.seriesArray[0].results!.count
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let seriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        seriesCell.posterImage.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
               seriesCell.posterImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + seriesViewModel.seriesArray[0].results![indexPath.row].poster_path!, completed: {})
        
        return seriesCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     //seriesViewModel.seriesArray[0].results![indexPath.row].id
        seriesDetails.seriesID =  String( seriesViewModel.seriesArray[0].results![indexPath.row].id! )
        
        self.present(seriesDetails, animated: true, completion: nil)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 280, height: 420)
        
        
    }

    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        
    }

}





