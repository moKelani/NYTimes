//
//  FileManage+Exits.swift
//  NYTimes
//
//  Created by Mohamed Kelany on 10/01/2021.
//

import UIKit

public extension FileManager {
    static func fileExistInMainBundle(fileName: String) -> Bool {
        return FileManager.default.fileExists(atPath: Bundle.main.bundlePath.appending("/\(fileName)"))
    }
}
