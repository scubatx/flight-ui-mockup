package com.scubatx.mvpui


import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.annotation.RequiresApi
import com.scubatx.mvpui.types.UIStruct
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.UUID


class MainActivity : FlutterFragmentActivity() {
    // Channel used to communicate with the flutter
    private val CHANNEL = "com.scubatx.mvpui/update"

    // App UUID used for bluetooth
    val MY_UUID: UUID = UUID.fromString("5fc03087-d265-11e7-b8c6-83e29cd24f4c")

    // Used for logging
    val TAG: String = "MainActivity"

    // MAC address from remote device to connect to
    var remoteDeviceAddress: String = "DA:4C:10:DE:17:01"

    // Bluetooth Handler
    private lateinit var bluetoothHandler: BluetoothHandler


    @RequiresApi(Build.VERSION_CODES.S)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bluetoothHandler = BluetoothHandler(this)
        // Register bluetooth permission requests
        bluetoothHandler.registerBluetoothPermissionAction()

        // Register bluetooth enable requests
        bluetoothHandler.registerBluetoothEnableAction()
    }

    // Subscribing the android backend to the flutter channel and handling calls on the given channel
    // Currently Handles
    // - UI Update
    // - Bluetooth Connection
    @RequiresApi(Build.VERSION_CODES.S)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Handler for backend method calls
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Match flutter call to local android method
                call, result ->
            // Call to get the latest UI Struct
            when (call.method) {
                "getUIStruct" -> {
                    // Create new UI Struct
                    // TBD: Replace with bluetooth transmitted struct
                    Log.d(TAG, "updating UI")
                    val obj = UIStruct()
                    // Returns the UIStruct as a Map, that is converted to Json to be passed to the
                    // flutter. It is then decoded from JSON to become the UI model
                    result.success(obj.toMap())
                }
                "setupBluetooth" -> {
                    //setup the bluetooth connection
                    Log.d(TAG, "setting up bluetooth")
                    val r = bluetoothHandler.setupBluetooth()
                    result.success(r)
                }
                else -> {
                    // No valid call found
                    Log.e(TAG, "invalid command")
                    result.notImplemented()
                }
            }
        }

    }

}


