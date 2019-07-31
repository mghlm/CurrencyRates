//
//  AddCurrencyPairView.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 30/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class AddCurrencyPairView: UIView {
    
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
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    lazy private var secondAddCurrencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose a currency pair to compare their live rates"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    lazy private var addCurrencyStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [addIcon, mainAddCurrencyLabel, secondAddCurrencyLabel])
        sv.spacing = 12
        sv.axis = .vertical
        
        return sv
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
        addSubview(addCurrencyStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        addCurrencyStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addIcon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        addIcon.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
