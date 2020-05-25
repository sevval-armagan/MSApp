//
//  HomePageVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

class HomePageVC: UIViewController {
    
    lazy var trendsViewModel: TrendsViewModel = {
        let trendsVM = TrendsViewModel()
        trendsVM.delegate = self
        return trendsVM
        
    }()
    lazy var peoplesViewModel: PeoplesViewModel = {
        let peoplesVM = PeoplesViewModel()
        peoplesVM.delegate = self
        return peoplesVM
        
    }()
    
    lazy var genresViewModel: GenresViewModel = {
        let genresVM = GenresViewModel()
        genresVM.delegate = self
        return genresVM
        
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
       // container.backgroundColor = UIColor.green
        scrollView.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top)
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
        peoplesCollectionView.delegate = self
        peoplesCollectionView.dataSource = self
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
    }
    
    //PeopleCollectionView
    fileprivate let peoplesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let peopleCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        peopleCView.translatesAutoresizingMaskIntoConstraints = false
        peopleCView.register(PeoplesCollectionViewCell.self, forCellWithReuseIdentifier: "peopleCell")
        return peopleCView
    }()
    
    //GenresCollectionView
    fileprivate let genresCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let genresCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        genresCView.translatesAutoresizingMaskIntoConstraints = false
        genresCView.register(GenresCollectionViewCell.self, forCellWithReuseIdentifier: "genresCell")
        return genresCView
    }()
    
    
    let trendsLabel = UILabel()
    let peopleLabel = UILabel()
    let genresLabel = UILabel()
    
    func setTrendsLabel() {
        container.addSubview(trendsLabel)
        trendsLabel.snp.makeConstraints { (make) -> Void  in
            trendsLabel.text = "Trends"
            trendsLabel.textColor = .white
            make.height.equalTo(45)
            make.top.equalTo(container).offset(10)
            make.leading.equalTo(container).offset(10)
            make.trailing.equalTo(container).offset(-10)
        }
    }
    func setPeoplesLabel(){
        container.addSubview(peopleLabel)
        peopleLabel.snp.makeConstraints { (make) -> Void in
            peopleLabel.text = "Popular People"
            peopleLabel.textColor = .white
            make.width.equalTo(container)
            make.height.equalTo(45)
            make.topMargin.equalTo(moviewCollectionView.snp.bottom).offset(10)
        }
    }
    
    func setGenresLabel(){
        container.addSubview(genresLabel)
        genresLabel.snp.makeConstraints { (make) -> Void in
            genresLabel.text = "Genres"
            genresLabel.textColor = .white
            make.width.equalTo(container)
            make.height.equalTo(45)
            make.topMargin.equalTo(peoplesCollectionView.snp.bottom).offset(10)
        }
    }
    func setMoviesCollectionView(){
        container.addSubview(moviewCollectionView)
        moviewCollectionView.backgroundColor = .black
        moviewCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(trendsLabel.snp.bottom)
            make.height.equalTo(430)
        }
    }
    
    func setPeoplesCollectionView(){
        container.addSubview(peoplesCollectionView)
        peoplesCollectionView.backgroundColor = .yellow
        peoplesCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(peopleLabel.snp.bottom)
            make.height.equalTo(220)
        }
        
    }
    func setGenresCollectionView(){
        container.addSubview(genresCollectionView)
        genresCollectionView.backgroundColor = .yellow
        genresCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(genresLabel.snp.bottom)
            make.height.equalTo(220)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContainer()
        setupDelegate()
        setTrendsLabel()
        setMoviesCollectionView()
        setPeoplesLabel()
        setPeoplesCollectionView()
        setGenresLabel()
        setGenresCollectionView()
        
        self.trendsViewModel.getData()
        self.peoplesViewModel.getData22()
        self.genresViewModel.getData()
        
    }
    
    
}

//moviesCollecitonView viewmodel deki protocol sınıfa uyarlanması yani parse işlemi tamamlandığında reload yap.
extension HomePageVC: TrendsViewModelDelegate,PeoplesViewModelDelegate,GenresViewModelDelegate{
    func requestCompleted2() {
        DispatchQueue.main.async {
            self.peoplesCollectionView.reloadData()
        }
    }
    
    
    
    func requestCompleted() {
        DispatchQueue.main.async {
            self.moviewCollectionView.reloadData() 
        }
    }
    
}

//Collection View Extensions
extension HomePageVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == moviewCollectionView){
            return trendsViewModel.array[0].results.count
        }
        else if(collectionView == peoplesCollectionView)
        {
            return 10//peoplesViewModel.array[0].results!.count
        }
        else{
            return 10
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == moviewCollectionView){
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
        else if(collectionView == peoplesCollectionView)
        {
            let peopleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as! PeoplesCollectionViewCell
            
          /*  let url = URL(string: "https://image.tmdb.org/t/p/original" + peoplesViewModel.array[0].results![indexPath.row].poster_path!)
            URLSession.shared.dataTask(with: url!){
                (data,response,error) in
                if error != nil{
                    print("error")
                    return
                }
                DispatchQueue.main.async {
                    peopleCell.peopleImage.image = UIImage(data: data!)
                }
            }.resume()*/
            
            return peopleCell
            
        }
        else{
            let genresCell = collectionView.dequeueReusableCell(withReuseIdentifier: "genresCell", for: indexPath) as! GenresCollectionViewCell
            return genresCell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == moviewCollectionView){
            return CGSize(width: 280, height: 420)
        }
        else if(collectionView == peoplesCollectionView)
        {
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
        else{
            return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
        }
        
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == moviewCollectionView){

            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3) //En üstteki hangisiydi bu üçünden?
        }
        else if(collectionView == peoplesCollectionView)
        {
            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        }
        else{
            return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        }
    }
    
}


