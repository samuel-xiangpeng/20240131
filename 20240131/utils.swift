//
//  utils.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/2/2.
//

import Foundation
import UIKit

// Apple 不鼓励使用此符号。使用通过上下文找到的 UIScreen 实例来代替。例如，通过窗口场景上的屏幕属性引用显示视图的屏幕管理包含视图的窗口。
extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}


extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}

let screen = UIScreen.current?.bounds

// 第二种简单的方法
//let screenSize = self.view.window?.windowScene?.screen.bounds.size
