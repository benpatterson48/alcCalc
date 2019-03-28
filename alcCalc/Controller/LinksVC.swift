//
//  LinksVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 3/26/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit
import StoreKit

class LinksVC: UIViewController {
    
    var linksArray: [Links] = [Links(icon: "instagram", title: "Follow FDL on IG", subTitle: "Access to DAILY content on Flexible Dieting"),
                               Links(icon: "website", title: "FDL Website", subTitle: "Access to tons of content and other FDL offers"),
                               Links(icon: "app", title: "FDL iOS App", subTitle: "Access FDL content and Recipe Vault straight from your phone"),
                               Links(icon: "cookiebutter", title: "Shop Cookie Butter", subTitle: "Explore our LOVED Macro and Keto-Friendly Cookie Butter"),
                               Links(icon: "review", title: "Leave a Review", subTitle: "Let us know if you love the app!")]
    
    let table: UITableView = {
        let table = UITableView()
        table.isScrollEnabled = false
        table.separatorStyle = .singleLine
        table.separatorInset.left = 16
        table.separatorInset.right = 16
        table.separatorColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 0.7496521832)
        table.register(LinksCell.self, forCellReuseIdentifier: "cellId")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let topViewHeaderBg: UIView = {
        let top = UIView()
        top.backgroundColor = #colorLiteral(red: 0, green: 0.7743021846, blue: 0.8264589906, alpha: 1)
        top.translatesAutoresizingMaskIntoConstraints = false
        return top
    }()
    
    let topViewHeaderTitleLbl: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont.mainSemiBoldFont(ofSize: 26)
        title.text = "Quick Links"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let topViewHeaderBackBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeBtnWasPressed), for: .touchUpInside)
        return button
    }()

    @objc func closeBtnWasPressed() {
        dismissDetailPushRight()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = .white
        setupTableViewAndConstraints()
        self.table.tableFooterView = UIView()
        if UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "iPhone SE" {
            table.isScrollEnabled = true
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
        if UIDevice.current.modelName == "iPhone 6" || UIDevice.current.modelName == "iPhone 7" || UIDevice.current.modelName == "iPhone 8" {
            table.isScrollEnabled = true
            topViewHeaderBg.heightAnchor.constraint(equalToConstant: 85).isActive = true
        }
    }
    
    func setupTableViewAndConstraints() {
        view.addSubview(topViewHeaderBg)
        topViewHeaderBg.addSubview(topViewHeaderTitleLbl)
        topViewHeaderBg.addSubview(topViewHeaderBackBtn)
        view.addSubview(table)
        
        topViewHeaderBg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topViewHeaderBg.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewHeaderBg.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewHeaderBg.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        topViewHeaderTitleLbl.centerXAnchor.constraint(equalTo: topViewHeaderBg.centerXAnchor).isActive = true
        topViewHeaderTitleLbl.bottomAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: -16).isActive = true
        
        topViewHeaderBackBtn.leadingAnchor.constraint(equalTo: topViewHeaderBg.leadingAnchor, constant: 16).isActive = true
        topViewHeaderBackBtn.centerYAnchor.constraint(equalTo: topViewHeaderTitleLbl.centerYAnchor).isActive = true
        topViewHeaderBackBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        topViewHeaderBackBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        setupTableView()
    }
    
    func setupTableView() {
        table.topAnchor.constraint(equalTo: topViewHeaderBg.bottomAnchor, constant: 24).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension LinksVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? LinksCell else { return UITableViewCell() }
        cell.links = linksArray[indexPath.row]
        return cell
    }
    
    func openLink(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        } else {
            showIncompleteURLAlert()
        }
    }
    
    func showIncompleteURLAlert() {
        let alert = UIAlertController(title: "Error", message: "Sorry, we couldn't open that link right now. Please try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           openLink(url: "instagram://user?username=theflexibledietinglifestyle")
        } else if indexPath.row == 1 {
            openLink(url: "https://flexibledietinglifestyle.com/")
        } else if indexPath.row == 2 {
            openLink(url: "itms-apps://itunes.apple.com/us/app/fdl/id1338879783")
        } else if indexPath.row == 3 {
            openLink(url: "http://www.proteincookiebutter.com")
        } else {
            SKStoreReviewController.requestReview()
        }
    }
}
