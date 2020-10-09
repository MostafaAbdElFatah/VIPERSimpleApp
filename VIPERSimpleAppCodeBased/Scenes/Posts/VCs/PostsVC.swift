//
//  PostsVC.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright (c) 2020 MostafaAbdElFatah. All rights reserved.
//
//

import UIKit

final class PostsVC: UIViewController {
    
    // MARK: - Public properties -
    var presenter: PostsPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties -
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        presenter?.viewDidLoad()
    }
    
}

// MARK: - Extensions -
extension PostsVC: PostsViewProtocol {
    
    func showLoadingIndicator() {
        print("PostVC:showLoadingIndicator")
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        print("PostVC:hideLoadingIndicator")
        activityIndicator.stopAnimating()
    }
    
    func reloadTableView() {
        print("PostVC:reloadTableView")
        tableView.reloadData()
    }
}


extension PostsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTVC
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
}
