//
//  TableViewCell.swift
//  Basic project
//
//  Created by SIMONOV on 25.06.2022.
//

import Foundation
import UIKit
import Kingfisher

protocol TableViewCellProtocol: AnyObject {
    func pressingTheFavoritesButton(isSelected: Bool, model: TableModel)
}

class TableViewCell: UITableViewCell {

    var model: TableModel?
    
    weak var delegate: TableViewCellProtocol?
    
    static let identifier = "imageTableViewCell"
    
    lazy var favouritesButton: UIButton = {
        let favouritesButton = UIButton(type: .system)
        favouritesButton.setImage(UIImage(systemName: "heart.rectangle.fill"), for: .normal)
        favouritesButton.backgroundColor = .clear
        favouritesButton.tintColor = .gray
        favouritesButton.addTarget(self, action: #selector(favouritesButtonTapped), for: .touchUpInside)
        return favouritesButton
    }()
    
    var isSelectedButton = false
    
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
        firstName.font = .systemFont(ofSize: 14)
        firstName.textColor = .black
        return firstName
    }()
    
    lazy var lastName: UILabel = {
        let lastName = UILabel()
        lastName.textAlignment = .left
        lastName.numberOfLines = 0
        lastName.font = .systemFont(ofSize: 14)
        lastName.textColor = .black
        return lastName
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        configurePhotoImage()
        configureFirstName()
        configureLastName()
        configureFavoritesButton()
        
        accessoryView = favouritesButton

        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func prepareForReuse() {
        super.prepareForReuse()
        isSelectedButton = false
        favouritesButton.tintColor = .gray
    }
    
    func addContent() {
        firstName.text = (self.model?.firstName ?? "") + " " + (self.model?.lastName ?? "")
        self.photoImageView.kf.setImage(with: URL(string: model?.photo  ?? ""), placeholder: nil)
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
            make.bottom.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(60)
        }
    }
    
    private func configureLastName() {
        addSubview(lastName)
        lastName.snp.makeConstraints { make in
            make.left.equalTo(firstName.snp.right).offset(5)
            make.bottom.equalToSuperview().inset(20)
            
        }
    }
    private func configureFavoritesButton() {
        addSubview(favouritesButton)
        favouritesButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(40)
            make.height.equalTo(40)
            
        }
    }
    
    @objc
    private func favouritesButtonTapped() {
        isSelectedButton.toggle()
        favouritesButton.tintColor = isSelectedButton ? .systemRed : .systemGray
        guard let model = model else { return }
        delegate?.pressingTheFavoritesButton(isSelected: isSelectedButton, model: model)
    }
}


