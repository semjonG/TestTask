//
//  ViewController.swift
//  TestTask
//
//  Created by mac on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!

    @IBOutlet weak var addChildButton: UIButton!
    var childrenAmount: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cleanAllButton: UIButton!
    
    @IBAction func addChildButtonPressed(_ sender: UIButton) {
    }

    @IBAction func cleanAllButtonPressed(_ sender: UIButton) {
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
        
        elementsCustomisation()
    }


}

