package com.scubatx.mvpui

import android.Manifest
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothServerSocket
import android.bluetooth.BluetoothSocket
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import java.io.IOException

class BluetoothHandler(private val activity: MainActivity) {

    @RequiresApi(Build.VERSION_CODES.M)
    val bluetoothManager: BluetoothManager = activity.getSystemService(BluetoothManager::class.java)

    // Get Bluetooth adaptor
    @RequiresApi(Build.VERSION_CODES.M)
    val bluetoothAdapter: BluetoothAdapter? = bluetoothManager.adapter

    // Bluetooth prompt launcher
    private lateinit var enableBluetoothLauncher: ActivityResultLauncher<Intent>

    // Request Permission launcher
    private lateinit var requestPermissionLauncher: ActivityResultLauncher<Array<String>>

    // Registeration code for the enable bluetooth user prompt
    @RequiresApi(Build.VERSION_CODES.M)
    fun registerBluetoothEnableAction() {
        // Register Activity launchers for enable BT
        Log.d(activity.TAG, "registering BT enable")
        // Get the bluetooth manager
        val bluetoothManager: BluetoothManager =
            activity.getSystemService(BluetoothManager::class.java)
        // Get Bluetooth adaptor
        val bluetoothAdapter: BluetoothAdapter? = bluetoothManager.adapter
        if (bluetoothAdapter != null) {
            // Setup enable bluetooth prompt to be handled by the system
            enableBluetoothLauncher = activity.registerForActivityResult(
                ActivityResultContracts.StartActivityForResult()
            ) { result: ActivityResult ->
                // If enabled, connect bluetooth
                if (result.resultCode == Activity.RESULT_OK) {
                    Log.i(activity.TAG, "bluetooth enabled")
                    Toast.makeText(activity, "Bluetooth Enabled", Toast.LENGTH_SHORT).show()

                    //connectBluetooth(bluetoothAdapter, activity.remoteDeviceAddress)
                } else {
                    //TODO Close Gracefully?
                    Toast.makeText(activity, "Bluetooth is required to use app", Toast.LENGTH_LONG)
                        .show()
                }
            }
        }
    }

    // Registration code for the bluetooth permissions prompt
    @RequiresApi(Build.VERSION_CODES.S)
    fun registerBluetoothPermissionAction() {
        // Register Activity launchers for enable BT
        Log.d(activity.TAG, "registering BT permission request")
        requestPermissionLauncher = activity.registerForActivityResult(
            ActivityResultContracts.RequestMultiplePermissions()
        ) {
            // All permission granted
                isGranted: Map<String, Boolean> ->
            if (isGranted.all { it.value }) {
                Log.i(activity.TAG, "bluetooth permission request APPROVED")
                // Retry to connect bluetooth if user grants permissions
                setupBluetooth()

                // Some all any permission denied
            } else {
                // If can get permissions exit app.
                // TODO A more graceful exit? or perform some other tasks?
                Log.e(activity.TAG, "bluetooth permission request DENIED")
                if (!ActivityCompat.shouldShowRequestPermissionRationale(
                        activity,
                        Manifest.permission.BLUETOOTH_ADMIN
                    )
                ) {
                    Log.e(activity.TAG, "bluetooth permission request SUPPRESSED")
                }
                // close app.
                //this.finishAffinity();
                Toast.makeText(activity, "Bluetooth is required to use app", Toast.LENGTH_LONG)
                    .show()
            }
        }
    }

