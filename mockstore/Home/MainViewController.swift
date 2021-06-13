//
//  ViewController.swift
//  mockstore
//
//  Created by Harie Venad on 12/06/21.
//  Copyright © 2021 Harie. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var appCollectionView: UICollectionView!
    @IBOutlet weak var groupTableView: UITableView!
    
    var sectionCount: Int = -1
    
    
    var mobileBrand = [MobileBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mobileBrand.append(MobileBrand.init(isExpanded: false, brandName: "Apple", mobileName: ["iPhone 5s","iPhone 6","iPhone 6s", "iPhone 7+", "iPhone 8", "iPhone 8+", "iPhone 11", "iPhone 11 Pro"]))
        mobileBrand.append(MobileBrand.init(isExpanded: false, brandName: "Samsung", mobileName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
        mobileBrand.append(MobileBrand.init(isExpanded: false, brandName: "Mi", mobileName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
        mobileBrand.append(MobileBrand.init(isExpanded: false, brandName: "Huawei", mobileName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
    }
    
    func setupView(){
        groupTableView.delegate = self
        groupTableView.dataSource = self
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.backgroundColor = UIColor.white
        appCollectionView.register(PrimaryCategoryCell.nib(), forCellWithReuseIdentifier: PrimaryCategoryCell.identifier)
        groupTableView.register(GroupTableCell.nib(), forCellReuseIdentifier: GroupTableCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryCategoryCell.identifier, for: indexPath) as! PrimaryCategoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }



}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobileBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (mobileBrand[section].mobileName?.count)! > 4 ? ((mobileBrand[section].mobileName?.count)!) - 4 : (mobileBrand[section].mobileName?.count)!
        let modified = (mobileBrand[section].mobileName?.count)! - count
        if(!mobileBrand[section].isExpanded && modified != 0){
            return modified
        }
        return (mobileBrand[section].mobileName?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableCell.identifier, for: indexPath) as! GroupTableCell
        cell.textLabel?.text = mobileBrand[indexPath.section].mobileName?[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return mobileBrand[section].brandName
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = UIColor.white
        let headerLbl = UILabel(frame: CGRect(x: 15, y: 0, width: headerView.frame.width - 15, height: 40))
        headerLbl.textColor = UIColor.red
        headerLbl.text =  mobileBrand[section].brandName
        headerView.addSubview(headerLbl)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var titleLbl: String
        if(!mobileBrand[section].isExpanded){
            titleLbl = "Show More"
        } else {
            titleLbl = "Show Less"
        }
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        footerView.backgroundColor = UIColor.white
        let showMoreButton = UIButton.init(type: .system)
        showMoreButton.frame = CGRect(x: 50, y: 0, width: 200, height: 40)
        showMoreButton.setTitle(titleLbl, for: .normal)
        showMoreButton.layer.borderWidth = 3.0
        showMoreButton.tag = section
        showMoreButton.layer.borderColor = UIColor.red.cgColor
        showMoreButton.titleLabel?.textColor = UIColor.black
        showMoreButton.tintColor = UIColor.red
        showMoreButton.layer.cornerRadius = 15.0
        showMoreButton.addTarget(self, action: #selector(showMoreAction), for: .touchUpInside)
        footerView.addSubview(showMoreButton)
        return footerView
    }
    
    @objc func showMoreAction(sender:UIButton){
        var indexpaths = [IndexPath]()
        let section = sender.tag
        for row in (mobileBrand[section].mobileName?.indices)!{
            let indexpath = IndexPath(row: row, section: section)
            indexpaths.append(indexpath)
        }
        let isExpanded = mobileBrand[section].isExpanded
        mobileBrand[section].isExpanded = !isExpanded
        groupTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
}


struct MobileBrand {
    var isExpanded: Bool
    var brandName: String?
    var mobileName: [String]?
    
    init(isExpanded: Bool, brandName: String, mobileName: [String]) {
        self.isExpanded = isExpanded
        self.brandName = brandName
        self.mobileName = mobileName
    }
}


