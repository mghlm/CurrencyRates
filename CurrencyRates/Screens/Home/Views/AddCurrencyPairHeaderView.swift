//
//  AddCurrencyPairHeaderView.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 30/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class AddCurrencyPairHeaderView: UIView {
    
    // MARK: - Private properties
    
    lazy private var addIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Plus")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy private var mainAddCurrencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add currency pair"
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red:0.26, green:0.53, blue:0.96, alpha:1.0)
        lbl.font = UIFont.systemFont(ofSize: 20)
        return lbl
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        
        [addIcon, mainAddCurrencyLabel].forEach { addSubview($0) }
        setupConstraints()
    }
    
    private func setupConstraints() {
        addIcon.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 24, paddingLeft: 16, paddingBottom: 24, paddingRight: 0, width: 0, height: 0)
        mainAddCurrencyLabel.anchor(top: topAnchor, left: addIcon.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}

