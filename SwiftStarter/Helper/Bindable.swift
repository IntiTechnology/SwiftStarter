//
//  Bindable.swift
//  SwiftStarter
//
//  Created by Erick Manrique on 5/19/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

import Foundation

class Bindable<T> {
    typealias Listener = ((T) -> Void)
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    
}
