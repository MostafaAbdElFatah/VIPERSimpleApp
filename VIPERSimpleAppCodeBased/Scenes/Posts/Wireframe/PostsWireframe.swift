//
//  PostsWireframe.swift
//  VIPERSimpleAppCodeBased
//
//  Created by Mostafa Abd ElFatah on 10/9/20.
//  Copyright (c) 2020 MostafaAbdElFatah. All rights reserved.
//
//

import UIKit

class PostsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Posts", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleVC = storyboard.instantiateViewController(ofType: PostsVC.self)
        super.init(viewController: moduleVC)

        let interactor = PostsInteractor()
        let presenter = PostsPresenter(view: moduleVC, interactor: interactor, wireframe: self)
        moduleVC.presenter = presenter
    }

}

// MARK: - Extensions -
extension PostsWireframe: PostsWireframeProtocol {
    
}

