//
//  YZWAboutController.swift
//  fashionColor
//
//  Created by mac on 2019/7/15.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

class YZWAboutController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
            
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        title = "about".toLocalString()
        
    }
    
    let projectName = ""//"自制壁纸"
        
    let arrTitle = ["关于", "反馈"]//"评分",
    
    let arrInfo = [
        [["image":"fenxiang","title":"share".toLocalString(), "subTitle":"share".toLocalString()],
         
         ["image":"banben","title":"version".toLocalString(), "subTitle":String("V " +  (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String))]],
        
        [["image":"fankui","title":"feedback".toLocalString(), "subTitle":"feedback".toLocalString()]]]

//    [["image":"chakan","title":"查看更新","subTitle":"查看更新版本"],["image":"pingfen","title":"去商城评分","subTitle":"感谢为我们打分"]],
    
    override func loadView() {
        let view = TGRelativeLayout.init()
        view.tg_insetsPaddingFromSafeArea = UIRectEdge.init()
        view.backgroundColor = UIColor.white
        self.view = view
        
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.tg_vertMargin(0)
        tableView.tg_horzMargin(YZWMathSize.rate(rate: 0))
        tableView.backgroundColor = .bgMainColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(YZWAboutTableCell.self, forCellReuseIdentifier: "idCell")
        view.addSubview(tableView)
        
        let tableHeaderView = TGLinearLayout.init(.vert)
        tableHeaderView.tg_size(width: .fill, height: YZWMathSize.rate(rate: 50))
//        tableView.backgroundColor = UIColor.mainColor().withAlphaComponent(0.3)
        tableView.tableHeaderView = tableHeaderView

        let lbTitle = UILabel.init()
        lbTitle.text = projectName
        lbTitle.textColor = .mainBlackColor()
        lbTitle.font = .fontRate(size: 18)
        lbTitle.tg_size(width: .wrap, height: .wrap)
//        lbTitle.backgroundColor = UIColor.mainColor().withAlphaComponent(0.4)
        lbTitle.cornerRadius(value: YZWMathSize.rate(rate: 3))
        lbTitle.tg_top.equal(YZWMathSize.rate(rate: 20))
        lbTitle.tg_left.equal(YZWMathSize.rate(rate: 40))
        tableHeaderView.addSubview(lbTitle)
        
        let tableFooterView = TGRelativeLayout.init()
        tableFooterView.tg_size(.wrap)
        tableFooterView.tg_horzMargin(0)
        tableView.tableFooterView =  tableFooterView
        
    }
    
}

extension YZWAboutController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowArr = arrInfo[section]
        return rowArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : YZWAboutTableCell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! YZWAboutTableCell
        
        let rowArr = arrInfo[indexPath.section]
        let dic = rowArr[indexPath.row]
        cell.lbTitle.text = dic["title"]
        cell.lbSubTitle.text = dic["subTitle"]
        cell.rightImage.image = UIImage.init(named: dic["image"]!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                openYingYong()
//            } else if indexPath.row == 1 {
//                openPingFen()
//            }
//        } else if indexPath.section == 1 {
//            if indexPath.row == 0 {
//                systemShare(arr: [NSString.getYingYongAddress()])
//            }
//        } else if indexPath.section == 2 {
//            if indexPath.row == 0 {
//                openYouJian()
//            }
//        }
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                systemShare(arr: [NSString.getYingYongAddress()])
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                openYouJian()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bgView = TGRelativeLayout.init()
        bgView.tg_size(width: aaqScreenWidth, height: YZWMathSize.rate(rate: 40))
        bgView.tg_padding = UIEdgeInsets.init(top: YZWMathSize.rate(rate: 10), left: YZWMathSize.rate(rate: 40), bottom: 0, right: YZWMathSize.rate(rate: 40))
        
        let lbTitle = UILabel.init()
        lbTitle.tg_size(width: .fill, height: .fill)
        lbTitle.text = arrTitle[section]
//        lbTitle.textAlignment = .center
        lbTitle.textColor = .mainColor()
        lbTitle.font = .fontRate(fontName: "Copperplate-Bold", size: 17)
        bgView.addSubview(lbTitle)
        return bgView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return YZWMathSize.rate(rate: 40)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return YZWMathSize.rate(rate: 1)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }

}
