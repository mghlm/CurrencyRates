//
//  CurrencyPairTableViewCell.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 30/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class CurrencyPairTableViewCell: UITableViewCell {
    
    static let id = "CurrencyPairTableViewCellIdentifier"
    
    // MARK: - Dependencies
    
    private var currencyPair: CurrencyPair! {
        didSet {
            setupUI()
        }
    }
    
    // MARK: - Private properties
    
    lazy private var mainCurrencyAcronymLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 30)
        return lbl
    }()
    
    lazy private var mainCurrencyNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    lazy private var rateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 30)
        return lbl
    }()
    
    lazy private var secondaryCurrencyNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    // MARK: - Public methods
    
    func configure(with currencyPair: CurrencyPair) {
        self.currencyPair = currencyPair
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        [mainCurrencyAcronymLabel, mainCurrencyNameLabel, rateLabel, secondaryCurrencyNameLabel].forEach { addSubview($0) }
        mainCurrencyAcronymLabel.text = "1 \(currencyPair.mainCurrency.acronym)"
        mainCurrencyNameLabel.text = currencyPair.mainCurrency.name
        rateLabel.text = String(currencyPair.rate ?? 0)
        secondaryCurrencyNameLabel.text = "\(currencyPair.secondaryCurrency.name) - \(currencyPair.secondaryCurrency.acronym)"
        setupConstraints()
    }
    
    private func setupConstraints() {
        mainCurrencyAcronymLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        mainCurrencyNameLabel.anchor(top: mainCurrencyAcronymLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        rateLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        secondaryCurrencyNameLabel.anchor(top: rateLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 16, width: 0, height: 0)
    }
}

