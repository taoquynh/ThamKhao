//
//  SettingViewController.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/22/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  
  var user: User?
  
  let avatarImageView: CircleImageView = {
    let image = CircleImageView(frame: .zero)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "avatar")
    return image
  }()
  
  let horizontalLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = hexStringToUIColor(hex: "66A8FB")
    view.layer.cornerRadius = 1
    return view
  }()
  
  let infoCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: "InfoCell")
    collection.backgroundColor = .clear
    return collection
  }()
  
  let logOutButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Đăng xuất", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = hexStringToUIColor(hex: "EC6767")
    button.layer.cornerRadius = 8
    button.titleLabel!.font = .systemFont(ofSize: 14)
    return button
  }()
  
  let changePasswordButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Đổi mật khẩu", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = hexStringToUIColor(hex: "F2B53A")
    button.layer.cornerRadius = 8
    button.titleLabel!.font = .systemFont(ofSize: 14)
    return button
  }()
  
  let settingButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Thay đổi thông tin", for: .normal)
    button.setTitleColor(hexStringToUIColor(hex: "66A8FB"), for: .normal)
    button.backgroundColor = .clear
    button.layer.cornerRadius = 8
    button.layer.borderColor = hexStringToUIColor(hex: "66A8FB").cgColor
    button.layer.borderWidth = 1
    button.titleLabel!.font = .systemFont(ofSize: 14)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupView()
    setupLayout()
    setupCollectionView()
    setupAction()
  }
  
  func setupData() {
    user = User(name: "Hoàng Anh Tùng", department: "Quản lý dữ liệu", codeId: "01-7089", email: "tungha.acb@gmail.com")
  }
  
  func setupView() {
    view.addSubview(avatarImageView)
    view.addSubview(horizontalLineView)
    view.addSubview(infoCollectionView)
    view.addSubview(logOutButton)
    view.addSubview(changePasswordButton)
    view.addSubview(settingButton)
  }
  
  func setupLayout() {
    avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.maxX * 0.15).isActive = true
    avatarImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33).isActive = true
    avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1).isActive = true
    
    horizontalLineView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32).isActive = true
    horizontalLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    horizontalLineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    horizontalLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    
    infoCollectionView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 32).isActive = true
    infoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    infoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    infoCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    
    settingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    settingButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    settingButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    settingButton.topAnchor.constraint(greaterThanOrEqualTo: infoCollectionView.bottomAnchor, constant: 32).isActive = true
    
    changePasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    changePasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    changePasswordButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    changePasswordButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 16).isActive = true
    
    logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    logOutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    logOutButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    logOutButton.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 16).isActive = true
    logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(tabBarController?.tabBar.bounds.height)! - 32).isActive = true
  }
  
  func setupCollectionView() {
    infoCollectionView.delegate = self
    infoCollectionView.dataSource = self
  }
  
  func setupAction() {
    logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
  }
  
  @objc func logOut() {
    navigationController?.popViewController(animated: true)
  }
}

extension SettingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let mirror = Mirror(reflecting: user!)
    return mirror.children.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCollectionViewCell
    cell.leftLabel.text = user!.getLabels()[indexPath.row]
    cell.rightLabel.text = user!.getValues()[indexPath.row]
    return cell
  }
  
  // hàm trả về kích thước của Item
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let mirror = Mirror(reflecting: user!)
    let count = CGFloat(mirror.children.count)
    let width = collectionView.frame.size.width - 1
    let height = (collectionView.frame.size.height - 1)
    return CGSize(width: width, height: height / count)
  }
  
  // hàm trả về khoảng cách giữa hai hàng
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
