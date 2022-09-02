//
//  ViewController.swift
//  InstagramClone
//
//  Created by Admin on 10/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Inicializadores das classes
    let homeViewScreen:HomeViewScreen = HomeViewScreen()
    let statusViewController:StatusViewController = StatusViewController()
    let feedViewModel:FeedViewModel = FeedViewModel()

    //Ciclos de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.homeViewScreen.configCollectionViewProtocols(delegate: self, dataSource: self)
        self.homeViewScreen.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.homeViewScreen
    }
}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedViewModel.statusModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatusCollectionViewCell.identifier, for: indexPath) as? StatusCollectionViewCell
        cell?.statusCollectionViewCellScreen.statusImage.image = UIImage(named: self.feedViewModel.statusModel[indexPath.row].image)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.statusViewController.image = self.feedViewModel.getImageStatus(indexPath: indexPath.row)
        self.navigationController?.pushViewController(self.statusViewController, animated: true)
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedViewModel.feedModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell
        cell?.delegate(delegate: self)
        cell?.configViewCell(self.feedViewModel.getIndexPath(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

extension HomeViewController:FeedTableViewCellProtocol {
    func reloadData(_ feedModel: FeedModel) {
        self.feedViewModel.updateLiked(feedModel)
    }
}
