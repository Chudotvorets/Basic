//
//  ImageCollectionViewCell.swift
//  DGSD
//
//  Created by SIMONOV on 20.06.2022.
//
import UIKit
import SnapKit
import Kingfisher

//MARK: - CollectionViewCellProtocol
protocol CollectionViewCellProtocol: AnyObject {
    func deletingTheSelectedCell(model: CollectionModel)
}

//MARK: - CollectionViewCell
class FavoritesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    weak var delegate: CollectionViewCellProtocol?
    var model: CollectionModel?
    static let identifier = "imageCollectionViewCell"
    
    
    
    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
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
    
    private lazy var deleteFavouritesButton: UIButton = {
        let favouritesButton = UIButton(type: .system)
        favouritesButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        favouritesButton.tintColor = .systemGray
        favouritesButton.addTarget(self, action: #selector(favouritesButtonTapped), for: .touchUpInside)
        return favouritesButton
    }()
    
    private var isSelectedButton = false
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePhotoImage()
        configureFirstNameLabel()
        configureDeleteFavouritesButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func setContent() {
        firstName.text = (self.model?.firstName ?? "") + " " + (self.model?.lastName ?? "")
        self.photoImageView.kf.setImage(with: URL(string: model?.photo  ?? ""), placeholder: nil)
    }
  
    private func configureCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        clipsToBounds = false
    }
    
    private func configurePhotoImage() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(50)
            make.height.width.equalTo(200)
        }
    }
    
    private func configureFirstNameLabel() {
        addSubview(firstName)
        firstName.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(photoImageView.snp.bottom)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func configureDeleteFavouritesButton() {
        addSubview(deleteFavouritesButton)
        deleteFavouritesButton.snp.makeConstraints { make in
            make.left.equalTo(firstName.snp.right).offset(10)
            make.centerY.equalTo(firstName.snp.centerY)
            make.width.height.equalTo(30)
        }
    }
    
   
    @objc
    private func favouritesButtonTapped() {
        isSelectedButton.toggle()
        guard let model = model else { return }
        delegate?.deletingTheSelectedCell(model: model)
    }
}
