//
//  StatusCollectionViewCell.swift
//  InstagramClone
//
//  Created by Admin on 14/08/22.
//

import UIKit

class StatusCollectionViewCell: UICollectionViewCell {
    
    // Inicializadores das classes e variaveis
    static let identifier:String = "StatusCollectionViewCell"
    
    lazy var statusCollectionViewCellScreen:StatusCollectionViewCellScreen = {
        let view = StatusCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Ciclos de vida
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configStatusCollectionViewCellScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcao para adicionar as subviews a view principal
    private func addSubViews(){
        self.addSubview(self.statusCollectionViewCellScreen)
    }
    
    // Funcao para adicionar as constraints das subviews
    private func configStatusCollectionViewCellScreen(){
        NSLayoutConstraint.activate([
            self.statusCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.statusCollectionViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.statusCollectionViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.statusCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
