//
//  RegisterViewController.swift
//  InstagramClone
//
//  Created by Admin on 26/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // Inicializadores das classes
    private let feedViewModel:FeedViewModel = FeedViewModel()
    private let alertView:AlertView = AlertView()
    private let registerViewScreen:RegisterViewScreen = RegisterViewScreen()
    
    // Ciclos de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerViewScreen.delegate(delegate: self)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.registerViewScreen
    }
}

extension RegisterViewController:RegisterViewScreenProtocol {
    
    func registerUser(email: String, password: String) {
        self.feedViewModel.createUser(email: email, password: password) { (result, error) in
            if result != nil {
                self.alertView.alertLogin(title: "Parabens", message: "Conta criada com sucesso !!!", controller: self) { UIAlertAction in
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
                }
            }else {
                self.alertView.alertLogin(title: "Ops...", message: "Tivemos um problema para criar sua conta, verifique seu email e se sua senha tem no minimo 6 digitos", controller: self, handler: nil)
            }
        }
    }
    
    func returnLogin() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
