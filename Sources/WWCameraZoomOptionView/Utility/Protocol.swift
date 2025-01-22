//
//  WWCameraZoomOptionViewDelegate.swift
//  WWCameraZoomOption
//
//  Created by William.Weng on 2025/1/22.
//

import Foundation

// MARK: - WWCameraZoomOptionViewDelegate
public protocol WWCameraZoomOptionViewDelegate: AnyObject {
    
    /// 項目數量
    /// - Parameter optionView: WWCameraZoomOptionView
    /// - Returns: Int
    func itemCount(with optionView: WWCameraZoomOptionView) -> Int
    
    /// 項目文字
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    /// - Returns: String
    func labelText(with optionView: WWCameraZoomOptionView, index: Int) -> String
    
    /// 項目被選到哪一個
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, didSelected index: Int)
}