    // Ensures that app has appropriate permissions to use bluetooth and setups up connection to the
    // device
    // RequiresAPI version 31 or higher (at least Android 12) due to changes in BT permissions
    @RequiresApi(Build.VERSION_CODES.S)
    fun setupBluetooth(): Int {
        if (bluetoothAdapter != null) {
            // Check if App has BT permissions to connect Bluetooth
            if (ActivityCompat.checkSelfPermission(
                    activity,
                    Manifest.permission.BLUETOOTH_CONNECT
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                // If it does not request that user allows the permission to turn on bluetooth
                // see: https://developer.android.com/develop/connectivity/bluetooth/bt-permissions
                val permissions: Array<String> = arrayOf(
                    Manifest.permission.BLUETOOTH_CONNECT, // If your app communicates with already-paired Bluetooth devices,
                    Manifest.permission.BLUETOOTH_SCAN // If your app looks for Bluetooth devices, such as BLE peripherals
                )
                // Explain Purpose of permissions
                // show dialog to the user.
                // FIXME Showing of rationale dialog not working as intended.
                //  Will revisit later.
//                if (shouldShowRequestPermissionRationale(Manifest.permission.BLUETOOTH_ADMIN)){
//                    showInfoDialog(this);
//                }else {
//                }
                // Setup system to manage the permision prompt

                // request permissions
                requestPermissionLauncher.launch(permissions)

                Log.i(activity.TAG, "bluetooth permissions request")

                // TODO: Check if user has blocked permissions
                return -1
            } else {
                // If the app has BT permissions, start activity to enable the bluetooth

                // Check if bluetooth is enabled
                if (!bluetoothAdapter.isEnabled) {
                    // else create the intent to prompt user to enable bluetooth
                    val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                    // start the activity to prompt used
                    enableBluetoothLauncher.launch(enableBtIntent)
                    Log.i(activity.TAG, "bluetooth enable request")
                    return 1
                } else {
                    // DEBUG code
                    Toast.makeText(activity, "Bluetooth is already Enabled", Toast.LENGTH_SHORT)
                        .show()
                    // Establish Connection using standard Bluetooth Protocol in server/client mode
                    connectBluetooth(activity.remoteDeviceAddress, true)
                }
            }
            return -2
        } else {
            Log.e(activity.TAG, "bluetooth is not supported on this device")
            return -3
        }
    }

    //
    @RequiresApi(Build.VERSION_CODES.M)
    private fun connectBLE(address: String) {
        var bluetoothGatt: BluetoothGatt? = null
        if (bluetoothAdapter != null) {
            // Get remote device with the address
            val device: BluetoothDevice = bluetoothAdapter.getRemoteDevice("D4:36:39:6F:7F:0E")


            if (ActivityCompat.checkSelfPermission(
                    activity,
                    Manifest.permission.BLUETOOTH_CONNECT
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                Log.wtf(activity.TAG, "no Bluetooth permissions")
            } else {

                bluetoothGatt = device.connectGatt(activity, false)
            }
        }
    }


    // Connect to remote device using the standard bluetooth protocol
    // @param MAC address for the remote device
    // @param client is a boolean to indicate whether to create a socket or to listen to it
    // THIS USES THE STANDARD BLUETOOTH PROTOCOL
    @RequiresApi(Build.VERSION_CODES.M)
    private fun connectBluetooth(address: String, client: Boolean) {
        try {
            if (bluetoothAdapter != null) {

                // DEBUG Selecting between read and listen used to debug bluetooth
                //  code. Listen will occur on the remote device (PSF Device)
                if (client) {
                    // remote bluetooth device with the given address
                    val bluetoothDevice: BluetoothDevice = bluetoothAdapter.getRemoteDevice(address)
                    // temp bluetooth socket for connection
                    var temporaryBTSocket: BluetoothSocket? = null
                    // Get a BluetoothSocket for a connection with the
                    // given BluetoothDevice
                    try {
                        // Attempt to connect to the remote devices BT socket
                        temporaryBTSocket =
                            bluetoothDevice.createRfcommSocketToServiceRecord(activity.MY_UUID)

                    } catch (e: SecurityException) {
                        // User declined Bluetooth permissions
                        // Should never be the case as this method can only be called after permission have been
                        // checked/granted
                        Log.wtf(activity.TAG, "no Bluetooth permissions", e)
                    } catch (e: IOException) {
                        // Failed to create java socket for connection from given mac address
                        Log.e(activity.TAG, "create() failed", e)
                    }

                    // set the bluetooth socket to use to the temporaryBTSocket
                    // bluetooth socket connection to remote bt device
                    val bluetoothSocket: BluetoothSocket? = temporaryBTSocket
                    // Check if the permission to connect bluetooth is granted

                    // Connected to valid BT device
                    if (ActivityCompat.checkSelfPermission(
                            activity,
                            Manifest.permission.BLUETOOTH_CONNECT
                        ) != PackageManager.PERMISSION_GRANTED
                    ) {
                        // This method should never be called before setupBluetooth, which establishes
                        // the permissions
                        Log.wtf(activity.TAG, "invalid permission for bluetooth connection")
                    } else {
                        try {
                            // Cancel the bluetooth discovery as its is a heavyweight process and will slow the connection down
                            // see: https://developer.android.com/reference/android/bluetooth/BluetoothSocket#connect()
                            bluetoothAdapter.cancelDiscovery()
                            // connect to device on the bluetooth socket
                            bluetoothSocket?.connect()
                            Log.i(activity.TAG, "connected to remote device")
                            Toast.makeText(
                                activity,
                                "Connected to remoted device",
                                Toast.LENGTH_LONG
                            )
                                .show()

                        } catch (e: IOException) {
                            // Bluetooth failed to connect
                            Log.i(activity.TAG, "failed to connect to remote device")
                        }
                    }
                } else {
                    var serverBTSocket: BluetoothServerSocket? = null

                    // Get a BluetoothSocket for a connection with the
                    // given BluetoothDevice
                    try {
                        // Attempt to connect to the remote devices BT socket
                        serverBTSocket =
                            bluetoothAdapter.listenUsingRfcommWithServiceRecord(
                                "test",
                                activity.MY_UUID
                            )

                        serverBTSocket.accept()
                    } catch (e: SecurityException) {
                        // User declined Bluetooth permissions
                        // Should never be the case as this method can only be called after permission have been
                        // checked/granted
                        Log.wtf(activity.TAG, "no Bluetooth permissions", e)
                    } catch (e: IOException) {
                        // Failed to create java socket for connection from given mac address
                        Log.e(activity.TAG, "create() failed", e)
                    }
                }
            }
        } catch (e: IllegalArgumentException) {
            // The given bluetooth device address is invalid
            Log.e(activity.TAG, "invalid bluetooth device address", e)
        }
    }

// Code to display info dialog to use re BT permissions..... Doesn't quite work
//    private fun showInfoDialog(context: Context) {
//        val permissions : Array<String> = arrayOf(
//            Manifest.permission.BLUETOOTH_CONNECT, // If your app communicates with already-paired Bluetooth devices,
//            Manifest.permission.BLUETOOTH_SCAN, // If your app looks for Bluetooth devices, such as BLE peripherals
//            Manifest.permission.BLUETOOTH_ADMIN) // If you want your app to initiate device discovery or manipulate Bluetooth settings
//
//        val alertDialog = AlertDialog.Builder(context)
//
//        alertDialog.apply {
//            //setIcon(R.drawable.ic_hello)
//            setTitle("Bluetooth required")
//            setMessage("Bluetooth is required to connect to the device")
//            setPositiveButton("Ok") { _: DialogInterface?, _: Int ->
//                requestPermissions(permissions,REQUEST_BT_PERMISSIONS)
//            }
//        }.create().show()
//    }

}
