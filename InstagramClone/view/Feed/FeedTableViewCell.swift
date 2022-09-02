//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by Admin on 19/08/22.
//

import UIKit

protocol FeedTableViewCellProtocol {
    func reloadData(_ feedModel:FeedModel)
}

class FeedTableViewCell: UITableViewCell {
    
    private var delegate:FeedTableViewCellProtocol?
    
    public func delegate(delegate:FeedTableViewCellProtocol) {
        self.delegate = delegate
    }
    
    // Inicializadores das classes e variaveis
    static let identifier:String = "FeedTableViewCell"
    private var feedTableViewCellViewModel:FeedTableViewCellViewModel?
    private var timer:Timer?

    lazy var feedTableViewCellScreen:FeedTableViewCellScreen = {
        let view = FeedTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Ciclos de vida
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews()
        self.configConstraintFeedTableViewCellScreen()
        self.selectionStyle = .none
        self.feedTableViewCellScreen.delegate(delegate: self)
        self.addTappedLiked()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func imageLiked(){
        self.feedTableViewCellScreen.imageLike.isHidden = true
    }
    
    // Funcao para adicionar um Tap para quando der 2 cliques na imagem do Feed o mesmo dar o Like ou Deslike
    private func addTappedLiked(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedLiked))
        tap.numberOfTapsRequired = 2
        self.feedTableViewCellScreen.imageFeed.addGestureRecognizer(tap)
        self.feedTableViewCellScreen.imageFeed.isUserInteractionEnabled = true
    }
    
    @objc func tappedLiked(){
        self.likedFeed()
    }
    
    // Funcao que verificar se o Like esta false e da um True e faz a troca da imagem do Button para o coracao preenchido
    private func likedFeed(){
        guard let feedTableViewCellViewModel = self.feedTableViewCellViewModel else {return}
        if feedTableViewCellViewModel.getLiked == false {
            self.feedTableViewCellViewModel?.updateLiked(liked: true)
            self.feedTableViewCellScreen.imageLike.isHidden = false
            self.timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.imageLiked), userInfo: nil, repeats: false)
            self.feedTableViewCellScreen.buttonCoracao.setImage(UIImage(named: "heart"), for: .normal)
        }else {
            self.feedTableViewCellViewModel?.updateLiked(liked: false)
            self.feedTableViewCellScreen.buttonCoracao.setImage(UIImage(named: "gostar"), for: .normal)
            self.feedTableViewCellScreen.imageLike.isHidden = true
        }
        self.delegate?.reloadData(feedTableViewCellViewModel.getFeedModel)
    }
    
    // Funcao para adicionar as subviews a view principal
    private func addSubViews(){
        self.contentView.addSubview(self.feedTableViewCellScreen)
    }
    
    // Funcao para adicionar as constraints das subviews
    private func configConstraintFeedTableViewCellScreen(){
        NSLayoutConstraint.activate([
            self.feedTableViewCellScreen.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.feedTableViewCellScreen.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.feedTableViewCellScreen.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.feedTableViewCellScreen.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    // Funcao que configura as celulas da TableView
    public func configViewCell(_ feedModel:FeedModel){
        self.feedTableViewCellViewModel = FeedTableViewCellViewModel(feedModel: feedModel)
        self.feedTableViewCellScreen.imageFeed.image = UIImage(named: self.feedTableViewCellViewModel?.getImage ?? "")
        if self.feedTableViewCellViewModel?.getLiked == true {
            self.feedTableViewCellScreen.buttonCoracao.setImage(UIImage(named: "heart"), for: .normal)
        }else {
            self.feedTableViewCellScreen.buttonCoracao.setImage(UIImage(named: "gostar"), for: .normal)
        }
    }
}

extension FeedTableViewCell:FeedTableViewCellScreenProtocol {
    func likedButton() {
        self.likedFeed()
    }
}
