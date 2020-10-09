//
//  PostsInteractor.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright (c) 2020 MostafaAbdElFatah. All rights reserved.
//

import Foundation

class PostsInteractor{
    
    // MARK: - Public properties -
    var presenter: PostsPresenterProtocol?
    var APIDataManager: PostsAPIsDataManagerInputProtocol?
    var localDataManager: PostsLocalDataManagerInputProtocol?
    
    // MARK: - Private properties -
    
    // MARK: - Init -
    init() {
        APIDataManager = PostsAPIsDataManager()
        localDataManager = PostsLocalDataManager()
    }
}

// MARK: - Extensions -
extension PostsInteractor: PostsInteractorInputProtocol {
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
    func fetchData() {
        print("PostsInteractor:fetchData")
        APIDataManager?.fetchPosts(completionHandler: { [weak self] (posts) in
            guard let self = self else { return }
            let response = PostsEntity.Response(posts: posts)
            self.presenter?.presentFetchedPosts(response: response)
        })
    }
}

extension PostsInteractor: PostsInteractorOutputProtocol {
    /**
     * Methods for communication  INTERACTOR -> PRESENTER
     */
}
