//
//  AppError.swift
//  OdeonDynamics
//
//  Created by Akif Demirezen on 13.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation
public protocol AppErrorCode {
    var code: Int {get}
    var domain: String {get}
    var localizedMessage: String {get}
    var localizedTitle: String? {get}
}

open class AppError: NSError {
    public var errorCode: AppErrorCode
    open var localizedMessage: String {
        return errorCode.localizedMessage
    }
    open var localizedTitle: String? {
        return errorCode.localizedTitle
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    public init(errorCode: AppErrorCode) {
        self.errorCode = errorCode
        super.init(domain: errorCode.domain, code: errorCode.code, userInfo: nil)
    }
}

class AppServiceError: AppError {
    enum ErrorCode: Int, AppErrorCode {
        case unknownError
        case connectionError
        case requestTimeOut
        case noNetwork
        var code: Int {
            return rawValue
        }
        var domain: String {
            return "WebService"
        }
        var localizedMessage: String {
            switch self {
            case .unknownError:
                return ErrorCodes["E0002"]!
            case .connectionError:
                return ErrorCodes["E0003"]!
            case .noNetwork:
                return ErrorCodes["E0004"]!
            case .requestTimeOut:
                return ErrorCodes["E0005"]!
            }
        }
        var localizedTitle: String? {
            return assignmentName
        }
    }
    static func customError(for error: NSError) -> ErrorCode {
        switch error.code {
        case -1009:
            return .noNetwork
        case -1001:
            return .requestTimeOut
        case -1008...(-1002):
            return .connectionError
        default:
            return .unknownError
        }
    }
    public convenience init(error: NSError) {
        let item = AppServiceError.customError(for: error)
        self.init(errorCode: item)
    }
}

class AppServerResponseError: AppError {
    static let JsonParsing = AppServerResponseError.init(errorCode: ErrorCode.jsonParsingError)
    static let Unknown = AppServerResponseError.init(errorCode: ErrorCode.unknownError)
    enum ErrorCode: AppErrorCode {
        case jsonParsingError
        case serverErrorMessage(String)
        case unknownError
        var code: Int {
            return 0
        }
        var domain: String {
            return "ServerResponse"
        }
        var localizedMessage: String {
            switch self {
            case .serverErrorMessage(let message):
                return message
            default:
                return ErrorCodes["E0006"]!
            }
        }
        var localizedTitle: String? {
            return assignmentName
        }
    }
    public convenience init(error: String) {
        let item = ErrorCode.serverErrorMessage(error)
        self.init(errorCode: item)
    }
}

class AppErrorResponse: AppError {
    struct ErrorCode: AppErrorCode {
        let serverError: String
        var code: Int {
            return 100
        }
        var domain: String {
            return "APIResponse"
        }
        var localizedMessage: String {
            return ErrorCodes["E0006"]!
        }
        var localizedTitle: String? {
            return assignmentName
        }
    }
    public convenience init(error: String) {
        let item = ErrorCode(serverError: error)
        self.init(errorCode: item)
    }
}
