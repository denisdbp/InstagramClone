//
//  HomeViewScreen.swift
//  InstagramClone
//
//  Created by Admin on 10/08/22.
//

import UIKit

class HomeViewScreen: UIView {
    
    lazy var headerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var optionsView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var imageLogo:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "instagramlogo")
        return image
    }()
    
    lazy var buttonCoracao:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "coracao"), for: .normal)
        return button
    }()
    
    lazy var buttonProcurar:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "procurar"), for: .normal)
        return button
    }()
    
    lazy var buttonSeta:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "instagram-direto"), for: .normal)
        return button
    }()
    
    lazy var statusCollectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(StatusCollectionViewCell.self, forCellWithReuseIdentifier: StatusCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var feedTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubViews()
        self.configConstraintHeaderView()
        self.configConstraintOptionsView()
        self.configConstraintImageLogo()
        self.configConstraintButtonCoracao()
        self.configConstraintButtonProcurar()
        self.configConstraintButtonSeta()
        self.configConstraintStatusCollectionView()
        self.configConstraintFeedTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCollectionViewProtocols(delegate:UICollectionViewDelegate, dataSource:UICollectionViewDataSource){
        self.statusCollectionView.delegate = delegate
        self.statusCollectionView.dataSource = dataSource
    }
    
    public func configTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.feedTableView.delegate = delegate
        self.feedTableView.dataSource = dataSource
    }
    
    private func addSubViews(){
        self.addSubview(self.headerView)
        self.headerView.addSubview(self.optionsView)
        self.headerView.addSubview(self.imageLogo)
        self.optionsView.addSubview(self.buttonCoracao)
        self.optionsView.addSubview(self.buttonProcurar)
        self.optionsView.addSubview(self.buttonSeta)
        self.addSubview(self.statusCollectionView)
        self.addSubview(self.feedTableView)
    }
    
    private func configConstraintHeaderView(){
        NSLayoutConstraint.activate([
        self.headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
        self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.headerView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configConstraintOptionsView(){
        NSLayoutConstraint.activate([
        self.optionsView.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor),
        self.optionsView.leadingAnchor.constraint(equalTo: self.imageLogo.trailingAnchor),
        self.optionsView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor)
        ])
    }
    
    private func configConstraintButtonCoracao(){
        NSLayoutConstraint.activate([
        self.buttonCoracao.centerYAnchor.constraint(equalTo: self.optionsView.centerYAnchor),
        self.buttonCoracao.trailingAnchor.constraint(equalTo: self.buttonProcurar.leadingAnchor, constant: -15),
        self.buttonCoracao.widthAnchor.constraint(equalToConstant: 30),
        self.buttonCoracao.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configConstraintButtonProcurar(){
        NSLayoutConstraint.activate([
        self.buttonProcurar.centerYAnchor.constraint(equalTo: self.optionsView.centerYAnchor),
        self.buttonProcurar.trailingAnchor.constraint(equalTo: self.buttonSeta.leadingAnchor, constant: -15),
        self.buttonProcurar.widthAnchor.constraint(equalToConstant: 30),
        self.buttonProcurar.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configConstraintButtonSeta(){
        NSLayoutConstraint.activate([
        self.buttonSeta.centerYAnchor.constraint(equalTo: self.optionsView.centerYAnchor),
        self.buttonSeta.trailingAnchor.constraint(equalTo: self.optionsView.trailingAnchor, constant: -10),
        self.buttonSeta.widthAnchor.constraint(equalToConstant: 30),
        self.buttonSeta.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configConstraintImageLogo(){
        NSLayoutConstraint.activate([
            self.imageLogo.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor),
            self.imageLogo.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 5),
            self.imageLogo.widthAnchor.constraint(equalToConstant: 200),
            self.imageLogo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configConstraintStatusCollectionView(){
        NSLayoutConstraint.activate([
            self.statusCollectionView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.statusCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.statusCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.statusCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configConstraintFeedTableView(){
        NSLayoutConstraint.activate([
            self.feedTableView.topAnchor.constraint(equalTo: self.statusCollectionView.bottomAnchor, constant: 10),
            self.feedTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.feedTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.feedTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
