import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app/config_manager.dart';

class PermissionSupport {
  static Future<bool> requestPermissions(BuildContext context, Iterable<Permission> permissions,
      {bool gotoAppSettings = true}) async {
    for (Permission permission in permissions) {
      if (await requestPermission(context, permission, gotoAppSettings: gotoAppSettings)) {
        continue;
      }
      return false;
    }
    return true;
  }

  static Future<bool> requestPermission(BuildContext context, Permission permission,
      {bool gotoAppSettings = true}) async {
    var permissionStatus = await permission.request();
    if (permissionStatus.isGranted) {
      return true;
    } else if (gotoAppSettings && (permissionStatus.isPermanentlyDenied || permissionStatus.isRestricted)) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Align(alignment: Alignment.center, child: Text("${permissionName(permission)}权限申请")),
          content: Text('${BaseConfig.appName}需要获取${permissionName(permission)}权限才能正常提供该功能，'
              '请在"设置-应用-${BaseConfig.appName}-权限管理"中开启${permissionName(permission)}权限。'),
          actions: <Widget>[
            TextButton(
              child: Text("不用了"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.grey[800]),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("去设置"),
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
            ),
          ],
        ),
      );
    }
    return false;
  }

  static Future<bool> requestLocationService(BuildContext context, {bool gotoSettings = true}) async {
    if (await Permission.location.serviceStatus.isEnabled) {
      return true;
    } else if (gotoSettings) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Align(alignment: Alignment.center, child: Text("系统定位服务不可用")),
          content: Text('${BaseConfig.appName}需要使用系统定位服务才能正常提供该功能，请在系统"位置设置"中开启定位服务。'),
          actions: <Widget>[
            TextButton(
              child: Text("不用了"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.grey[800]),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("去设置"),
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
            ),
          ],
        ),
      );
    }
    return false;
  }

  static String permissionName(Permission permission) {
    if (Permission.bluetooth.value == permission.value) {
      return "蓝牙";
    } else if (Permission.calendar.value == permission.value) {
      return "日历";
    } else if (Permission.camera.value == permission.value) {
      return "相机";
    } else if (Permission.contacts.value == permission.value) {
      return "通讯录";
    } else if (Permission.location.value == permission.value ||
        Permission.locationAlways.value == permission.value ||
        Permission.locationWhenInUse.value == permission.value) {
      return "定位";
    } else if (Permission.microphone.value == permission.value) {
      return "麦克风";
    } else if (Permission.notification.value == permission.value) {
      return "通知";
    } else if (Permission.phone.value == permission.value) {
      return "电话";
    } else if (Permission.photos.value == permission.value || Permission.photosAddOnly.value == permission.value) {
      return "相册";
    } else if (Permission.reminders.value == permission.value) {
      return "提醒";
    } else if (Permission.sensors.value == permission.value) {
      return "传感器";
    } else if (Permission.sms.value == permission.value) {
      return "短信";
    } else if (Permission.storage.value == permission.value) {
      return "存储";
    }
    return "";
  }

  PermissionSupport._();
}
