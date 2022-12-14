import 'package:flutter/cupertino.dart';

enum DeviceType { phone, tablet }

class DeviceDetector {
  static DeviceType getDeviceType(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return DeviceType.tablet;
    }
    return DeviceType.phone;
  }
}