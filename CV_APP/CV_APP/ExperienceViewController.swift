//
//  ExperienceViewController.swift
//  CV_APP
//
//  Created by David Parra on 7/10/19.
//  Copyright © 2019 David Parra. All rights reserved.
//

import UIKit


class ExperienceViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    //pages that will have this view controller, created by the page file that can be used on the whole project
    
    let pages = [
        Page(name: "crystalcannon", header: "Crystal Cannon", description: "Crystal Cannon is a 3D isometric class based co-op fantasy shooter for PC. As one of the four fabled heroes of Legend, you are tasked with retrieving and protecting the ultimate weapon, the Crystal Cannon, and using it against Kendren, the cursed evil dragon, to defeat him and his crystal plague for all time. Developing Gameplay, AI Enemies, AI Bots for testing the game. ", date: "Mar. 2019 to Current"),
        Page(name: "flyout", header: "Fly Out", description: " 2D Game build in Unity Engine based on a endless runner using C# and scriptable objects. Developed gameplay mechanics, spawn points, AI, and player controller. This game can be Multiplatform, but for now is only on iOS and Android", date: "Oct. 2018 to Dec. 2018"),
        Page(name: "dit", header: "Dungeons in Time", description: "Third Person Game build in Unreal Engine based on a exploration world game using C++ language, Blueprints. Developed procedural dungeons for the game play, using closest path to connect each of the rooms. Making some of the AI with AIControllers, Patrolling path, and Following Actor or character", date: "Dec. 2018 to Feb. 2019"),
        Page(name: "spotit", header: "Spot.IT", description: "Mobile App created on Xcode with swift 4. This app will be a social network for showing all the events that are near to you. Using Firebase, CocoaPods, Push Nofitications", date: "Aug. 2017 to Current"),
        Page(name: "cvi", header: "Cowboys VS Indians", description: "Runner type Game made in Xcode for iOS platform, in Swift 4 and SpriteKit. I created the whole game mechanics, gameplays, widgets", date: "Aug. 2017 to Dec. 2017")
    ]
    
    //button for the creation of the pager, this will appear always at the top of the UI
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    //    function for clicking on the prev button
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //button for the creation of the pager, this will appear always at the top of the UI
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    //function for clicking on the next button
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    //    page controller for moving through all the views that i have
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    
    //    click userview to go to this view
    private let buttonUserView: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "myuser"), for: .normal)
        button.addTarget(self, action: #selector(handleUser), for: .touchUpInside)
        return button
    }()
    
    //    func to call the viewcontroller
    @objc private func handleUser() {
        let swipingController = ViewController()
        self.present(swipingController, animated: false, completion: nil)
    }
    
    //    click experienceview to go to this view
    private let buttonExperienceView: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "portfolio"), for: .normal)
        return button
    }()

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
    }
    
    //    stack for saving the buttons in a location
    private let bottomControlsStackView: UIStackView = {
        let stack =  UIStackView()
        return stack
    }()
    
    //    function for adding autolayout by code
    fileprivate func setupTopControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupBottomControls(){
        
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.addArrangedSubview(buttonExperienceView)
        bottomControlsStackView.addArrangedSubview(buttonUserView)
        bottomControlsStackView.addArrangedSubview(buttonStudiesView)
        configureContraintsForSize(size: view.bounds.size)
        
    }
    
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
    
    //    function for changing the pagecontroller index
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    //    function that loads every time you run the app
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopControls()
        setupBottomControls()
        
        collectionView.backgroundColor = .white
        collectionView.register(ExperienceCell.self, forCellWithReuseIdentifier: "cellExp")
        collectionView.isPagingEnabled = true
    }
    
    //    know how many pages the view will have
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    //    no space between the views
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //    size of the view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    //    creating the cell before putting it on the view
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExp", for: indexPath) as! ExperienceCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    //    function to get the the user moved from portrait to landscape or the other way around, for changing some values of the constraint
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        configureContraintsForSize(size: size)
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
    }
}

