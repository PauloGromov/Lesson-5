//  ViewController.swift
//  Lesson 5
//
//  Created by Павел Громов on 31.07.2023.
import UIKit

final class FirstViewController: UIViewController {
    private var label = UILabel()
    private var button = UIButton()
    private var textFieldPassword = UITextField()
    private var textFieldEmail = UITextField()
    private var labelEmail = UILabel()
    private var labelPass = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createLabel()
        createLabelEmail()
        createTextFieldEmail()
        createLabelPass()
        createTextFieldPassword()
        eyeButton()
        createButtonSignIn()
    }
  
//MARK: -- Create View Elements
    private func createLabel() {
        label = UILabel(frame: CGRect(x: 90, y: 120, width: 220, height: 60))
        label.text = "Birthday reminder"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        view.addSubview(label)
    }
    
    private func createLabelEmail() {
        labelEmail = UILabel(frame: CGRect(x: 40, y: 340, width: 50, height: 30))
        labelEmail.backgroundColor = .white
        view.addSubview(labelEmail)
        labelEmail.text = "Email"
        labelEmail.font = UIFont.systemFont(ofSize: 13)
        labelEmail.textColor = .gray
    }
    
    private func createLabelPass() {
        labelPass = UILabel(frame: CGRect(x: 40, y: 420, width: 100, height: 30))
        labelPass.backgroundColor = .white
        view.addSubview(labelPass)
        labelPass.text = "Password"
        labelPass.font = UIFont.systemFont(ofSize: 13)
        labelPass.textColor = .gray
    }
    
    private func createTextFieldEmail() {
        textFieldEmail = UITextField(frame: CGRect(x: 40, y: 370, width: 300, height: 30))
        textFieldEmail.placeholder = "example@email.com"
        textFieldEmail.delegate = self
        textFieldEmail.clearButtonMode = .whileEditing
        view.addSubview(textFieldEmail)
    }
    
    private func createTextFieldPassword() {
        textFieldPassword = UITextField(frame: CGRect(x: 40, y: 450, width: 300, height: 30))
        textFieldPassword.placeholder = "*******"
        textFieldPassword.delegate = self
        view.addSubview(textFieldPassword)
        textFieldPassword.isSecureTextEntry = true
    }
    
    private func eyeButton() {
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchDown)
        textFieldPassword.rightView = eyeButton
        textFieldPassword.rightViewMode = .always
    }
    
    private func createButtonSignIn() {
        button = UIButton(frame: CGRect(x: 45, y: 600, width: 300, height: 50))
        button.setTitle("Sign in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.addTarget(self, action: #selector(tapButton(sender: )), for: .touchUpInside)
        view.addSubview(button)
    }

//MARK: -- Methods
    private func configureUI() {
        view.backgroundColor = .white
    }
    
//MARK: -- Create Actions
    @objc func tapButton(sender: UIButton) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func eyeButtonTapped() {
        textFieldPassword.isSecureTextEntry.toggle()
    }
}

//MARK: -- Extensions
extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

