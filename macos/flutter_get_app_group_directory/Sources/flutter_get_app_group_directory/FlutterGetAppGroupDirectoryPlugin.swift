import Cocoa
import FlutterMacOS

public class FlutterGetAppGroupDirectoryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "flutter_get_app_group_directory",
      binaryMessenger: registrar.messenger
    )
    let instance = FlutterGetAppGroupDirectoryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "get":
      guard
        let args = call.arguments as? [String: Any],
        let identifier = args["identifier"] as? String
      else {
        result(FlutterError(
          code: "INVALID_ARGUMENTS",
          message: "Expected 'identifier' argument of type String.",
          details: nil
        ))
        return
      }

      let fileManager = FileManager.default
      if let groupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: identifier) {
        result(groupURL.path)
      } else {
        result(FlutterError(
          code: "APP_GROUP_NOT_FOUND",
          message: "Could not find container URL for group ID: \(identifier)",
          details: nil
        ))
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
