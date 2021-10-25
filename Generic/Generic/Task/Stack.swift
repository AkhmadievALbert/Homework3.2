//
//  Stack.swift
//  Generic
//
//  Created by a.akhmadiev on 25.10.2021.
//

import UIKit

protocol Stackable {
    associatedtype Element

    var isEmpty: Bool { get }
    var first: Element? { get }
    var last: Element? { get }
    var count: Int { get }

    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

struct Stack<T>: Stackable {

    typealias Element = T

    private var elements = [T]()

    var isEmpty: Bool {
        elements.isEmpty
    }

    var first: T? {
        elements.first
    }

    var last: T? {
        elements.last
    }

    var count: Int {
        elements.count
    }

    mutating func push(_ element: T) {
        elements.append(element)
    }

    mutating func pop() -> T? {
        guard let _ = last else { return nil }
        return elements.removeLast()
    }
}

extension Stack where T: UIViewController {

    mutating func push(_ viewController: T, animated: Bool) {
        guard let last = last else { return }
        last.present(viewController, animated: animated, completion: nil)
        push(viewController)
    }

    @discardableResult
    mutating func pop(animated: Bool) -> T? {
        guard let last = last else { return nil }
        last.dismiss(animated: animated, completion: nil)
        return pop()
    }

    mutating func dismissAll() {
        elements.reversed().forEach { $0.dismiss(animated: true, completion: nil) }
        elements.removeAll()
    }

    mutating func fastDismiss() {
        first?.dismiss(animated: true, completion: nil)
        elements.removeAll()
    }
}
