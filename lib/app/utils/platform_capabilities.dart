import 'package:flutter/foundation.dart';

/// HarmonyOS NEXT platform capabilities exposed by the CPF Flutter engine.
bool get isHarmonyOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.ohos;

/// Platforms where audio_service has a native system media-session backend.
bool get supportsSystemMediaSession =>
    !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || isHarmonyOS);
