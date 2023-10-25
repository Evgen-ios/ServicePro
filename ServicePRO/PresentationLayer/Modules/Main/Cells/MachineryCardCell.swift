//
//  MachineryCardCell.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import Combine

final class MachineryCardCell: LoadableCollectionViewCell {
    
    // MARK: - Properties
    private var bag = CancelBag()
    
    private lazy var logoImageView = UIImageView().apply {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var headerLabel = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var descriptionLabel = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    // MARK: - Life cycle
    override func setup() {
        super.setup()
        bind()
        setupViews()
        layout()
    }
    
    // MARK: Configure
    func configure(_ model: MachineryCardModel) {

    }
    
    func bind() {}
    
    //MARK: Setup views
    private func setupViews() {
        layer.cornerRadius = 16
        clipsToBounds = true
        
        [headerLabel,
         descriptionLabel,
         logoImageView]
            .forEach {
                addSubview($0)
            }
    }
    
    //MARK: Layout
    private func layout() {
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.right.equalToSuperview().offset(16)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(30)
            $0.size.equalTo(80)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalTo(logoImageView.snp_leftMargin).offset(16)
            $0.bottom.equalToSuperview().offset(16).priority(.low)
        }
    }
}

