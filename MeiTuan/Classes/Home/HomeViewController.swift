//
//  HomeViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

let cellWidth = (SCREENW-60)/5
let cellHeight = cellWidth+20

let themeCellW = SCREENW/4

class HomeViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{

    let pageControl = UIPageControl()
    var categoryCollection:UICollectionView? = nil
    var themeCollection:UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    private func initUI()  {
        let head = UIView.init(frame:.zero)
        head.backgroundColor = RGBColor(r: 239, g: 239, b: 239)
        
        let category = UIView.init(frame:.zero)
        head.addSubview(category)
        
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.itemSize = CGSize(width:cellWidth,height:cellHeight)
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
        
         category.frame = CGRect(x:0,y:0,width:SCREENW,height:categoryCollection.frame.size.height+30)
        
        pageControl.frame = CGRect(x:0,y:2*cellWidth+70,width:SCREENW,height:30)
        pageControl.backgroundColor = UIColor.white
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = BaseColor
        category.addSubview(pageControl)
        
        let themeLayout = UICollectionViewFlowLayout()
        themeLayout.itemSize = CGSize(width:themeCellW-10,height:themeCellW+20)
        
        let themeCollection = UICollectionView.init(frame: CGRect(x:0,y:categoryCollection.frame.size.height+30+10,width:SCREENW,height:2*themeCellW+50), collectionViewLayout:themeLayout)
        themeCollection.delegate = self
        themeCollection.dataSource = self
        themeCollection.isScrollEnabled = false
        themeCollection.backgroundColor = UIColor.white
        head.addSubview(themeCollection)
        themeCollection.register(UINib.init(nibName: "ThemeCell", bundle: nil), forCellWithReuseIdentifier: "themeCell")
        self.themeCollection = themeCollection
        
        let  tip = UILabel.init(frame: CGRect(x:0,y:category.frame.size.height+themeCollection.frame.size.height+20,width:SCREENW,height:50))
        tip.text = "- 猜你喜欢 -"
        tip.backgroundColor = UIColor.white
        tip.textAlignment = .center
        head.addSubview(tip)
        
        head.frame = CGRect(x:0,y:0,width:SCREENW,height:category.frame.size.height+themeCollection.frame.size.height+60)
        
        let homeTable = UITableView.init(frame: view.bounds, style: .plain)
        homeTable.delegate = self
        homeTable.dataSource = self
        homeTable.tableHeaderView = head
        homeTable.rowHeight = 120
        view.addSubview(homeTable)
        homeTable.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    //collectionviewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(self.categoryCollection) {
            return 20
        }else{
            return 8
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
        if collectionView.isEqual(categoryCollection) {
            return UIEdgeInsetsMake(10,10, 10, 10)
        }else{
            return UIEdgeInsetsMake(0, 0, 0, 0)
        }
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
    //tableviewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
