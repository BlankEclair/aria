// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.39.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'aiscript/api.dart';
import 'aiscript/play.dart';
import 'aiscript/ui.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AiScript>>
abstract class AiScript implements RustOpaqueInterface {
  Future<void> abort();

  Future<void> exec({required String input});

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<AiScript> newInstance(
          {required FutureOr<String> Function(String) read,
          required FutureOr<void> Function(String) write,
          AsApiLib? api,
          AsUiLib? ui,
          AsPlayLib? play}) =>
      RustLib.instance.api.crateApiAiscriptAiScriptNew(
          read: read, write: write, api: api, ui: ui, play: play);
}
