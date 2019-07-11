//
//  ViewController.swift
//  CV_APP
//
//  Created by David Parra on 7/9/19.
//  Copyright © 2019 David Parra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //{} is refered to as closure, or anon. fucntions
//    photo for user image
    let imageProfileView: UIImageView = {
       let imageview = UIImageView(image: UIImage(named: "profilePicture"))
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 90
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    //    click userview to go to this view
    private let buttonUserView: UIButton = {
        let button = UIButton(type: .system)
        let origImage = UIImage(named: "myuser")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(tintedImage, for: .normal)
        button.tintColor = UIColor(red: 124/255, green: 38/255, blue: 102/255, alpha: 0.2)
        return button
    }()
    //    click experienceview to go to this view
    private let buttonExperienceView: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "portfolio"), for: .normal)
        button.addTarget(self, action: #selector(handleExperience), for: .touchUpInside)
        return button
    }()
    
    //    func to call the viewcontroller
    @objc private func handleExperience() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = ExperienceViewController(collectionViewLayout: layout)
        self.present(swipingController, animated: false, completion: nil)
        self.removeFromParent()
    }
    
    //    click studiesView to go to this view
    private let buttonStudiesView: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "studies"), for: .normal)
        button.addTarget(self, action: #selector(handleStudies), for: .touchUpInside)
        return button
    }()
    
    //    func to call the viewcontroller
    @objc private func handleStudies() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = StudiesViewController(collectionViewLayout: layout)
        self.present(swipingController, animated: false, completion: nil)
        self.removeFromParent()
    }
    
    private let bottomControlsStackView: UIStackView = {
        let stack =  UIStackView()
        return stack
    }()
    
    let descriptionView : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "David E. Parra Mercado", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)])
        
         attributedText.append(NSAttributedString(string: "\nGame Programmer/Developer", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]))
        
        attributedText.append(NSAttributedString(string: "\n\nda_dparra@hotmail.com", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))

        attributedText.append(NSAttributedString(string: "\nInterested in the creation and development of software, up for creating all types of games in different platforms with C++, C#, Swift, such as pc, mobile or console", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        
        attributedText.append(NSAttributedString(string: "\nhttps://www.linkedin.com/in/david-eduardo-parra-mercado/", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        view.addSubview(descriptionView)
        
        setupBottomControls()
        setupLayout()
        
    }
    
//    function to get the the user moved from portrait to landscape or the other way around, for changing some values of the constraint
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        configureContraintsForSize(size: size)
    }
    
//    changing the values of the bottom constraints
    private func configureContraintsForSize(size: CGSize){
        if(size.width > size.height){
            
            bottomControlsStackView.removeConstraints()
            
            bottomControlsStackView.distribution = .fillEqually
            bottomControlsStackView.spacing = 90
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                             constant: 230).isActive = true
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                              constant: -230).isActive = true
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        }else{
            
            bottomControlsStackView.removeConstraints()
            
            bottomControlsStackView.distribution = .fillEqually
            bottomControlsStackView.spacing = 90
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                             constant: 30).isActive = true
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                              constant: -30).isActive = true
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
//    when the view load we setup the buttons
    private func setupBottomControls(){
        
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.addArrangedSubview(buttonExperienceView)
        bottomControlsStackView.addArrangedSubview(buttonUserView)
        bottomControlsStackView.addArrangedSubview(buttonStudiesView)
        configureContraintsForSize(size: view.bounds.size)
    }

    private func setupLayout(){
        
        //        this enables autolayout for our imageView
        //        this area will locate the profile button on the center of the view and at the bottom of the view
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        
        topImageContainerView.addSubview(imageProfileView)
        imageProfileView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageProfileView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 20).isActive = true
        imageProfileView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageProfileView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        
    }

}

//removing old constraints for adding the new ones
extension UIView {
    
    /**
     Removes all constrains for this view
     */
    func removeConstraints() {
        
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []
        
        self.superview?.removeConstraints(constraints)
    }
}
