//
//  AppTabBarViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/22/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController, UITabBarControllerDelegate {
  
  var timer: Timer!
  
  var homeVC: HomeViewController!
  var chartWeekVC: ChartWeekViewController!
  var emptyVC: EmptyViewController!
  var pieChartVC: PieChartViewController!
  var settingVC: SettingViewController!
  
  let addButton: CircleButton = {
    let button = CircleButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let spaceView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .clear
    return view
  }()
  
  let colorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "66A8FB")
    return view
  }()
  
  var location: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupVC()
    setupNavigation()
    setupView()
    setupLayout()
    setupAction()
  }
  
  func setupVC() {
    
    self.delegate = self
    
    homeVC = HomeViewController()
    chartWeekVC = ChartWeekViewController()
    emptyVC = EmptyViewController()
    pieChartVC = PieChartViewController()
    settingVC = SettingViewController()
    
    homeVC.tabBarItem.image = UIImage(named: "home")
    homeVC.tabBarItem.selectedImage = UIImage(named: "selected-home")
    chartWeekVC.tabBarItem.image = UIImage(named: "chart")
    chartWeekVC.tabBarItem.selectedImage = UIImage(named: "selected-chart")
    emptyVC.tabBarItem.image = UIImage(named: "plusIcon")
    emptyVC.tabBarItem.selectedImage = UIImage(named: "plusIcon")
    pieChartVC.tabBarItem.image = UIImage(named: "piechart")
    pieChartVC.tabBarItem.selectedImage = UIImage(named: "selected-piechart")
    settingVC.tabBarItem.image = UIImage(named: "setting")
    settingVC.tabBarItem.selectedImage = UIImage(named: "selected-setting")
    
    viewControllers = [homeVC, chartWeekVC, emptyVC, pieChartVC, settingVC]
  }
  
  func setupNavigation() {
    navigationItem.leftBarButtonItem = UIBarButtonItem()
  }
  
  func setupView() {
    view.addSubview(addButton)
    tabBar.insertSubview(spaceView, at: 5)
    spaceView.addSubview(colorView)
  }
  
  func setupLayout() {
    addButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -tabBar.bounds.height / 3).isActive = true
    addButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor, constant: 0).isActive = true
    addButton.widthAnchor.constraint(equalToConstant: tabBar.bounds.height / 4 * 6).isActive = true
    addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor, multiplier: 1).isActive = true
    addButton.layer.cornerRadius = tabBar.bounds.height / 4 * 6 / 2
    
    spaceView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -1).isActive = true
    spaceView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxX / 5).isActive = true
    location = spaceView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 0)
    location?.isActive = true
    spaceView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    
    colorView.topAnchor.constraint(equalTo: spaceView.topAnchor, constant: 0).isActive = true
    colorView.bottomAnchor.constraint(equalTo: spaceView.bottomAnchor, constant: 0).isActive = true
    colorView.centerXAnchor.constraint(equalTo: spaceView.centerXAnchor, constant: 0).isActive = true
    colorView.widthAnchor.constraint(equalTo: spaceView.widthAnchor, multiplier: 0.6).isActive = true
  }
  
  func setupAction() {
    addButton.addTarget(self, action: #selector(routToNewJobScene), for: .touchUpInside)
  }
  
  @objc func routToNewJobScene() {
    let destinationVC = JobPickerViewController()
    let navigation = UINavigationController(rootViewController: destinationVC)
    navigation.modalPresentationStyle = .fullScreen
    present(navigation, animated: true, completion: {})
    
  }
  
  // Thêm animation vào tabbar sao sự kiện chọn tabBarItem
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    let index = viewControllers!.firstIndex(of: viewController)
    UIView.animate(withDuration: 0.2, animations: {
      self.location!.constant = CGFloat(index!) * UIScreen.main.bounds.maxX / 5
      self.view.layoutIfNeeded()
    })
  }
}
