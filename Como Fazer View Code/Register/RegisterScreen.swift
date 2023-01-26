//
//  RegisterScreen.swift
//  Como Fazer View Code
//
//  Created by Celio Ferreira on 25/01/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionRegisterButton()
    func actionBackButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registro"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.autocorrectionType = .no
        name.backgroundColor = .white
        name.borderStyle = .roundedRect
        name.keyboardType = .default
        name.placeholder = "Digite seu nome"
        name.textColor = . black
        
        return name
    }()
    
    lazy var enderecoTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite seu Endereco"
        tf.textColor = . black
        
        return tf
    }()
    
    lazy var telefoneTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite seu Telefone"
        tf.textColor = . black
        
        return tf
    }()
    
    lazy var aniversarioTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite seu aniversario"
        tf.textColor = . black
        
        return tf
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false//se não desativar não pega nossas constraints setadas
        button.setTitle("Registrar", for: .normal)//Escrita do botão
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)//Fonte do botão
        button.setTitleColor(.white, for: .normal)//Cor da escrita do botão
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)//Função de click do botão, pega uma ação do botão
        //Como esse botão não tera fundo, não coloca o backgroundcolor dele
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        button.isEnabled = false
        
        return button
    }()
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
        
        print("Botao clicado register Screen")
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    @objc private func tappedBackButton(){
        
        self.delegate?.actionBackButton()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackGroud()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(self.backButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.enderecoTextField)
        self.addSubview(self.telefoneTextField)
        self.addSubview(self.aniversarioTextField)
        self.addSubview(self.registerButton)
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.nameTextField.delegate = delegate
        self.enderecoTextField.delegate = delegate
        self.telefoneTextField.delegate = delegate
        self.aniversarioTextField.delegate = delegate
    }
    

    
    private func configBackGroud(){
        self.backgroundColor = .white
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.backButton.topAnchor.constraint(equalTo: self.titleLabel.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            self.nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.enderecoTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            self.enderecoTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            self.enderecoTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            self.enderecoTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            self.telefoneTextField.topAnchor.constraint(equalTo: enderecoTextField.bottomAnchor, constant: 10),
            self.telefoneTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            self.telefoneTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            self.telefoneTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            self.aniversarioTextField.topAnchor.constraint(equalTo: telefoneTextField.bottomAnchor, constant: 10),
            self.aniversarioTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            self.aniversarioTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            self.aniversarioTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: aniversarioTextField.bottomAnchor, constant: 10),
            self.registerButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
        ])
    }
    

}
