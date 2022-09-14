//
//  MainViewController.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

final class MainViewController: BaseViewController {
    
    private lazy var tableView = UITableView()

    private let viewModel: MainViewModel
    private let dataManager = MainDataManager()
    private let alertFactory: AlertFactoryProtocol = AlertFactory()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchMovies()
    }
    
    override func loadView() {
        super.loadView()
        title = "Ana Sayfa"
    }
    
    private func showAlert() {
        let alertData = AlertViewData(title: "Hata", message: "Bir hata oluştu", okActionTitle: "Tamam")
        let alert = alertFactory.build(alertData: alertData)
        present(alert, animated: true, completion: nil)
    }
}

extension MainViewController: MainViewModelDelegate {
    func bind(with models: [MovieCell.ViewModel]) {
        dataManager.setData(models: models)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func completedWithError() {
        showAlert()
    }
}

private extension MainViewController {
    func setup() {
        addSubview()
        setConstraints()
        configureTableView()
    }
    
    func addSubview() {
        view.addSubviews(tableView)
    }
    
    func setConstraints() {
        tableView.setConstraints(top: view.safeAreaLayoutGuide.topAnchor,
                                 leading: view.leadingAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 trailing: view.trailingAnchor)
    }
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = dataManager
        tableView.dataSource = dataManager
        tableView.register(MovieCell.self)
    }
}
