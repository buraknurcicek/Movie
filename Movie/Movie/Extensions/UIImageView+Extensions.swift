//
//  UIImageView+Extensions.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

extension UIImageView {
    
    private func download(from url: URL) {
        contentMode = .scaleAspectFit
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func setImage(from url: String) {
        guard let url = URL(string: url) else { return }
        download(from: url)
    }
}
