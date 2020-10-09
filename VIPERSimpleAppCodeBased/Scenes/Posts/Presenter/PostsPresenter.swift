//
//  PostsPresenter.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright (c) 2020 MostafaAbdElFatah. All rights reserved.
//
//

import Foundation

final class PostsPresenter {

    // MARK: - Public properties -
    var numberOfRows:Int{
        get{
            return self.response.posts.count
        }
    }
    
    // MARK: - Private properties -
    private weak var view: PostsViewProtocol?
    private let interactor: PostsInteractorInputProtocol
    private let wireframe: PostsWireframeProtocol
    private var response:PostsEntity.Response = PostsEntity.Response(posts: [])


    // MARK: - Lifecycle -
    init(view: PostsViewProtocol, interactor: PostsInteractorInputProtocol, wireframe: PostsWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.interactor.presenter = self
    }
}

// MARK: - Extensions -
extension PostsPresenter: PostsPresenterProtocol {
    
    func viewDidLoad() {
        print("presenter:viewDidLoad")
        view?.showLoadingIndicator()
        interactor.fetchData()
    }
    
    func presentFetchedPosts(response: PostsEntity.Response) {
        // convert data to display date
        print("presenter:presentFetchedPosts")
        self.response = response
        view?.hideLoadingIndicator()
        view?.reloadTableView()
    }
    
    func configure(cell: PostCellViewProtocol, indexPath: IndexPath) {
        let post = DisplayedPost(postInfo: self.response.posts[indexPath.row])
        cell.configure(display: post)
    }
    
}

