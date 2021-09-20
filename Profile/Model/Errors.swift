//
//  Errors.swift
//  Profile
//
//  Created by Artem Palyutin on 20.09.2021.
//

import Foundation


enum ErrorSignUp: Error {
    case invalidEmail
    case passwordIsLessThan6Characters
    case passwordsDoNotMatch
}
