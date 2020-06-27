//
//  SearchButtonVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 7.06.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

class SearchButtonVC: UIViewController, UITextFieldDelegate {
    
    let searchContainer = UIView()
      func setsearchContainer(){
          view.addSubview(searchContainer)
          // container.backgroundColor = .systemPink
          searchContainer.snp.makeConstraints { (make) in
              make.top.equalTo(view)
              make.leading.equalTo(view)
              make.trailing.equalTo(view)
              make.height.equalTo(70)
          }
      }
      
    let textField = UITextField()
    func setTextField(){
        searchContainer.addSubview(textField)
        textField.placeholder = "Search"
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
        textField.layer.cornerRadius = 15
        textField.leftViewMode = UITextField.ViewMode.always
        var imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        var image = UIImage(named: "search")
        
        imageView.image = image;
        textField.leftView = imageView
        textField.leftView?.frame = CGRect(x: 30, y: 5, width: 20 , height:20)
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(searchContainer).offset(10)
            make.leading.equalTo(searchContainer).offset(10)
            make.trailing.equalTo(searchContainer).offset(-10)
            make.height.equalTo(60)
            
        }
    }
    

    let scrollView = UIScrollView()
    func setScrollView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(searchContainer.snp_bottomMargin).offset(0)
            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            
        }
    }
    
    let container = UIView()
    func setContainer(){
        scrollView.addSubview(container)
        // container.backgroundColor = .systemPink
        container.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(1300)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }
    }
    
    
    
    let moviesLabel = UILabel()
       func setmoviesLabel() {
           container.addSubview(moviesLabel)
           moviesLabel.snp.makeConstraints { (make) -> Void  in
               moviesLabel.text = "movies"
               moviesLabel.font = UIFont.boldSystemFont(ofSize: 25)
               moviesLabel.textColor = .darkGray
               make.height.equalTo(45)
            make.top.equalTo(container).offset(15)
               make.leading.equalTo(container).offset(10)
               make.trailing.equalTo(container).offset(-10)
           }
       }
    
     fileprivate let moviesCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         let moviesCView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         moviesCView.translatesAutoresizingMaskIntoConstraints = false
         moviesCView.register(SearchMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "moviesCell")
         return moviesCView
     }()
    func setmoviesCollectionView(){
        container.addSubview(moviesCollectionView)
        moviesCollectionView.backgroundColor =  UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
        moviesCollectionView.layer.cornerRadius = 10.0
        moviesCollectionView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.top.equalTo(moviesLabel.snp.bottom).offset(10)
            make.height.equalTo(300)
        }
        
    }
    
    
    func setupDelegate(){
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setsearchContainer()
        setTextField()
        setScrollView()
        setContainer()
        setmoviesLabel()
        setupDelegate()
        setmoviesCollectionView()
        // Do any additional setup after loading the view.
    }
    
    
    
}



extension SearchButtonVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! SearchMoviesCollectionViewCell
         moviesCell.posterImage.backgroundColor = .black
        return moviesCell
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
             return CGSize(width: 195, height: 293)
        
    }
    
    //TODO: Cell'lerin kenarlara olan uzaklıkları
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
}
