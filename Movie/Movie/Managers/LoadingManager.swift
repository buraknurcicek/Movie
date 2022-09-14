//
//  LoadingManagers.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

protocol LoadingProtocol {
    func showLoading()
    func hideLoading()
}

final class LoadingManager: LoadingProtocol {
    
    static let shared: LoadingManager = .init()
    
    private lazy var loadingView = makeLoadingView()
    private lazy var activityIndicator = makeActivityIndicator()
    
    enum Constants {
        static let cornerRadius = 8.0
        static let loadingViewWidth = 74.0
        static let loadingViewHeight = 74.0
        static let activtyIndicatorWidth = 66.0
        static let activtyIndicatorHeight = 66.0
    }
}

extension LoadingManager {

    func showLoading() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
                DispatchQueue.main.async { [weak self] in
                    self?.setup(on: window)
                    window.isUserInteractionEnabled = false
                }
            }
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
                DispatchQueue.main.async {[weak self] in
                    self?.remove()
                    window.isUserInteractionEnabled = true
                }
            }
        }
    }
}

private extension LoadingManager {
    func setup(on window: UIWindow) {
        addSubviews(on: window)
        setConstraints(on: window)
        activityIndicator.startAnimating()
        window.bringSubviewToFront(loadingView)
    }
    
    func addSubviews(on window: UIWindow) {
        window.addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
    }
    
    func setConstraints(on window: UIWindow) {
        loadingView.setConstraints(centerX: window.centerXAnchor,
                                  centerY: window.centerYAnchor,
                                  width: Constants.loadingViewWidth,
                                  height: Constants.loadingViewHeight)
        
        activityIndicator.setConstraints(centerX: loadingView.centerXAnchor,
                                        centerY: loadingView.centerYAnchor,
                                        width: Constants.activtyIndicatorWidth,
                                        height: Constants.activtyIndicatorHeight)
    }
    
    func remove() {
        loadingView.removeFromSuperview()
    }
    
    func makeLoadingView() -> UIView {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .black
        return activityIndicator
    }
}
