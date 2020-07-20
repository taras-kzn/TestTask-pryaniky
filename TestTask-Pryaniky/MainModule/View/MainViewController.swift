//
//  MainViewController.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet private var tableView: UITableView!
    //MARK: - Properties
    private let nibNameMain = "MainTableViewCell"
    var presenter: MainViewPresenterProtcol!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    //MARK: - Priavte Function Config TableView
    private func configure() {
        tableView.register(UINib(nibName: nibNameMain, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
    }
}
//MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pryaniky?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as? MainTableViewCell
        guard let cell = tableCell else {
            return UITableViewCell()
        }
        let data = presenter.pryaniky?.data[indexPath.row]
        cell.congigure(model: data)
        return cell
    }
}
//MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter.pryaniky?.data[indexPath.row]
        presenter.tapOnTheInfoData(infoData: data)
    }
}
//MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

