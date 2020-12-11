//
//  PushButton.swift
//  AddAnimation
//
//  Created by Tào Quỳnh  on 8/1/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {

    private struct Constants {
        static let plusLineWidth: CGFloat = 10.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    
    private var halfHight: CGFloat {
        return bounds.height / 2
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        // thiết lập độ rộng và độ cao
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        // tạo đường dẫn
        let plusPath = UIBezierPath()
        
        //đặt độ rộng và độ cao cho đường dẫn
        plusPath.lineWidth = Constants.plusLineWidth
        
        // dịch chuyển điểm ban đầu của đường dẫn
        // bắt đầu vẽ nét ngang
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHight + Constants.halfPointShift))
        
        // thêm một điểm vào đường dẫn ở cuối
        // Đường thẳng đứng
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHight + Constants.halfPointShift))
        
        if isAddButton {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHight - halfPlusWidth + Constants.halfPointShift))
            
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHight + halfPlusWidth + Constants.halfPointShift))
        }
        
        // đặt màu nét
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    
}
