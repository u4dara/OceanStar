//
//  Helper.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import Foundation

func delay(durationInSeconds seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
