//
//  SegmentedControllerVC.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 25.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit
import SnapKit

class SegmentedControllerVC: UIViewController {
    
    
     let segmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Movies", at: 0, animated: false)
        sc.insertSegment(withTitle: "Series", at: 1, animated: false)
        sc.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
        return sc
    }()
    func setSegmnetedController(){
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(60)
        }
    }
    
    let container = UIView()
    func setContainer(){
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(view)
        }
    }
    
    
    func addAsChildVC(childVC : UIViewController){
        addChild(childVC)
        container.addSubview(childVC.view)
      //  childVC.view.frame = container.frame
        childVC.didMove(toParent: self)
    }
    
    
    lazy var moviesVC: MoviesSeriesVC = {
        let vc = MoviesSeriesVC()
        self.addAsChildVC(childVC: vc)
        vc.view.frame = container.frame
        return vc
    }()
    
    lazy var seriesVC: SeriesVC = {
        let vc = SeriesVC()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    
    
    @objc func madeSelection(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            moviesVC.view.isHidden = false
            seriesVC.view.isHidden = true
            
        case 1:
            seriesVC.view.isHidden = false
            moviesVC.view.isHidden = true
            
        default:
            view.backgroundColor = .yellow
        }
        
        
    }
    
    private func removeAsChildVC(childVC: UIViewController){
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmnetedController()
        setContainer()
        moviesVC.view.isHidden = false
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    
}
