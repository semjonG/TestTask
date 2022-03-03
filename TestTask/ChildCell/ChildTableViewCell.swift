//
//  ChildTableViewCell.swift
//  TestTask
//
//  Created by mac on 02.03.2022.
//

import UIKit

protocol ChildCellDelegate: AnyObject {
    func deleteButtonDelegate (indexPath: IndexPath)
}

class ChildTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellNameView: UIView!
    @IBOutlet weak var cellAgeView: UIView!
    
    weak var delegate: ChildCellDelegate?

    
    @IBAction func deleteCellButtonPressed(_ sender: UIButton) {
        if let cellIndexPath = tableView?.indexPath(for: self) {
            delegate?.deleteButtonDelegate(indexPath: cellIndexPath)
        }
    }
    
    func cellElementsCustomisation() {
        cellNameView.layer.cornerRadius = 8
        cellNameView.layer.borderWidth = 0.2
        cellNameView.layer.borderColor = UIColor.darkGray.cgColor
        
        cellAgeView.layer.cornerRadius = 8
        cellAgeView.layer.borderWidth = 0.2
        cellAgeView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellElementsCustomisation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITableViewCell {
    var tableView: UITableView? {
        var view = superview
        while let someView = view, someView.isKind(of: UITableView.self) == false {
            view = someView.superview
        }
        return view as? UITableView
    }
}
