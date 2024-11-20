package com.scubatx.mvpui.types

public class UIStruct(val  active_channels: Int = 3,
               val  flow_1: Double = 25.5,
               val  flow_2: Double = 25.3,
               val  flow_3: Double = 24.5,
               val  pressure_1: Double = 65.8,
               val  pressure_2: Double = 67.8,
               val  pressure_3: Double = 67.1,
               val  temperature_format: Int = 0,
               val  temperature_target: Int = 4,
               val  temperature_bowl_latched: Double = 6.4,
               val  temperature_bowl: Double = 4.2,
               val  time: Long = 44339,
               val  organ_type: Int = 1,
               val  localisation: Int = 0,
               val  battery_percentage: Int = 98,
               val  bluetooth_status: Int = 2,
               val  alerts_alarms: Long = 288230376151711743,//551903297536,
               val  alarm_silenced: Boolean = true,
               val  lid_open: Boolean = true,
               val  device_status: Int = 10,
               val  alarm_silence_button: Int = 0,
               val  persufflation_button: Int = 2,
               val  ui_elements_bitmask: Int = 12250,
               val  battery_charging: Int = 1
){

    fun toMap() : HashMap<String, Any>{
        return hashMapOf(
            "active_channels" to active_channels,
            "flow_1" to flow_1,
            "flow_2" to flow_2,
            "flow_3" to flow_3,
            "pressure_1" to pressure_1,
            "pressure_2" to pressure_2,
            "pressure_3" to pressure_3,
            "temperature_format" to temperature_format,
            "temperature_target" to temperature_target,
            "temperature_bowl_latched" to temperature_bowl_latched,
            "temperature_bowl" to temperature_bowl,
            "time" to time,
            "organ_type" to  organ_type,
            "localisation" to localisation,
            "battery_percentage" to battery_percentage,
            "bluetooth_status" to bluetooth_status,
            "alerts_alarms" to alerts_alarms,
            "alarm_silenced" to alarm_silenced,
            "lid_open" to lid_open,
            "device_status" to device_status,
            "alarm_silence_button" to alarm_silence_button,
            "persufflation_button" to persufflation_button,
            "ui_elements_bitmask" to ui_elements_bitmask,
            "battery_charging" to battery_charging
        );
    }
}