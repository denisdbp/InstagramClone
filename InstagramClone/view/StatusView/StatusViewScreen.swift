//
//  StatusViewScreen.swift
//  InstagramClone
//
//  Created by Admin on 28/08/22.
//

import UIKit

class StatusViewScreen: UIView {
    
    // Inicializadores das variaves
    lazy var imageStatus:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    // Ciclos de vida
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.configConstraintImageStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Funcao para adicionar as subviews
    private func addSubViews(){
        self.addSubview(self.imageStatus)
    }
    
    // Funcao para configurar as constraints das subviews
    private func configConstraintImageStatus(){
        NSLayoutConstraint.activate([
            self.imageStatus.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageStatus.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
