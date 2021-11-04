//
// Generated by SwagGen with template `SwiftSAPURLSession`
// https://github.com/MarcoEidinger/SwagGen/tree/sap/Swift-SAPURLSession
//

import Foundation

extension ARService.Scene {

    /** Patch update an existing scene */
    internal enum UpdateScene {

        internal static let service = APIService<Response>(id: "updateScene", tag: "scene", method: "PATCH", path: "/scene/{sceneId}", hasBody: true)

        internal final class Request: APIRequest<Response> {

            internal struct Options {

                /** ID of scene to update */
                internal var sceneId: Int

                internal init(sceneId: Int) {
                    self.sceneId = sceneId
                }
            }

            internal var options: Options

            internal var body: Scene

            internal init(body: Scene, options: Options, encoder: RequestEncoder? = nil) {
                self.body = body
                self.options = options
                super.init(service: UpdateScene.service) { defaultEncoder in
                    return try (encoder ?? defaultEncoder).encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            internal convenience init(sceneId: Int, body: Scene) {
                let options = Options(sceneId: sceneId)
                self.init(body: body, options: options)
            }

            internal override var path: String {
                return super.path.replacingOccurrences(of: "{" + "sceneId" + "}", with: "\(self.options.sceneId)")
            }
        }

        internal enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            internal typealias SuccessType = String

            /** successful operation */
            case status200(String)

            /** Invalid input such as: body is invalid json format, body is missing required property or value, annotation anchor Id is duplicate, sceneId value is not consistent */
            case status400

            /** Business user is not authenticated */
            case status401

            /** Scene not found */
            case status404

            /** Invalid request path or method */
            case status405

            /** Server internal error */
            case status500

            internal var success: String? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            internal var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            internal var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status404: return 404
                case .status405: return 405
                case .status500: return 500
                }
            }

            internal var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status404: return false
                case .status405: return false
                case .status500: return false
                }
            }

            internal init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(String.self, from: data))
                case 400: self = .status400
                case 401: self = .status401
                case 404: self = .status404
                case 405: self = .status405
                case 500: self = .status500
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            internal var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            internal var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
