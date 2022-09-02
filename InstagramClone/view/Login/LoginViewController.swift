//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Admin on 22/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Inicializadores das classes
    private let feedViewModel:FeedViewModel = FeedViewModel()
    private let alertView:AlertView = AlertView()
    private let loginViewScreen:LoginViewScreen = LoginViewScreen()

    // Ciclos de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewScreen.delegate(delegate: self)
        self.hideKeyboard()
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.loginViewScreen
    }
    
    // Funcao para adicionar um Gesture para quando apertar em algum lugar na View principal o teclado e fechado
    private func hideKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension LoginViewController:LoginViewScreenProtocol {
    
    func accessLogin(email: String, password: String) {
        self.feedViewModel.loginUser(email: email, password: password) { (result, error) in
            if result != nil {
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
            }else {
                self.alertView.alertLogin(title: "Ops...", message: "Email e/ou senha incorretos", controller: self, handler: nil)
            }
        }
    }
    
    func registerLogin() {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
