//
//  HeaderView.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import Combine

final class HeaderView: LoadableView {
    
    // MARK: - Private Lazy Properties
    private lazy var avatarImage = UIImageView().apply {
        $0.image = UIImage(named: "avatar") ?? UIImage()
    }
    
    private lazy var logoImage = UIImageView().apply {
        $0.image = UIImage(named: "AppIcon") ?? UIImage()
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }
    
    private lazy var notificationImage = UIImageView().apply {
        $0.image = UIImage(named: "AppIcon") ?? UIImage()
    }
    
    private lazy var logoLable = UILabel().apply {
        $0.text = "СЕРВИСПРО"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        $0.sizeToFit()
    }
    
    private lazy var bellImage = UIImageView().apply {
        $0.image = UIImage(named: "bell") ?? UIImage()
    }
    
    
    // MARK: - Inherited Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func setup() {
        setupViews()
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(user: UserModel) {
        avatarImage.image = user.avatar
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        [logoImage, logoLable, avatarImage, bellImage].forEach {
            addSubview($0)
        }
    }
    
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
        
        logoLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(logoImage.snp.right).offset(8)
        }
        
        avatarImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
            $0.height.equalTo(35)
            $0.width.equalTo(35)
        }
        
        bellImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(avatarImage.snp.left).offset(-16)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
    }
}
