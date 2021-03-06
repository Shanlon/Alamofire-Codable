//
//  String+Codable.swift
//
//  Created by Robert Hanlon on 5/31/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

extension String {
    /// Converts a string into a codable object
    ///
    /// - Returns: An optional codable object
    func toCodable<T: Codable>() -> T? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
    
    /// Converts a string into an array codable object
    ///
    /// - Returns: An array optional codable object
    func toArrayCodable<T: Codable>() -> [T]? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            return nil
        }
    }
}
