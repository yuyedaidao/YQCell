//
//  YQCell.swift
//  YQCell_Example
//
//  Created by 王叶庆 on 2020/7/6.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import YQLineView

enum YQCellAccessoryType: Int {
    case none
    case detail
}

class YQCell: YQLineView {

    private let accessoryWidth: CGFloat = 7
    private let accessoryHeight: CGFloat = 14
    private let margin: CGFloat = 15
    
    var accessoryType: YQCellAccessoryType = .detail {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var safeAreaInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: margin + accessoryWidth)
    }
    
    var preferredAreaInsets: UIEdgeInsets {
        switch accessoryType {
        case .detail:
            return safeAreaInsets
        default:
            return UIEdgeInsets.zero
        }
    }
    
    override func safeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.safeAreaInsetsDidChange()
        }
        setNeedsDisplay()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        switch accessoryType {
        case .detail:
            context.move(to: CGPoint(x: rect.maxX - margin - accessoryWidth, y: rect.midY - accessoryHeight / 2))
            context.addLine(to: CGPoint(x: rect.maxX - margin, y: rect.midY))
            context.addLine(to: CGPoint(x: rect.maxX - margin - accessoryWidth, y: rect.midY + accessoryHeight / 2))
            context.setLineWidth(2)
            context.setStrokeColor((color ?? UIColor.gray).cgColor)
            context.strokePath()
        default:
            break
        }
    }
    
    
    
    
}
