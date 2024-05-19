import UIKit
import Flutter
import TFLiteSwift

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "com.example/object_detection"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        // Set up method channel
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "detectObjectOnImage" {
                if let imagePath = call.arguments as? String {
                    self.detectObjectOnImage(imagePath: imagePath, result: result)
                } else {
                    result(FlutterError(code: "InvalidArguments", message: "Image path is missing", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        })

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Method to detect objects on an image
    private func detectObjectOnImage(imagePath: String, result: @escaping FlutterResult) {
        do {
            // Load the TFLite model
            let tfliteModel = try TFLiteModel(modelPath: "mapuslan_model.tflite")
            let interpreter = try Interpreter(model: tfliteModel)

            // Load the image and preprocess it
            let image = UIImage(contentsOfFile: imagePath)
            // Perform any necessary preprocessing (e.g., resizing, normalization)

            // Perform inference using the model
            // Example: Run inference on the preprocessed image
            // Output the detected objects as a list of dictionaries
            var detections: [[String: Any]] = []
            // Perform inference and add the detected objects to the list

            result(detections)
        } catch {
            result(FlutterError(code: "TFLiteError", message: "Failed to load TFLite model", details: nil))
        }
    }
}
