// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `register`

class AsPlayLib {
  final String thisId;
  final String thisUrl;

  const AsPlayLib({
    required this.thisId,
    required this.thisUrl,
  });

  @override
  int get hashCode => thisId.hashCode ^ thisUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsPlayLib &&
          runtimeType == other.runtimeType &&
          thisId == other.thisId &&
          thisUrl == other.thisUrl;
}
