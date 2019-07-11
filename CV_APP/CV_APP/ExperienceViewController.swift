//
//  ExperienceViewController.swift
//  CV_APP
//
//  Created by David Parra on 7/10/19.
//  Copyright © 2019 David Parra. All rights reserved.
//

import UIKit
import Firebase

class ExperienceViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    //pages that will have this view controller, created by the page file that can be used on the whole project
    
    var pages = [Page]()
    
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
        button.setTitleColor(.black, for: .normal)
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
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
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
        self.removeFromParent()
    }
    
    //    click experienceview to go to this view
    private let buttonExperienceView: UIButton = {
        let button = UIButton(type: .system)
        let origImage = UIImage(named: "portfolio")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(tintedImage, for: .normal)
        button.tintColor = UIColor(red: 124/255, green: 38/255, blue: 102/255, alpha: 0.2)
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
        self.removeFromParent()
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
//    add to the current view the buttons to the bottom
    private func setupBottomControls(){
        
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.addArrangedSubview(buttonExperienceView)
        bottomControlsStackView.addArrangedSubview(buttonUserView)
        bottomControlsStackView.addArrangedSubview(buttonStudiesView)
        configureContraintsForSize(size: view.bounds.size)
        
    }
//    change the constraints for landscape or portrait
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
//    connect to firebase and get the jason file
    private func getDataFromFirebase(){
        var ref: DatabaseReference!
        
        ref = Database.database().reference(withPath: "experiences")
        
        ref.observe(.value) { (snapshot) in
            var newLeaders = [Page]()
            for child in snapshot.children{
                let data = child as? DataSnapshot
                let value = data?.value as? [String:Any]
                let date = value?["date"] as? String
                let description = value?["description"] as? String
                let header = value?["header"] as? String
                let name = value?["name"] as? String
                let page = Page(name: name!, header: header!, description: description!, date: date!)
                newLeaders.append(page)
            }
            self.pages = newLeaders
            self.collectionView.reloadData()
        }
    }
    
    
    //    function that loads every time you run the app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromFirebase()
        
        setupTopControls()
        setupBottomControls()
        
        collectionView.backgroundColor = .white
        collectionView.register(ExperienceCell.self, forCellWithReuseIdentifier: "cellExp")
        collectionView.isPagingEnabled = true
    }
    
    //    know how many pages the view will have
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = pages.count
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

