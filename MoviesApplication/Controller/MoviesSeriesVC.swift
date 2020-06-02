//
//  HomePageVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

class MoviesSeriesVC: UIViewController, MovieDetailsViewModelDelegate {
    func requestCompleted76() {
        
    }
    
    
    
    
    lazy var trendsViewModel: TrendsViewModel = {
        let trendsVM = TrendsViewModel()
        trendsVM.delegate = self
        return trendsVM
        
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
    
    let moviesDetails = MovieDetailsVC()
    
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
    
    //moviesCollectionView
    fileprivate let moviewCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let movieCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCView.translatesAutoresizingMaskIntoConstraints = false
        movieCView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        return movieCView
    }()
    
    func setupDelegate(){
        moviewCollectionView.delegate = self
        moviewCollectionView.dataSource = self
        
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
    
    func setMoviesCollectionView(){
        container.addSubview(moviewCollectionView)
        moviewCollectionView.backgroundColor = .black
        moviewCollectionView.layer.cornerRadius = 10.0
        moviewCollectionView.snp.makeConstraints { (make) -> Void in
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
        setMoviesCollectionView()
        
        
        self.trendsViewModel.getData()
        
       
        
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: moviewCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        moviewCollectionView.collectionViewLayout = flowLayout
        
        
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
            let layout = self.moviewCollectionView.collectionViewLayout as! UPCarouselFlowLayout
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
        let layout = self.moviewCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
            
        } else{
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
}

//moviesCollecitonView viewmodel deki protocol sınıfa uyarlanması yani parse işlemi tamamlandığında reload yap.
extension MoviesSeriesVC: TrendsViewModelDelegate, TrailersViewModelDelegate{
    func trailersRequestCompleted() {
        
    }
    
    func requestCompleted() {
        DispatchQueue.main.async {
            self.moviewCollectionView.reloadData() 
        }
    }
    
}

//Collection View Extensions
extension MoviesSeriesVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trendsViewModel.array[0].results.count
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        moviesCell.posterImage.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
        moviesCell.posterImage.loadImageAsync(with: "https://image.tmdb.org/t/p/original" + trendsViewModel.array[0].results[indexPath.row].poster_path!, completed: {})
        return moviesCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviesDetails.movieID = String(trendsViewModel.array[0].results[indexPath.row].id)
        self.present(moviesDetails, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 420)
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
}
