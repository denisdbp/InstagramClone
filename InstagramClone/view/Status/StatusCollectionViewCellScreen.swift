//
//  StatusCollectionViewScreen.swift
//  InstagramClone
//
//  Created by Admin on 14/08/22.
//

import UIKit

class StatusCollectionViewCellScreen: UIView {
    
    lazy var statusImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintStatusImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(self.statusImage)
    }
    
    private func configConstraintStatusImage(){
        NSLayoutConstraint.activate([
            self.statusImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.statusImage.widthAnchor.constraint(equalToConstant: 80),
            self.statusImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
