package com.scubatx.mvpui.bluetooth

import android.app.Service
import android.bluetooth.BluetoothAdapter
import android.content.Intent
import android.os.Binder
import android.os.IBinder
import android.util.Log

class BluetoothLeService : Service() {

    private var bluetoothAdapter: BluetoothAdapter? = null

    private val binder = LocalBinder()

    private val TAG = "BluetoothLeService"

    override fun onBind(intent: Intent): IBinder {
        return binder
    }
    fun initialize(): Boolean {
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        if (bluetoothAdapter == null) {
            Log.e(TAG, "Unable to obtain a BluetoothAdapter.")
            return false
        }
        return true
    }

    inner class LocalBinder : Binder() {
        fun getService() : BluetoothLeService {
            return this@BluetoothLeService
        }
    }

}