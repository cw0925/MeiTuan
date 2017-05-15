//
//  HomeCategoryCell.swift
//  MeiTuan
//
//  Created by CW on 2017/5/15.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(index:IndexPath) {
        let iconArr = ["icon_homepage_foodCategory_44x44_","icon_homepage_trainCategory_44x44_","icon_homepage_movieCategory_44x44_","icon_homepage_KTVCategory_44x44_","icon_homepage_hotelCategory_44x44_","icon_homepage_aroundjourneyCategory_44x44_","icon_homepage_entertainmentCategory_44x44_","icon_homepage_beautyCategory_44x44_","icon_homepage_takeoutCategory_44x44_","icon_homepage_holidayCategory_43x43_","icon_homepage_highStarHotelCategory_43x43_","icon_homepage_sceneryCategory_44x44_","icon_homepage_foottreatCategory_44x44_","icon_homepage_travellingCategory_43x43_","icon_homepage_clothingCategory_44x44_","icon_homepage_educationCategory_43x43_","icon_homepage_momInfantCategory_43x43_","icon_homepage_homeDecorationCategory_43x43_","icon_homepage_marriageCategory_43x43_","icon_homepage_moreCategory_43x43_"];
        let titleArr = ["美食","机票/火车票","猫眼电影","KTV","酒店住宿","周边游","休闲娱乐","丽人/美发","外卖","旅游出行","高端酒店","景点","运动健身","温泉","生活服务","学习培训","母婴亲子","家装","结婚/摄影","全部分类"];
        icon.image = UIImage.init(named: iconArr[index.item])
        title.text = titleArr[index.item]
        title.font = UIFont.systemFontWithScale(size: 10)
    }
}
