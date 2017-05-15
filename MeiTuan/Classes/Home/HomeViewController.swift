//
//  HomeViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

let cellWidth = (SCREENW-60)/5

let themeTopCellW = (SCREENW-60)/3
let themeBottomCellW = (SCREENW-50)/4

class HomeViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    let pageControl = UIPageControl()
    var categoryCollection:UICollectionView? = nil
    var themeCollection:UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    private func initUI()  {
        let head = UIView.init(frame: CGRect(x:0,y:0,width:SCREENW,height:SCREENH-80))
        head.backgroundColor = RGBColor(r: 239, g: 239, b: 239)
        
        let category = UIView.init(frame: CGRect(x:0,y:0,width:SCREENW,height:2*cellWidth+100))
        head.addSubview(category)
        
        let categoryLayout = UICollectionViewFlowLayout()
        //categoryLayout.itemSize = CGSize(width:cellWidth,height:cellWidth+20)
        categoryLayout.scrollDirection = .horizontal
        categoryLayout.minimumInteritemSpacing = 5
        
        let categoryCollection = UICollectionView.init(frame: CGRect(x:0,y:0,width:SCREENW,height:2*cellWidth+70), collectionViewLayout: categoryLayout)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.backgroundColor = UIColor.white
        categoryCollection.showsHorizontalScrollIndicator = false
        categoryCollection.isPagingEnabled = true
        category.addSubview(categoryCollection)
        categoryCollection.register(UINib.init(nibName: "HomeCategoryCell", bundle: nil), forCellWithReuseIdentifier: "homeCell")
        self.categoryCollection = categoryCollection
        
        pageControl.frame = CGRect(x:0,y:2*cellWidth+70,width:SCREENW,height:30)
        pageControl.backgroundColor = UIColor.white
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = BaseColor
        category.addSubview(pageControl)
        
        let theme = UIView.init(frame: CGRect(x:0,y:2*cellWidth+100+10,width:SCREENW,height:2*themeTopCellW+100))
        theme.backgroundColor = UIColor.red
        head.addSubview(theme)
        
        let themeLayout = UICollectionViewFlowLayout()
        
        let themeCollection = UICollectionView.init(frame: theme.bounds, collectionViewLayout:themeLayout)
        themeCollection.delegate = self
        themeCollection.dataSource = self
        themeCollection.isScrollEnabled = false
        themeCollection.backgroundColor = UIColor.white
        theme.addSubview(themeCollection)
        themeCollection.register(UINib.init(nibName: "ThemeCell", bundle: nil), forCellWithReuseIdentifier: "themeCell")
        self.themeCollection = themeCollection
        
        let homeTable = UITableView.init(frame: view.bounds, style: .plain)
        homeTable.tableHeaderView = head
        view.addSubview(homeTable)
    }
    //collectionviewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(self.categoryCollection) {
            return 20
        }else{
            return 7
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.isEqual(themeCollection) {
            if indexPath.item<3 {
                return CGSize(width:themeTopCellW,height:themeTopCellW+50)
            }else{
                return CGSize(width:themeBottomCellW,height:themeTopCellW+50)
            }
        }else{
            return CGSize(width:cellWidth,height:cellWidth+20)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.isEqual(categoryCollection) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCategoryCell
            cell.configCell(index: indexPath)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "themeCell", for: indexPath) as! ThemeCell
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10,10, 10, 10)
    }
    //scrollDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isKind(of: UICollectionView.self) {
            var page = scrollView.contentOffset.x/SCREENW
            if page>0.97 {
                page = 1
            }
            pageControl.currentPage = Int(page)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
