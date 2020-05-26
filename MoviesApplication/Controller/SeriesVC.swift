//
//  SeriesVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 26.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class SeriesVC: UIViewController {
    
    lazy var seriesViewModel: SeriesViewModel = {
        let seriesVM = SeriesViewModel()
        // trendsVM.delegate = self
        return seriesVM
        
    }()
    
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
    
    func setSeriesCollectionView(){
        container.addSubview(seriesCollectionView)
        seriesCollectionView.backgroundColor = .black
        seriesCollectionView.layer.cornerRadius = 10.0
        seriesCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(container).offset(10)
            make.height.equalTo(430)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContainer()
        setupDelegate()
        setSeriesCollectionView()
        
        self.seriesViewModel.getDataSeries()
        
        
        let flowLayout = UPCarouselFlowLayout()
              flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: seriesCollectionView.frame.size.height)
              flowLayout.scrollDirection = .horizontal
              flowLayout.sideItemScale = 0.8
              flowLayout.sideItemAlpha = 1.0
              flowLayout.spacingMode = .fixed(spacing: 5.0)
              //              moviewCollectionView.collectionViewLayout = flowLayout
              
              
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

extension SeriesVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 280, height: 420)
        
        
    }

    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        
    }

}





