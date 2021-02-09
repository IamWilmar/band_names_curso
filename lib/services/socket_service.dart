import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket    get socket => this._socket;
  Function     get emit => this._socket.emit;

  SocketService(){
    this._initConfig();
  }

  void _initConfig(){
      _socket = IO.io('http://192.168.100.74:3000', {
       'transports' : ['websocket'],
       'autoConnect': true,
     });

    this._socket.onConnect((_) {
     this._serverStatus = ServerStatus.Online;
     notifyListeners();
    });

    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    //(nuevo-mensaje): asi se emite desde nodejs
    /*socket.on('nuevo-mensaje', ( payload ){
      print('nuevo mensaje: ');
      print('nombre: ' + payload['nombre']);
      print('mensaje: ' + payload['mensaje']);
    });*/

  }

}