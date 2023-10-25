//
//  ImageCell.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 25.10.2023.
//

import UIKit
import SnapKit

final class ImageCell: LoadableCollectionViewCell {
    
    // MARK: - Properties
    private lazy var imageView = UIImageView().apply {
        $0.sizeToFit()
    }
    
    // MARK: - Inherited Methods
    override func setup() {
        super.setup()
        setupViews()
    }
    
    // MARK: Configure
    func configure(_ image: UIImage) {
        imageView.image = image
        layout()
    }
    
    //MARK: Setup views
    private func setupViews() {
        layer.cornerRadius = 15
        layer.backgroundColor = MainTheme.shared.appColors.machineryCell.cgColor
        clipsToBounds = true
        addSubview(imageView)
    }
    
    //MARK: Layout
    private func layout() {
        imageView.snp.remakeConstraints {
            $0.size.equalToSuperview()
        }
    }
}

