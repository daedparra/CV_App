//
//  ExperienceCell.swift
//  CV_APP
//
//  Created by David Parra on 7/10/19.
//  Copyright © 2019 David Parra. All rights reserved.
//
import UIKit

class ExperienceCell: UICollectionViewCell{
    
    
    var page: Page?{
        didSet{
            guard let existPage = page else {return}
            imageProfileView.image = UIImage(named: existPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: existPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)])
            attributedText.append(NSAttributedString(string: "\n\n" + existPage.descriptionText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]))
            attributedText.append(NSAttributedString(string: "\n" + existPage.date, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
            
            descriptionView.attributedText = attributedText
            descriptionView.textAlignment = .center
            descriptionView.isEditable = false
            descriptionView.isScrollEnabled = false
        }
    }
    private let imageProfileView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "profilePicture"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private let descriptionView : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "David E. Parra Mercado", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)])
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        backgroundColor = .purple
        addSubview(descriptionView)
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        
        //        this enables autolayout for our imageView
        //        this area will locate the profile button on the center of the view and at the bottom of the view
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        
        topImageContainerView.addSubview(imageProfileView)
        imageProfileView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageProfileView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 20).isActive = true
        imageProfileView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7).isActive = true
        imageProfileView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        
    }
    
}

