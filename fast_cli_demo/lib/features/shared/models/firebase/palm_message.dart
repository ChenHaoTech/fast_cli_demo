import 'package:fast_cli_demo/features/shared/models/firebase/palm_response_status.dart';
import 'package:fast_cli_demo/features/shared/models/firebase/palm_safety_metadata.dart';

class PalmMessage {
  final PalmSafetyMetadata? safetyMetadata;

  final PalmResponseStatus? status;

  PalmMessage({this.safetyMetadata, this.status});
}
