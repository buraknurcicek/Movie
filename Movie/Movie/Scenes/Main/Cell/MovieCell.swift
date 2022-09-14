//
//  MovieCell.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

final class MovieCell: UITableViewCell, ReusableView {
    
    private lazy var containerView = makeContainerView()
    private lazy var movieImageView = makeImageView()
    private lazy var titleLabel = makeLabel()
    private lazy var genreLabel = makeLabel()

    private enum Constants {
        static let padding: CGFloat = 10
        static let imageSize: CGFloat = 30
    }
    
    // MARK: - ViewModel
    struct ViewModel {
        let imageURL: String?
        let title: String?
        let genre: String?
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        movieImageView.setImage(from: viewModel.imageURL ?? "")
        titleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
    }
}

private extension MovieCell {
    func setup() {
        addSubviews()
    }
    
    func addSubviews() {
        contentView.addSubviews(containerView)
        containerView.addSubviews(movieImageView, titleLabel, genreLabel)
    }
    
    func setConstraints() {
        containerView.setConstraints(top: contentView.topAnchor, topOffset: Constants.padding,
                                     leading: contentView.leadingAnchor, leadingOffset: Constants.padding,
                                     bottom: contentView.bottomAnchor, bottomOffset: Constants.padding,
                                     trailing: contentView.trailingAnchor, trailingOffset: Constants.padding)
        
        movieImageView.setConstraints(top: containerView.topAnchor, topOffset: Constants.padding,
                                      leading: containerView.leadingAnchor, leadingOffset: Constants.padding,
                                      bottom: containerView.bottomAnchor, bottomOffset: Constants.padding,
                                      centerY: containerView.centerYAnchor,
                                      width: Constants.imageSize,
                                      height: Constants.imageSize)
      
        titleLabel.setConstraints(top: movieImageView.topAnchor,
                                  leading: movieImageView.trailingAnchor, leadingOffset: Constants.padding,
                                  trailing: containerView.trailingAnchor, trailingOffset: Constants.padding)
      
        genreLabel.setConstraints(leading: titleLabel.leadingAnchor,
                                  bottom: movieImageView.bottomAnchor,
                                  trailing: titleLabel.trailingAnchor)
    }
    
    func makeContainerView() -> UIView {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
        return view
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }
}
