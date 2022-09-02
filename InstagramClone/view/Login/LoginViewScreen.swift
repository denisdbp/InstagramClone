//
//  LoginViewScreen.swift
//  InstagramClone
//
//  Created by Admin on 22/08/22.
//

import UIKit

protocol LoginViewScreenProtocol:AnyObject {
    func accessLogin(email:String, password:String)
    func registerLogin()
}

class LoginViewScreen: UIView {
    
    private var delegate:LoginViewScreenProtocol?
    
    public func delegate(delegate:LoginViewScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "instagramlogin")
        return image
    }()
    
    lazy var emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 26.0/255, green: 26.0/255, blue: 26.0/255, alpha: 1)
        textField.placeholder = "Email"
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.font = UIFont(name: "Arial", size: 15)
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 26.0/255, green: 26.0/255, blue: 26.0/255, alpha: 1)
        textField.placeholder = "Senha"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Arial", size: 15)
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var rememberPasswordButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .none
        return button
    }()
    
    lazy var accessButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.accessLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var orLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ou"
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var imageFacebook:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "facebook")
        return image
    }()
    
    lazy var loginFacebookButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login com facebook", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    lazy var createUserLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nao tem conta?"
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .white
        return label
    }()
    
    lazy var createUserButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(self.registerLogin), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubViews()
        self.configConstraintImage()
        self.configConstraintEmailTextField()
        self.configConstraintSenhaTextField()
        self.configConstraintRememberPasswordButton()
        self.configConstraintAccessButton()
        self.configConstraintOrLabel()
        self.configConstraintImageFacebook()
        self.configConstraintLoginFacebookButton()
        self.configConstraintCreateUserLabel()
        self.configConstraintCreateUserButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(self.image)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.rememberPasswordButton)
        self.addSubview(self.accessButton)
        self.addSubview(self.orLabel)
        self.addSubview(self.imageFacebook)
        self.addSubview(self.loginFacebookButton)
        self.addSubview(self.createUserLabel)
        self.addSubview(self.createUserButton)
    }
    
    @objc func accessLogin(){
        self.delegate?.accessLogin(email: self.emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc func registerLogin(){
        self.delegate?.registerLogin()
    }
    
    private func configConstraintImage(){
        NSLayoutConstraint.activate([
            self.image.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.image.widthAnchor.constraint(equalToConstant: 200),
            self.image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configConstraintEmailTextField(){
        NSLayoutConstraint.activate([
            self.emailTextField.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configConstraintSenhaTextField(){
        NSLayoutConstraint.activate([
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configConstraintRememberPasswordButton(){
        NSLayoutConstraint.activate([
            self.rememberPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.rememberPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.rememberPasswordButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configConstraintAccessButton(){
        NSLayoutConstraint.activate([
            self.accessButton.topAnchor.constraint(equalTo: self.rememberPasswordButton.bottomAnchor, constant: 30),
            self.accessButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.accessButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.accessButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configConstraintOrLabel(){
        NSLayoutConstraint.activate([
            self.orLabel.topAnchor.constraint(equalTo: self.accessButton.bottomAnchor, constant: 50),
            self.orLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configConstraintImageFacebook(){
        NSLayoutConstraint.activate([
            self.imageFacebook.topAnchor.constraint(equalTo: self.orLabel.bottomAnchor, constant: 45),
            self.imageFacebook.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -75),
            self.imageFacebook.widthAnchor.constraint(equalToConstant: 20),
            self.imageFacebook.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configConstraintLoginFacebookButton(){
        NSLayoutConstraint.activate([
            self.loginFacebookButton.topAnchor.constraint(equalTo: self.orLabel.bottomAnchor, constant: 50),
            self.loginFacebookButton.leadingAnchor.constraint(equalTo: self.imageFacebook.trailingAnchor, constant: 10),
            self.loginFacebookButton.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func configConstraintCreateUserLabel(){
        NSLayoutConstraint.activate([
            self.createUserLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            self.createUserLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50)
        ])
    }
    
    private func configConstraintCreateUserButton(){
        NSLayoutConstraint.activate([
            self.createUserButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.createUserButton.leadingAnchor.constraint(equalTo: self.createUserLabel.trailingAnchor, constant: 5),
            self.createUserButton.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
