//
//  main.swift
//  Fiber2D
//
//  Created by Andrey Volodin on 09.09.16.
//  Copyright © 2016 s1ddok. All rights reserved.
//

import Cocoa
import AppKit

let delegate = AppDelegate()
let app = NSApplication.shared
app.delegate = delegate
app.setActivationPolicy(.regular)
app.activate(ignoringOtherApps: true)
app.performSelector(onMainThread: #selector(NSApplication.run),
                    with: nil, waitUntilDone: true)
