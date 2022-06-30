//
//  TableViewCell.swift
//  Basic project
//
//  Created by SIMONOV on 25.06.2022.
//

import Foundation
import UIKit

protocol TableViewCellProtocol: AnyObject {
    func didPressTableViewCellFavouritesTutton(isSelected: Bool, model: Result)
}

class TableViewCell: UITableViewCell {

    var model: Result?
    
    weak var delegate: TableViewCellProtocol?
    
    static let identifier = "imageTableViewCell"
    
    private lazy var favouritesButton: UIButton = {
        let favouritesButton = UIButton(type: .system)
        favouritesButton.setImage(UIImage(systemName: "heart.rectangle.fill"), for: .normal)
        favouritesButton.backgroundColor = .clear
        favouritesButton.addTarget(self, action: #selector(favouritesButtonTapped), for: .touchUpInside)
        return favouritesButton
    }()
    
    private var isSelectedButton = false
    
    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = 30
        photoImageView.layer.masksToBounds = true

        return photoImageView
    }()
    
    
    lazy var firstName: UILabel = {
        let firstName = UILabel()
        firstName.textAlignment = .left
        firstName.numberOfLines = 0
        firstName.text = "label2"
        firstName.font = .systemFont(ofSize: 14)
        firstName.textColor = .black
        return firstName
    }()
    
    lazy var lastName: UILabel = {
        let lastName = UILabel()
        lastName.textAlignment = .left
        lastName.numberOfLines = 0
        lastName.text = "label2"
        lastName.font = .systemFont(ofSize: 14)
        lastName.textColor = .black
        return lastName
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        configureCell()
        accessoryView = favouritesButton

        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        photoImageView.frame = contentView.bounds
//    }

    

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    private func configureCell() {
        configurePhotoImage()
        configureFirstName()
        configureLastName()
        configureFavoritesButton()
    }
    
    private func configurePhotoImage() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(50)
            make.width.equalTo(250)
            make.height.equalTo(300)
        }
    }
    
    
    private func configureFirstName() {
        addSubview(firstName)
        firstName.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(100)
        }
    }
    
    private func configureLastName() {
        addSubview(lastName)
        lastName.snp.makeConstraints { make in
            make.left.equalTo(firstName.snp.right).offset(5)
            make.bottom.equalToSuperview().inset(10)
            
        }
    }
    private func configureFavoritesButton() {
        addSubview(favouritesButton)
        favouritesButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(80)
            make.height.equalTo(40)
            
        }
    }
    
    @objc
    private func favouritesButtonTapped() {
        isSelectedButton.toggle()
        favouritesButton.tintColor = isSelectedButton ? .systemRed : .systemGray
        guard let model = model else { return }
        delegate?.didPressTableViewCellFavouritesTutton(isSelected: isSelectedButton, model: model)
    }
}


