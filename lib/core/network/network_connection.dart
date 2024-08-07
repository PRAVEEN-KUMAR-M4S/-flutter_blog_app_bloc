import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> isConnected();
}

class ConnectionCheckerImp implements ConnectionChecker {
  @override
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||connectivityResult == ConnectivityResult.wifi  ) {
      return true;
    }
    return false;
  }
}
