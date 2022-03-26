//
//  ViewController.swift
//  TestTask
//
//  Created by mac on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!

    @IBOutlet weak var addChildButton: UIButton!
    var childrenAmount: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cleanAllButton: UIButton!
    
    @IBAction func addChildButtonPressed(_ sender: UIButton) {
        childrenAmount.append(1)
        tableView.reloadData()
        
        if childrenAmount.count == 5 {
            addChildButton.isHidden = true
        }
    }

    @IBAction func cleanAllButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController()
        
        alert.addAction(UIAlertAction(title: "Сбросить все данные", style: .destructive , handler:{ (UIAlertAction)in
            self.childrenAmount = []
            self.addChildButton.isHidden = false
            self.nameTextField.text = " "
            self.ageTextField.text = " "
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
        }))
        
        self.present(alert, animated: true, completion: {})
        
    }
    
    func elementsCustomisation() {
        
        nameView.layer.cornerRadius = 8
        nameView.layer.borderWidth = 0.2
        nameView.layer.borderColor = UIColor.darkGray.cgColor
        
        ageView.layer.cornerRadius = 8
        ageView.layer.borderWidth = 0.2
        ageView.layer.borderColor = UIColor.darkGray.cgColor
        
        addChildButton.layer.masksToBounds = true
        addChildButton.layer.cornerRadius = 19
        addChildButton.layer.borderWidth = 2
        addChildButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        cleanAllButton.layer.masksToBounds = true
        cleanAllButton.layer.cornerRadius = 19
        cleanAllButton.layer.borderWidth = 2
        cleanAllButton.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        elementsCustomisation()
        
        tableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childrenAmount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildTableViewCell", for: indexPath) as! ChildTableViewCell
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: ChildCellDelegate {
    func deleteButtonDelegate(indexPath: IndexPath) {
        childrenAmount.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
