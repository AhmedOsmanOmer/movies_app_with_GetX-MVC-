import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  bool isOnline = true;

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();
      if (status == ConnectivityResult.none) {
        isOnline = false;
        update();
      } else {
        isOnline = true;
        update();
      }
    } on PlatformException catch (e) {
      print("PlatformException:" + e.toString());
    }
  }

  startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        isOnline = false;
        update();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          isOnline = isConnected;
          update();
        });
      }
    });
  }

  Future<bool> _updateConnectionStatus() async {
    bool _isConnected = false;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      }
    } on SocketException catch (_) {
      _isConnected = false;
    }
    return _isConnected;
  }
}
