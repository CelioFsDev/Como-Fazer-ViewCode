//
//  LoginScreen.swift
//  Como Fazer View Code
//
//  Created by Celio Ferreira on 23/01/23.
//

import UIKit

//MARK: Trabalhar com os protocolos para Que possa pegar a viewcontroller e fezer ela ser a assinante depois cria o delegate para Que ele consiga acessar o protocolo
protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
    func tappedRecuparSenhaButton()
}

//MARK: CLASSE PRINCIPAL DA VIEW
class LoginScreen: UIView {
    //MARK: DELEGATE CRIADO
    weak var delegate: LoginScreenProtocol?
    
    //MARK: FUNCAO PAR CONFIGURAR O DELEGATE DE ACAO DE BOTOES
    public func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    //MARK: CRIACAO DE UMA LABEL
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "CHEINA" //MARK: TEXT DA LABEL
        label.textColor = .white //MARK: COR DA ESCRITA DA LABEL
        label.font = UIFont.boldSystemFont(ofSize: 40) //MARK: TAMANHO DA FONTE DA LABEL
        label.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITAR MEXER NAS CONSTRAINTS
        
        return label
    }()
    
    lazy var loginTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Login" //MARK: TEXT DA LABEL
        label.textColor = .white //MARK: COR DA ESCRITA DA LABEL
        label.font = UIFont.boldSystemFont(ofSize: 20) //MARK: TAMANHO DA FONTE DA LABEL
        label.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITAR MEXER NAS CONSTRAINTS
        
        return label
    }()
    //MARK: CRIACAO DE UM TEXTFIELD
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITAR MEXER NAS CONSTRAINTS
        textField.font = UIFont.systemFont(ofSize: 20)//MARK: FONTE DA TEXTFIELD
        textField.placeholder = "Digite seu email" //MARK: TEXTO DENTRO DA TEXTFIELD
        textField.backgroundColor = .white.withAlphaComponent(1) //MARK: COR DE FUNDO DA TEXTFIELD
        textField.borderStyle = .roundedRect //MARK: ALTERA AS BORDAS MAIS ARREDONDADAS
        textField.keyboardType = .emailAddress //MARK: TIPO DE TECLADO
        textField.autocorrectionType = .no //MARK: AUTO CORRETOR DE PALAVRAS
        textField.textColor  = .black //MARK: COR DA LETRA DIGITADA
        
        return textField
    }()
    //MARK: CRIACAO DE TEXTFIELD
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITAR MEXER NAS CONSTRAINTS
        textField.font = UIFont.systemFont(ofSize: 20) //MARK: FONTE DA TEXTFIELD
        textField.placeholder = "Digite sua senha" //MARK: TEXTO DENTRO DA TEXTFIELD
        textField.backgroundColor = .white.withAlphaComponent(1) //MARK: COR DE FUNDO DA TEXTFIELD
        textField.borderStyle = .roundedRect //MARK: ALTERA AS BORDAS MAIS ARREDONDADAS
        textField.keyboardType = .emailAddress //MARK: TIPO DE TECLADO
        textField.autocorrectionType = .no //MARK: AUTO CORRETOR DE PALAVRAS
        textField.isSecureTextEntry = true //MARK: OCULTAR TEXTO DIGITADO
        textField.textColor = .darkGray //MARK: COR DA BOLINHAS DO TEXTO OCULTO
        
        return textField
    }()
    //MARK: CRIACAO DE BOTAO
    lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false//MARK: HABILITAR MEXER NAS CONSTRAINTS
        button.setTitle("Logar", for: .normal) //MARK: ESCRITA DO BOTAO
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17) //MARK: FONTE DA ESCRITA DO BOTAO
        button.setTitleColor(.darkGray, for: .normal) //MARK: COR DA ESCRITA DO BOTAO
        button.clipsToBounds = true //MARK: BOTAO AREDONDADO
        button.layer.cornerRadius = 7 //MARK: QUANTIDADE EM VALOR PARA ARREDONDAR O BOTAO
        button.backgroundColor = .darkGray.withAlphaComponent(0.5) //MARK: COR DE FUNDO DO BOTAO
        button.isEnabled = true //MARK: BOTAO ATIVADO OU DESATIVADO
        button.addTarget(self, action: #selector (tappedLoginButton), for: .touchUpInside) //MARK: TARGET DO BOTAO, FUNCAO OU ACAO DO BOTAO
        
        return button
    }()
    //MARK: PARA CRIAR A ACAO DO BOTAO
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("Botao funcionando")
        delegate?.tappedLoginButton()
    }
    //MARK: CRIANDO O BOTAO
    lazy var buttonRegister: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITA MEXER NAS CONSTRAINTS
        button.setTitle("Registrar", for: .normal) //MARK: TEXTO DO BOTAO
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17) //MARK: FONTE DO BOTAO
        button.setTitleColor(.white, for: .normal) //MARK: COR DO TEXTO DO BOTAO
        button.clipsToBounds = true //MARK: ARREDONDAR BOTAO
        button.layer.cornerRadius = 7 //MARK: QUANTIDADE EM VALOR PARA ARREDONDAR O BOTAO
        button.backgroundColor = .darkGray.withAlphaComponent(1) //MARK: COR DE FUNDO DO BOTAO
        button.isEnabled = true //MARK: SE O BOTAO ESTA ATIVADO OU DESATIVADO
        button.addTarget(self, action:#selector(self.tappedRegisterButton) , for: .touchUpInside)//MARK: TARGET DO BOTAO, FUNCAO OU ACAO DO BOTAO
        
        return button
    }()
    //MARK: ACAO DO BOTAO
    @objc func tappedRegisterButton(_ sender: UIButton) {
        print("Botao funcionando")
        delegate?.tappedRegisterButton()
    }
    //MARK: CRIANDO O BOTAO
    lazy var recuperarSenhaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false //MARK: HABILITA MEXER NAS CONSTRAINTS DO BOTAO
        button.setTitle("Esqueceu a senha?", for: .normal) //MARK: ESCRITA DO BOTAO
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16) //MARK: FONTE DA ESCRITA DO BOTAO
        button.setTitleColor(.white, for: .normal) //MARK: COR DO TEXTO DO BOTAO
        button.backgroundColor = .blue //MARK: COR DE FUNDO DO BOTAO
        button.isEnabled = true //MARK: BOTAO ATIVADO OU DESATIVADO
        button.addTarget(self, action: #selector(tappedRecuparSenhaButton), for: .touchUpInside) //MARK: TARGET DO BOTAO, ACAO OU FUNCAO DO BOTAO
        
        return button
    }()
    //MARK: ACAO DO BOTAO
    @objc func tappedRecuparSenhaButton(_ sender: UIButton) {
        print("Botao funcionando")
        delegate?.tappedRecuparSenhaButton()
    }
    //MARK: FUNCAO QUE ADICONA OS ITENS CRIADOS ANTERIORMENTE
    func addElements(){
        
        self.addSubview(loginLabel)//MARK: CRIA UMA LABEL
        self.addSubview(loginTextLabel) //MARK: CRIA UMA LABEL
        self.addSubview(emailTextField) //MARK: CRIA UM TEXTFIELD
        self.addSubview(passwordTextField) //MARK: CRIA UM TEXTFIELD
        self.addSubview(buttonLogin) //MARK: CRIA UM BOTAO
        self.addSubview(buttonRegister) //MARK: CRIA UM BOTAO
        self.addSubview(recuperarSenhaButton) //MARK: CRIA UM BOTAO SEM FUNDO
    }
    //MARK: FUNCAO CRIADA PARA OS TEXTFIELDS. UTILIZAR O DELEGATE DOS TEXTFIELD PARA CONSEGUIR APERTAR OS BOTOES E COMUNICAR COM A VIEW CONTROLLER AS ACOES FEITAS NO BOTAO
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        //MARK: ASSINAR AS ACOES DO MEU TEXTFIELD
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate 
    }
    //MARK: CRIA O FRAME E ADICIONA AS FUNCOES FEITAS, TEM QUE ADICIONAR AQUI SE NAO, NAO IRA CONSEGUIR VER ALTERACOES
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()//MARK: ADICIONA OS ELEMENTOS OS BOTOES, TEXTO, TEXTFIELD
        configConstraints() //MARK: ADICONA AS CONFIGURACOES DAS CONSTRAINTS DOS COMPONENTES DE TELA
        backgroundColor = .blue //MARK: COR DE FUNDO DA TELA
    }
    //MARK: GERADO AUTOMATICAMENTE QUANDO CRIADO O INIT FRAME
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: CRIA TODAS COONSTRAINTS DOS COMPONETES DE TELA
    private func configConstraints(){
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),//MARK: DIRECIONA O TEXTO ABAIXO DA SAFE AREA
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),//MARK: DIRECIONA O TEXTO ALINHADO COM O MEIO DA TELA NO EIXO X
            
            loginTextLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),//MARK: DIRECIONA O TEXTO ABAIXO DE UM ELEMENTO ACIMA
            loginTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),//MARK: DIRECIONA O TEXTO DA ESQUERDA PARA DIREITA
            loginTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),//MARK: DIRECIONA O TEXTO DA DIREITA PARA ESQUERDA
            loginTextLabel.heightAnchor.constraint(equalToConstant: 40),//MARK: TAMANHO DO COMPONENTE NA TELA
            
            emailTextField.topAnchor.constraint(equalTo: loginTextLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            buttonLogin.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            buttonLogin.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            buttonLogin.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 10),
            buttonRegister.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            buttonRegister.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recuperarSenhaButton.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 5),//MARK: DIRECIONA O TEXTO ABAIXO DO ULTIMO COMPONENTE CRIADO
            recuperarSenhaButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),//MARK: DIRECIONA O TEXTO DA DIREITA PARA ESQUERDA, COMO TEM SO ELE O TEXTO FICA ALINHADO DA DIREITA PARA ESQUERDA
            
            
            
            
        ])
    }
    
}
