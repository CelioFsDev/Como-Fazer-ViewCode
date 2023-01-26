//
//  LoginScreenViewController.swift
//  Como Fazer View Code
//
//  Created by Celio Ferreira on 23/01/23.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    var loginScreen: LoginScreen?//MARK: CRIANDO A REFERENCIA DA VIEW
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen//MARK: ESSA VIEW E DA VIEW CONTROLLER QUE RECEBE A VIEW DA LOGINSCREEN
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.textFieldDelegate(delegate: self)//MARK: delegate textfield
        //MARK: Primeiro : Tem Que adicionar Quem vai ficar responsavel pela assinatura Que sera self(viewcontroller)
        //MARK: Segundo: Cria uma extension
        
        
        self.loginScreen?.delegate(delegate: self)//MARK: Delegate da LogginScreen de ações de botões
        
    }
    
    



}

/*
 MARK: terceiro: Criado a extension cria uma função textFieldShouldReturn com um textField.resignFirstResponder para Que o teclado abaixar ao clicar return. Configuração pega direto dentro da loginScreen na parte da configTextFieldDelegate, se habilitar lá novos textFields ja vai pegar essa funcionalidade */
extension LoginScreenViewController: UITextFieldDelegate {
    //MARK: Função dispara Quando clica no textfield
    private func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
    }
    //MARK: FUNCAO DISPARA QUANDO FECHA O TECLADO
    private func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        
        let mail: String = loginScreen?.emailTextField.text ?? ""
        let passwordTextField = loginScreen?.passwordTextField.text ?? ""
        
        if !mail.isEmpty && !passwordTextField.isEmpty {
            print("Botao habilitado pois nao esta vazio")
            loginScreen?.buttonLogin.isEnabled = true
            loginScreen?.buttonLogin.backgroundColor = .darkGray.withAlphaComponent(1)
            loginScreen?.buttonLogin.setTitleColor(.white, for: .normal)
        }else {
            print("Botao desabilitado")
            loginScreen?.buttonLogin.isEnabled = false
        }
        
        return false
    }
    
}
//MARK: EXTENSION CONTROLADORA DOS BOTOES E ACOES DOS BOTOES
extension LoginScreenViewController: LoginScreenProtocol {
    func tappedRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("Registrar")
        
    }
    
    func tappedRecuparSenhaButton() {
        print("Recuperar senha")
        
    }
    
    func tappedLoginButton() {
        print("Clicou no botao asdasdas")
    }
}
