//
//  MacroResultsVC.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/14/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class MacroResultsVC: UIViewController {
    
    var resultsView = MacroResultsView()
    
    var maintenanceCals: Int?
    var goalCals: Int?
    var protein: Int?
    var carb: Int?
    var fat: Int?
    
    func initData(maintenanceResults: Int, goalResults: Int, proteinResults: Int, carbResults: Int, fatResults: Int) {
        maintenanceCals = maintenanceResults
        goalCals = goalResults
        protein = proteinResults
        carb = carbResults
        fat = fatResults
//        setupResults()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8547463613)
        addViews()
    }

    private let contentView: UIView = {
        let cv = UIView()
        cv.layer.cornerRadius = 15
        cv.backgroundColor = .white
        cv.clipsToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let closeBtn: UIButton = {
        let close = UIButton()
        close.setImage(UIImage(named: "close"), for: .normal)
        close.addTarget(self, action: #selector(closeBtnWasPressed), for: .touchUpInside)
        close.translatesAutoresizingMaskIntoConstraints = false
        return close
    }()
    
    @objc func closeBtnWasPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    private let topViewBG: UIView = {
        let bg = UIView()
        bg.backgroundColor = #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1)
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    private let topViewTitleLbl: UILabel = {
        let title = UILabel()
        title.text = "RESULTS"
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont.mainSemiBoldFont(ofSize: 28)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let disclaimerLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = """
        There are 4 calories for every gram of carbohydrate/ protein and 9 calories for every gram of fat.
        
        These macros are an estimation, please seek a fitness coach or nutritionist help if you're unsure about your results or do not understand what they mean
        """
        lbl.textColor = #colorLiteral(red: 1, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.mainItalicFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func addViews() {
        view.addSubview(contentView)
        view.addSubview(closeBtn)
        contentView.addSubview(topViewBG)
        topViewBG.addSubview(topViewTitleLbl)
        contentView.addSubview(resultsView)
        contentView.addSubview(disclaimerLbl)
        addContentViewConstraints()
    }
    
//    func setupResults() {
//        resultsView.maintenanceResultLbl.text = "\(maintenanceCals ?? 0)"
//        resultsView.goalResultLbl.text = "\(goalCals ?? 0)"
//        resultsView.proteinResultsLbl.text = "\(protein ?? 0)"
//        resultsView.carbsResultsLbl.text = "\(carb ?? 0)"
//        resultsView.fatsResultsLbl.text = "\(fat ?? 0)"
//    }
    
    func addContentViewConstraints() {
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        closeBtn.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -8).isActive = true
        closeBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        topViewBG.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topViewBG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topViewBG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topViewBG.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        topViewTitleLbl.centerXAnchor.constraint(equalTo: topViewBG.centerXAnchor).isActive = true
        topViewTitleLbl.centerYAnchor.constraint(equalTo: topViewBG.centerYAnchor).isActive = true
        
        addContentBodyConstraints()
    }
    
    func addContentBodyConstraints() {
        resultsView.topAnchor.constraint(equalTo: topViewBG.bottomAnchor, constant: 24).isActive = true
        resultsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        resultsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        resultsView.bottomAnchor.constraint(equalTo: disclaimerLbl.topAnchor, constant: -50).isActive = true
        
        addDisclaimerConstraints()
    }
    
    func addDisclaimerConstraints() {
        disclaimerLbl.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 50).isActive = true
        disclaimerLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        disclaimerLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        disclaimerLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
    }

}
