//  SecondViewController.swift
//  Lesson 5
//
//  Created by Павел Громов on 31.07.2023.
import UIKit

final class SecondViewController: UIViewController, PersonDelegate {
    
    private var tableView = UITableView()
    private var personArray: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configireUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(sender:)))
        
        createCustomTableView()
        loadData()
        tableView.reloadData()
    }

    // MARK: - Actions
    
    @objc func add(sender: UIBarButtonItem) {
        let thirdVC = ThirdViewController()
        thirdVC.delegate = self
        let navController = UINavigationController(rootViewController: thirdVC)
        present(navController, animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    private func configireUI() {
        view.backgroundColor = .white
        title = "Birthday"
    }
    
    private func createCustomTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.idCustomCell)
    }
    
    private func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "personArray") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([Person].self, from: savedData) {
                personArray = loadedData
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - PersonDelegate
    
    func didAddPerson(_ person: Person) {
        personArray.append(person)
        saveData()
        tableView.reloadData()
    }
    
    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(personArray) {
            UserDefaults.standard.set(encoded, forKey: "personArray")
        }
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.idCustomCell, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let person = personArray[indexPath.row]
        cell.configure(with: person)
        
        return cell
    }
}
