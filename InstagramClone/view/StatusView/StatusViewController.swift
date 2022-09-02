//
//  StatusViewController.swift
//  InstagramClone
//
//  Created by Admin on 28/08/22.
//

import UIKit

class StatusViewController: UIViewController {
    
    // Inicializadores das classes e variaveis
    let statusViewScreen:StatusViewScreen = StatusViewScreen()
    var timer:Timer?
    var image:String = ""
    
    // Ciclos de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.dismissView), userInfo: nil, repeats: false)
        self.statusViewScreen.imageStatus.image = UIImage(named: self.image)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.statusViewScreen
    }
    
    @objc func dismissView(){
        self.navigationController?.popViewController(animated: true)
    }
}
