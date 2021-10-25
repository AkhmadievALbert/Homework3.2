//
//  Factory.swift
//  Generic
//
//  Created by a.akhmadiev on 25.10.2021.
//

import UIKit

protocol Factory {
    associatedtype Context
    associatedtype Result

    func build(with context: Context) -> Result
}

/// Type Erasure of Factory protocol
private class AnyFactoryBox<Context, Result>: Factory {

    func build(with context: Context) -> Result {
        fatalError("This method is abstract")
    }
}

private class FactoryBox<Base: Factory>: AnyFactoryBox<Base.Context, Base.Result> {
    private let base: Base

    init(base: Base) {
        self.base = base
    }

    override func build(with context: Base.Context) -> Base.Result {
        return base.build(with: context)
    }
}

struct AnyFactory<Context, Result>: Factory {

    private let box: AnyFactoryBox<Context, Result>

    init<FactoryType: Factory>(factory: FactoryType) where FactoryType.Context == Context, FactoryType.Result == Result{
        self.box = FactoryBox(base: factory)
    }

    func build(with context: Context) -> Result {
        box.build(with: context)
    }
}

final class ViewFactory: Factory {
    func build(with context: ViewContext) -> UIView {
        let view = UIView()
        view.backgroundColor = context.color
        return view
    }
}

struct ViewContext {
    let color: UIColor
}
