import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/identify.dart';
import 'package:flutter/foundation.dart';
import 'package:fast_cli_demo/app/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:fast_cli_demo/features/analytics/services/fast_analytics_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

@amplitude
@Singleton(as: FastAnalyticsService)
class AmplitudeAnalyticsService extends FastAnalyticsService {
  final Amplitude amplitude = Amplitude.getInstance();

  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {
    amplitude.logEvent(eventName, eventProperties: eventProperties);
  }

  @override
  Future<void> initialize() async {
    String? apiKey = const String.fromEnvironment('AMPLITUDE_API_KEY');

    if (apiKey != '') {
      await amplitude.init(const String.fromEnvironment('AMPLITUDE_API_KEY'));
    }

    if (kIsWeb) {
      PackageInfo info = await PackageInfo.fromPlatform();
      updateVersionId(info.version);
    }
  }

  @override
  void updateUserId(String? userId) {
    amplitude.setUserId(userId);
  }

  @override
  void updateUserProperties(Map<String, dynamic> userProperties,
      {bool setOnce = false}) {
    if (setOnce) {
      final Identify identify = Identify();
      userProperties.forEach((key, value) {
        identify.setOnce(key, value);
      });
      amplitude.identify(identify);
      return;
    } else {
      amplitude.setUserProperties(userProperties);
    }
  }

  @override
  void updateVersionId(String? versionId) {
    if (kIsWeb) {
      amplitude.setUserProperties({'app_version': versionId});
    }
  }
}
