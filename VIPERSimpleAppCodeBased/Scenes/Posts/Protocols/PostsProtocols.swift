//
//  PostsProtocols.swift
//  VIPERSimpleAppCodeBased
//
//  Created Mostafa Abd ElFatah on 10/9/20.
//  Copyright © 2020 MostafaAbdElFatah. All rights reserved.
//
//

import UIKit
import Foundation


//MARK: Presenter -
protocol PostsPresenterProtocol: class {
    var numberOfRows:Int{ get }
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */
    func viewDidLoad()
    func presentFetchedPosts(response:PostsEntity.Response)
    func configure(cell:PostCellViewProtocol, indexPath:IndexPath)

}

//MARK: View -
//MARK: View -
protocol PostCellViewProtocol: class {
    func configure(display:DisplayedPost)
}

protocol PostsViewProtocol: class {
    var presenter: PostsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadTableView()
}

//MARK: Interactor -
protocol PostsInteractorInputProtocol: class {
    
    var presenter: PostsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func fetchData()
}

//MARK: Wireframe -
protocol PostsWireframeProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}



protocol PostsInteractorOutputProtocol: class {
    
    var presenter: PostsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol PostsDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol PostsAPIsDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
    func fetchPosts(completionHandler: @escaping ([Post])  -> Void)
}

//MARK: Local -
protocol PostsLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
