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
    var mapModel: MapModel?
    var items: [MachineryCardModel] = []
    var images: [UIImage] = []
    
    private lazy var headerView = HeaderView()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout() )
            .apply {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.backgroundColor = .none
                $0.dataSource = self
                $0.isScrollEnabled = true
                $0.clipsToBounds = true
                $0.register(of: MapViewCell.self)
                $0.register(of: MachineryCardCell.self)
                $0.register(of: ImageCell.self)
            }
        
        return view
    }()
    
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
                self?.mapModel = model
                self?.collectionView.reloadSections(IndexSet(integer: 0))
            })
            .store(in: &bag)
        
        viewModel.output.$items
            .sink(receiveValue: { [weak self] items in
                self?.items = items
                self?.collectionView.reloadSections(IndexSet(integer: 1))
            })
            .store(in: &bag)
        
        viewModel.output.$images
            .sink(receiveValue: { [weak self] images in
                self?.images = images
                self?.collectionView.reloadSections(IndexSet(integer: 2))
            })
            .store(in: &bag)
    }
    
    
    private func setupViews() {
        view.backgroundColor = MainTheme.shared.appColors.background
        [headerView, collectionView].forEach {
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Extension
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return items.count
        case 2:
            return images.count
        default:
            return 1
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapViewCell.className(),for: indexPath) as? MapViewCell else { return UICollectionViewCell() }
            cell.configure(mapModel)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MachineryCardCell.className(),for: indexPath) as? MachineryCardCell else { return UICollectionViewCell() }
            cell.configure(items[indexPath.row])
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.className(),for: indexPath) as? ImageCell else { return UICollectionViewCell() }
            cell.configure(images[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - layout for Sections
extension MainViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self.createFistSection()
            case 1:
                return self.createSecondSection()
            default:
                return self.createThirdSection()
            }
        }
    }
    
    private func createFistSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(460)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(460)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group).apply {
            $0.orthogonalScrollingBehavior = .groupPagingCentered
            $0.contentInsetsReference = .automatic
        }
        
        return section
    }
    
    private func createSecondSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(160), heightDimension: .absolute(130)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group).apply {
            $0.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            $0.orthogonalScrollingBehavior = .groupPaging
            $0.interGroupSpacing = 8
            $0.contentInsets = .init(top: .zero, leading: 8, bottom: .zero, trailing: 8)
        }
        return section
    }
    
    private func createThirdSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(200), heightDimension: .absolute(130)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group).apply {
            $0.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            $0.orthogonalScrollingBehavior = .continuous
            $0.interGroupSpacing = 8
            $0.contentInsets = .init(top: .zero, leading: 8, bottom: 20, trailing: 8)
        }
        return section
    }
    
    // Create header for section
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(16)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

