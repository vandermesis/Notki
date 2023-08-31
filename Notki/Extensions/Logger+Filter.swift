//
//  Logger+Filter.swift
//  Notki
//
//  Created by Marek Skrzelowski on 28/08/2023.
//

import Foundation
import OSLog

public extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let networking = Logger(subsystem: subsystem, category: "networking")
    static let view = Logger(subsystem: subsystem, category: "view")
    static let utils = Logger(subsystem: subsystem, category: "utils")
    static let userDataChange = Logger(subsystem: subsystem, category: "userDataChange")
    static let shell = Logger(subsystem: subsystem, category: "shell")
    static let service = Logger(subsystem: subsystem, category: "service")
}
