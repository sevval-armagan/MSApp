//
//  SegmentedVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 13.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
private let movies = HomePageVC()
class SegmentedVC: UIViewController{
   
    
    fileprivate let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Movies", at: 0, animated: false)
        sc.insertSegment(withTitle: "Series", at: 1, animated: false)
     //   sc.addTarget(self, action: #selector(handleSegmentedChange), for: .valueChanged)
        return sc
    }()
    func setSegmnetedController(){
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.snp.makeConstraints { (make) in
           make.top.equalTo(view).offset(95)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(60)
        }
    }
  /*  @objc fileprivate func handleSegmentedChange(){
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            
        case 1:
            
            
        default:
            view.backgroundColor = .yellow
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setSegmnetedController()
        setScrollView()
      setContainer()
        setupDelegate()
    setMoviesCollectionView()
        
        self.trendsViewModel.getData()
        self.seriesViewModel.getDataSeries()
        
        
        
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
    
    
    let scrollView = UIScrollView()
       func setScrollView(){
           view.addSubview(scrollView)
           scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
               make.leading.equalTo(view).offset(0)
               make.trailing.equalTo(view).offset(0)
               make.bottom.equalTo(view).offset(0)
           }
       }
    let container = UIView()
    func setContainer(){
        scrollView.addSubview(container)
        container.backgroundColor = .black
        container.snp.makeConstraints { (make) in
         make.top.equalTo(scrollView).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(view)
        }
    }
    func setupDelegate(){
           moviewCollectionView.delegate = self
           moviewCollectionView.dataSource = self
          
       }
       
    fileprivate let moviewCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let movieCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCView.translatesAutoresizingMaskIntoConstraints = false
        movieCView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        return movieCView
    }()
    
    
    
    func setMoviesCollectionView(){
        container.addSubview(moviewCollectionView)
        moviewCollectionView.backgroundColor = .black
        moviewCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(container)
            make.height.equalTo(430)
        }
    }
    
    lazy var trendsViewModel: TrendsViewModel = {
        let trendsVM = TrendsViewModel()
        trendsVM.delegate = self
        return trendsVM
        
    }()
    
    lazy var seriesViewModel: SeriesViewModel = {
          let seriesVM = SeriesViewModel()
         // trendsVM.delegate = self
          return seriesVM
          
      }()
}

extension SegmentedVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
            return 20
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
                moviesCell.backgroundColor = .green
                let url = URL(string: "https://image.tmdb.org/t/p/original" + trendsViewModel.array[0].results[indexPath.row].poster_path!)
            
                URLSession.shared.dataTask(with: url!){
                    (data,response,error) in
                    if error != nil{
                        print("error")
                        return
                    }
                    DispatchQueue.main.async {
                        moviesCell.posterImage.image = UIImage(data : data!)
                    }
                }.resume()
                return moviesCell
        }
       
            
        else {
            let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
                moviesCell.backgroundColor = .green
            let url = URL(string: "https://image.tmdb.org/t/p/original" + seriesViewModel.array1[0].results![indexPath.row].poster_path!)
            
                URLSession.shared.dataTask(with: url!){
                    (data,response,error) in
                    if error != nil{
                        print("error")
                        return
                    }
                    DispatchQueue.main.async {
                        moviesCell.posterImage.image = UIImage(data : data!)
                    }
                }.resume()
                return moviesCell
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 280, height: 420)
        
        
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       

            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
       
    }
    
}


extension SegmentedVC: TrendsViewModelDelegate{
    func requestCompleted() {
        DispatchQueue.main.async {
            self.moviewCollectionView.reloadData()
        }
    }
    
}
