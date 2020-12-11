//
//  stateSegmentedControl.swift
//  TimeTracker
//
//  Created by Hoang Tung on 2/21/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class StateSegmentedControl: UISegmentedControl {
  override open func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = self.bounds.size.height / 2.0
    self.backgroundColor = hexStringToUIColor(hex: "F6F9F9")
  }
}
