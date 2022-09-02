//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by Admin on 19/08/22.
//

import Foundation
import UIKit

protocol FeedTableViewCellScreenProtocol:AnyObject {
    func likedButton()
}

class FeedTableViewCellScreen:UIView {
    
    private var delegate:FeedTableViewCellScreenProtocol?
    
    public func delegate(delegate:FeedTableViewCellScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var imageLike:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "heart")
        return image
    }()
    
    lazy var imageFeed:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var buttonCoracao:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "gostar"), for: .normal)
        button.addTarget(self, action: #selector(self.likedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonBatePapo:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "comente"), for: .normal)
        return button
    }()
    
    lazy var buttonInstagramDireto:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "instagram-direto"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintImageFeed()
        self.configConstraintImageLike()
        self.configConstraintButtonCoracao()
        self.configConstraintButtonBatePapo()
        self.configConstraintInstagramDireto()
        self.imageLike.isHidden = true
    }
    
    @objc func likedButton(){
        self.delegate?.likedButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(self.imageFeed)
        self.imageFeed.addSubview(self.imageLike)
        self.addSubview(self.buttonCoracao)
        self.addSubview(self.buttonBatePapo)
        self.addSubview(self.buttonInstagramDireto)
        
    }
    
    private func configConstraintImageFeed(){
        NSLayoutConstraint.activate([
            self.imageFeed.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageFeed.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageFeed.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageFeed.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configConstraintImageLike(){
        NSLayoutConstraint.activate([
            self.imageLike.topAnchor.constraint(equalTo: self.imageFeed.topAnchor, constant: 50),
            self.imageLike.leadingAnchor.constraint(equalTo: self.imageFeed.leadingAnchor, constant: 50),
            self.imageLike.trailingAnchor.constraint(equalTo: self.imageFeed.trailingAnchor, constant: -50),
            self.imageLike.bottomAnchor.constraint(equalTo: self.imageFeed.bottomAnchor, constant: -50)
        ])
    }
    
    private func configConstraintButtonCoracao(){
        NSLayoutConstraint.activate([
            self.buttonCoracao.topAnchor.constraint(equalTo: self.imageFeed.bottomAnchor, constant: 10),
            self.buttonCoracao.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.buttonCoracao.widthAnchor.constraint(equalToConstant: 30),
            self.buttonCoracao.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configConstraintButtonBatePapo(){
        NSLayoutConstraint.activate([
            self.buttonBatePapo.topAnchor.constraint(equalTo: self.buttonCoracao.topAnchor),
            self.buttonBatePapo.leadingAnchor.constraint(equalTo: self.buttonCoracao.trailingAnchor, constant: 15),
            self.buttonBatePapo.widthAnchor.constraint(equalToConstant: 25),
            self.buttonBatePapo.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func configConstraintInstagramDireto(){
        NSLayoutConstraint.activate([
            self.buttonInstagramDireto.topAnchor.constraint(equalTo: self.buttonCoracao.topAnchor),
            self.buttonInstagramDireto.leadingAnchor.constraint(equalTo: self.buttonBatePapo.trailingAnchor, constant: 15),
            self.buttonInstagramDireto.widthAnchor.constraint(equalToConstant: 30),
            self.buttonInstagramDireto.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
