//
//  CurrencyPickerTableViewCell.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 30/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class CurrencyPickerTableViewCell: UITableViewCell {
    
    static let id = "CurrencyPickerTableViewCellIdentifier"
    
    // MARK: - Dependencies
    
    private var currency: Currency! {
        didSet {
            setupUI()
        }
    }
    
    // MARK: - Public properties
    
    var shouldBeGrayedOut: Bool = false {
        didSet {
            whiteOverlayView.isHidden = !shouldBeGrayedOut
        }
    }
    
    // MARK: - Private properties
    
    lazy private var flagLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 40)
        return lbl
    }()
    
    lazy private var acronymLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    lazy private var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    lazy private var whiteOverlayView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.alpha = 0.8
        return v
    }()
    
    // MARK: - Public methods
    
    func configure(with currency: Currency) {
        self.currency = currency
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        [flagLabel, acronymLabel, nameLabel, whiteOverlayView].forEach { addSubview($0) }
        whiteOverlayView.isHidden = !shouldBeGrayedOut
        flagLabel.text = currency.flag
        acronymLabel.text = currency.acronym
        nameLabel.text = currency.name
        setupConstraints()
    }
    
    private func setupConstraints() {
        flagLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        acronymLabel.anchor(top: topAnchor, left: flagLabel.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        nameLabel.anchor(top: topAnchor, left: acronymLabel.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        whiteOverlayView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
