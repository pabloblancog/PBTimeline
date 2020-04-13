//
//  LocalFiles+Utils.swift
//  PBUtils
//
//  Created by Pablo Blanco González on 11/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import Foundation

public class LocalFilesUtils {
    
    public enum LocalFileExtension: String {
        case JSON = "json"
    }
    
    public static func readLocalJSONFile(name: String) -> Data? {
        return LocalFilesUtils.readLocalFile(name: name, type: LocalFileExtension.JSON)
    }
    
    public static func readLocalFile(name: String, type: LocalFileExtension) -> Data? {
        guard !name.isEmpty,
            let pathString = Bundle(for: self).path(forResource: name, ofType: type.rawValue),
            let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue),
            let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
                return nil
        }
        return jsonData
    }
}
