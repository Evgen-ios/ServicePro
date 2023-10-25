//
//  MachineryCardCell.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import SnapKit

final class MachineryCardCell: LoadableCollectionViewCell {
    
    // MARK: - Properties
    private lazy var progressView = UIProgressView().apply {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFill
        $0.alpha = 0.5
    }
    
    private lazy var titleLable = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        $0.textColor = .white
        $0.sizeToFit()
    }
    
    private lazy var iconImage = UIImageView().apply {
        $0.image = UIImage(named: "car") ?? UIImage()
        $0.clipsToBounds = true
    }
    
    private lazy var timeLable = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var nameLable = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var vendorLable = UILabel().apply {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .white
    }
    
    // MARK: - Inherited Methods
    override func setup() {
        super.setup()
        setupViews()
    }
    
    // MARK: Configure
    func configure(_ model: MachineryCardModel) {
        
        progressView.progress = 20.0 / 30.0;
        titleLable.text = "\(model.id)"
        iconImage.image = model.logo
        timeLable.text = model.time
        nameLable.text = model.name
        vendorLable.text = model.vendor
    }
    
    //MARK: Setup views
    private func setupViews() {
        layer.cornerRadius = 12
        layer.backgroundColor = MainTheme.shared.appColors.machineryCell.cgColor
        clipsToBounds = true
        
        [progressView, titleLable, iconImage, timeLable, nameLable, vendorLable].forEach {
            addSubview($0)
        }
        
        layout()
    }
    
    //MARK: Layout
    private func layout() {
        progressView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalToSuperview().offset(8)
            $0.right.equalToSuperview().inset(8)
            $0.height.equalTo(3)
        }
        
        titleLable.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(4)
            $0.left.equalToSuperview().inset(8)
        }
        
        iconImage.snp.makeConstraints {
            $0.centerY.equalTo(titleLable)
            $0.left.equalTo(titleLable.snp.right).offset(4)
            $0.size.equalTo(24)
        }
        
        timeLable.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(4)
            $0.left.equalToSuperview().inset(8)
        }
        
        nameLable.snp.makeConstraints {
            $0.top.equalTo(timeLable.snp.bottom).offset(4)
            $0.left.equalToSuperview().inset(8)
        }
        
        vendorLable.snp.makeConstraints {
            $0.top.equalTo(nameLable.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(8)
        }
        
    }
}

