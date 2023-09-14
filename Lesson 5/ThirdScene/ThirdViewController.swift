//  ThirdViewController.swift
//  Lesson 5
//
//  Created by Павел Громов on 31.07.2023.
import UIKit

final class ThirdViewController: UIViewController {
    private var labelName = UILabel()
    private var textFieldName = UITextField()
    private var labelDate = UILabel()
    private var textFieldDate = UITextField()
    private var pickerDate = UIDatePicker()
    private var labelAge = UILabel()
    private var textFieldAge = UITextField()
    private var pickerAge = UIPickerView()
    private var labelGander = UILabel()
    private var textFieldGender = UITextField()
    private var pickerGender = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        createBarButtonItems()
        createTextFieldName()
        createLabelName()
        createlabelDate()
        createTextFieldDate()
        createDatepicker()
        createLabelAge()
        createTextFieldAge()
        createAgePicker()
        createLabelGender()
        createTextFieldGender()
        genderPicker()
    }
    
    //MARK: - Create View Elements
    private func configure() {
        self.title = " 3 VC "
        view.backgroundColor = .white
    }
    
    private func createBarButtonItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(sender: )))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton(sender: )))
    }
    
    private func createLabelName() {
        labelName = UILabel(frame: CGRect(x: 30, y: 320, width: 50, height: 30))
        labelName.backgroundColor = .white
        view.addSubview(labelName)
        labelName.text = "Name"
        labelName.font = UIFont.systemFont(ofSize: 14)
        labelName.textColor = .gray
    }
    
    private func createTextFieldName() {
        textFieldName = UITextField(frame: CGRect(x: 30, y: 350, width: 150, height: 30))
        textFieldName.placeholder = "Ведите имя"
        textFieldName.delegate = self
        view.addSubview(textFieldName)
    }
    
    fileprivate func createlabelDate() {
        labelDate = UILabel(frame: CGRect(x: 30, y: 390, width: 50, height: 30))
        labelDate.backgroundColor = .white
        view.addSubview(labelDate)
        labelDate.text = "Date"
        labelDate.font = UIFont.systemFont(ofSize: 14)
        labelDate.textColor = .gray
    }
    
    private func createTextFieldDate() {
        textFieldDate = UITextField(frame: CGRect(x: 30, y: 420, width: 150, height: 30))
        textFieldDate.placeholder = "Ведите дату"
        textFieldDate.delegate = self
        view.addSubview(textFieldDate)
    }
    
    private func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    private func createDatepicker() {
        textFieldDate.inputView = pickerDate
        textFieldDate.inputAccessoryView = createToolbar()
        pickerDate.preferredDatePickerStyle = .wheels
        pickerDate.datePickerMode = .date
    }
    
    private func createLabelAge() {
        labelAge = UILabel(frame: CGRect(x: 30, y: 450, width: 50, height: 30))
        labelAge.backgroundColor = .white
        view.addSubview(labelAge)
        labelAge.text = "Age"
        labelAge.font = UIFont.systemFont(ofSize: 14)
        labelAge.textColor = .gray
    }
    
    private func createTextFieldAge() {
        textFieldAge = UITextField(frame: CGRect(x: 30, y: 480, width: 150, height: 30))
        textFieldAge.placeholder = "Введите возраст"
        textFieldAge.delegate = self
        view.addSubview(textFieldAge)
    }
    
    private func createAgeToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneActionAge))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    private func createAgePicker() {
        textFieldAge.inputView = pickerAge
        textFieldAge.inputAccessoryView = createAgeToolbar()
        pickerAge.dataSource = self
        pickerAge.delegate = self
    }
    
    private func createLabelGender() {
        labelGander = UILabel(frame: CGRect(x: 30, y: 510, width: 50, height: 30))
        labelGander.backgroundColor = .white
        view.addSubview(labelGander)
        labelGander.text = "Gender"
        labelGander.font = UIFont.systemFont(ofSize: 14)
        labelGander.textColor = .gray
    }
    
    private func createTextFieldGender() {
        textFieldGender = UITextField(frame: CGRect(x: 30, y: 540, width: 150, height: 30))
        textFieldGender.placeholder = "Введите возраст"
        textFieldGender.delegate = self
        view.addSubview(textFieldGender)
    }
    
    private func createGenderToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneActionGender))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    private func genderPicker() {
        textFieldGender.inputView = pickerGender
        textFieldGender.inputAccessoryView = createGenderToolBar()
        pickerGender.dataSource = self
        pickerGender.delegate = self
    }
    
    //MARK: - Create Actions
    
    @objc func cancel(sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    var onSave: ((Person) -> Void)?
    
    @objc func saveButton(sender: UIBarButtonItem) {
        let name = textFieldName.text ?? "nil"
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        let birthdate = dateFormater.string(from: pickerDate.date)
        let person = Person(name: name, birthdate: birthdate)
        
        if let onSave = onSave {
            onSave(person)
        }
        
        dismiss(animated: true)
    }
    
    // textFieldDate and datePicker
    @objc func doneAction() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        self.textFieldDate.text = dateFormater.string(from: pickerDate.date)
        self.view.endEditing(true)
    }
    
    // for pickerAge
    @objc func doneActionAge() {
        self.view.endEditing(true)
    }
    
    // for pickerGender
    @objc func doneActionGender() {
        self.view.endEditing(true)
    }
    
}

//MARK: - Extensions
extension ThirdViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension ThirdViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerAge {
            return 100
        } else if pickerView == pickerGender {
            return 2
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerAge {
            return "\(row + 1)"
        } else if pickerView == pickerGender {
            return row == 0 ? "Муж" : "Жен"
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerAge {
            textFieldAge.text = "\(row + 1)"
        } else if pickerView == pickerGender {
            textFieldGender.text = row == 0 ? "Муж" : "Жен"
        }
    }
  
}
