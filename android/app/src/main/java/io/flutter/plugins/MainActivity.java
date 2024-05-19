import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import androidx.annotation.NonNull;

import org.tensorflow.lite.Interpreter;
import org.tensorflow.lite.support.common.FileUtil;

import java.io.IOException;
import java.nio.MappedByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example/object_detection";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        // Register method channel
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    if (call.method.equals("detectObjectOnImage")) {
                        String imagePath = call.argument("imagePath");
                        List<Map<String, Object>> detections = detectObjectOnImage(imagePath);
                        result.success(detections);
                    } else {
                        result.notImplemented();
                    }
                });
    }

    // Method to detect objects on an image
    private List<Map<String, Object>> detectObjectOnImage(String imagePath) {
        try {
            // Load the TFLite model
            MappedByteBuffer tfliteModel = FileUtil.loadMappedFile(this, "mapuslan_model.tflite");
            Interpreter.Options options = new Interpreter.Options();
            Interpreter tflite = new Interpreter(tfliteModel, options);

            // Load the image and preprocess it
            Bitmap bitmap = BitmapFactory.decodeFile(imagePath);
            // Perform any necessary preprocessing (e.g., resizing, normalization)

            // Perform inference using the model
            // Example: Run inference on the preprocessed image
            // Output the detected objects as a list of maps
            List<Map<String, Object>> detections = new ArrayList<>();
            // Perform inference and add the detected objects to the list

            return detections;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
