import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
  
  @override
  Future<ConnectivityResult> get connectivityResult async {
	final List<ConnectivityResult> connectivityResultList = await connectivity.checkConnectivity();
	return connectivityResultList.first; // Assuming you're interested in the first result
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
    connectivity.onConnectivityChanged.asyncMap(
      (List<ConnectivityResult> results) => results.first,
    );
}
