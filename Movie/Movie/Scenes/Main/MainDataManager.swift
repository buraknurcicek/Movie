//
//  MainSecion.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//


import Foundation
import UIKit

final class MainDataManager: NSObject {
    
    private var models: [MovieCell.ViewModel] = []

    func setData(models: [MovieCell.ViewModel]) {
        self.models = models
    }
}

extension MainDataManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell()
        let model = models[indexPath.row]
        cell.populate(with: model)
        return cell
    }
}

extension MainDataManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
