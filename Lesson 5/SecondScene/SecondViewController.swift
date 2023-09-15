//  SecondViewController.swift
//  Lesson 5
//
//  Created by Павел Громов on 31.07.2023.
import UIKit

final class SecondViewController: UIViewController {
    private var tableView = UITableView()
    private var personArray: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Birthday"
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(sender: )))
        createCustomTableView()
    }
    //MARK: -- Actions
    @objc func add(sender: UIBarButtonItem) {
        let thirdVC = ThirdViewController()
        thirdVC.onSave = { [weak self] person in
            self?.updateTable(with: person)
        }
        let navController = UINavigationController(rootViewController: thirdVC)
        present(navController, animated: true, completion: nil)
    }
    //MARK: - Methods
    private func createCustomTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.idCustomCell)
    }
    
    private func updateTable(with person: Person) {
        personArray.append(person)
        tableView.reloadData()
    }
}
//MARK: -- extensions
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.idCustomCell, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let person = personArray[indexPath.row]
        cell.nameLabel.text = person.name
        cell.dateLabel.text = person.birthdate
        cell.avatarLabel.text = person.name.getFirstSumbols()
        return cell
    }
}
