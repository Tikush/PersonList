//
//  ViewController.swift
//  TikoJanikashvili-Lecture14
//
//  Created by Tiko Janikashvili on 23.11.22.
//

import UIKit

class PersonViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var persons: [Person] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configurePerson()
    }
    
    private func setupLayout() {
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
        tableView.dataSource = self
    }
    
    private func configurePerson() {
        persons.append(Person(name: "ანა", surname: "ბერიძე", age: 11))
        persons.append(Person(name: "ლილე", surname: "კალანდაძე", age: 22))
        persons.append(Person(name: "ნინო", surname: "ცინცაძე", age: 33))
        persons.append(Person(name: "დათო", surname: "თაქთაქიშვილი", age: 44))
        persons.append(Person(name: "ლევანი", surname: "ჯავახიშვილი", age: 55))
        persons.append(Person(name: "ლუკა", surname: "კოპაძე", age: 66))
        persons.append(Person(name: "ნინო", surname: "გონგლიაშვილი", age: 55))
        persons.append(Person(name: "ნათია", surname: "გახარია", age: 66))
        persons.append(Person(name: "გიორგი", surname: "დალაქიშვილი", age: 55))
        persons.append(Person(name: "საბა", surname: "კოპაძე", age: 66))
    }
    
    private func alert(text: String) {
        
        let attributedString = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.systemBlue
        ])
        
        let alert = UIAlertController(title: "", message: text, preferredStyle: .alert)
        alert.view.layer.borderColor = UIColor.systemBlue.cgColor
        alert.view.layer.borderWidth = 1
        alert.view.layer.cornerRadius = 7
        

        alert.setValue(attributedString, forKey: "attributedMessage")

        
        alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel))
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
        cell?.delegate = self
        cell?.configure(with: persons[indexPath.row])
        return cell!
    }
}

extension PersonViewController: PersonCellDelegate {
    func showAge(cell: UITableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            alert(text: "\(persons[index.row].age)")
        }
    }
    
    func showName(cell: UITableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            alert(text: persons[index.row].name)
        }
    }
}
