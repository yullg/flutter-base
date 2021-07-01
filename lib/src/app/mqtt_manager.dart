import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../logger/system_logger.dart';
import 'base_config.dart';

class MqttManager {
  static MqttServerClient? _mqttServerClient;

  static Future<void> initialize() async {
    try {
      if (!(BaseConfig.mqtt_enabled ?? false)) return;
      MqttServerClient client = MqttServerClient.withPort(
          BaseConfig.mqtt_server!, BaseConfig.mqtt_clientIdentifier!, BaseConfig.mqtt_port ?? MqttClientConstants.defaultMqttPort);
      client.logging(on: BaseConfig.mqtt_logging ?? BaseConfig.debug ?? false);
      if (BaseConfig.mqtt_keepAlivePeriod != null) {
        client.keepAlivePeriod = BaseConfig.mqtt_keepAlivePeriod!;
      }
      if (true) {
        client.secure = true;
        var context = SecurityContext.defaultContext;
        context.setTrustedCertificatesBytes(BaseConfig.mqtt_certificate!);
        client.securityContext = context;
      }
      final connMess = MqttConnectMessage()
          .withClientIdentifier(BaseConfig.mqtt_clientIdentifier!)
          .withWillTopic('willtopic') // If you set this you must set a will message
          .withWillMessage('My Will message')
          .startClean() // Non persistent session for testing
          .withWillQos(MqttQos.atLeastOnce);
      client.connectionMessage = connMess;
      client.onConnected = () {
        print("MqttServerClient onConnected");
        client.subscribe("starter/#", MqttQos.atMostOnce);
        client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
          final recMess = c![0].payload as MqttPublishMessage;
          final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message!);
          print('EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
          print('');
        });
      };
      client.onDisconnected = () {
        print("MqttServerClient onDisconnected");
      };
      client.pongCallback = () {
        print("MqttServerClient pongCallback");
      };
      client.connect(BaseConfig.mqtt_username, BaseConfig.mqtt_password).then((value) {
        print("------>$value");
      }).catchError((e) {
        SystemLogger.log("----->connect", e);
      });
      _mqttServerClient = client;
      print("-------->end");
    } catch (e, s) {
      SystemLogger.log("message", e, s);
      print("-------->error");
    }
  }

  static Future<void> destroy() async {
    _mqttServerClient = null;
  }

  MqttManager._();
}
