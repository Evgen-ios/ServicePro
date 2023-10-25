//
//  MainViewController.swift
//  ServicePRO
//
//  Created by Evgeniy Goncharov on 24.10.2023.
//

import UIKit
import SnapKit

final class MainViewController: BaseViewController {
    // MARK: - Properties
    var viewModel: MainViewModel!
    
    private lazy var headerView = HeaderView()
    private lazy var mapView = MapView()
    
    // MARK: - Inherited Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        viewModel.input.didLoad.send()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    private func bindViewToViewModel() {}
    
    private func bindViewModelToView() {
        viewModel.output.mapModel.publisher
            .sink(receiveValue: { [weak self] model in
                self?.mapView.configure(model: model)
            })
            .store(in: &bag)
    }
    
    
    private func setupViews() {
        view.backgroundColor = MainTheme.shared.appColors.background
        [headerView, mapView].forEach {
            view.addSubview($0)
        }
        
        layout()
    }
    
    // MARK: - layout
    private func layout() {
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }  
        
        mapView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
}
