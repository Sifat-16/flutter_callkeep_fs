import 'package:flutter_callkeep/interface/src/models/voip_token_event.dart';

import 'audio_session_toggle_event.dart';
import 'call_event.dart';
import 'call_group_toggle_event.dart';
import 'callkeep_base_event.dart';
import 'callkeep_event_type.dart';
import 'dmtf_toggle_event.dart';
import 'hold_toggle_event.dart';
import 'mute_toggle_event.dart';

/// A mapper class to map the event data to the respective event class
class CallKeepEventMapper {
  static ({
    CallKeepBaseEvent event,
    CallKeepEventType type,
  }) eventFromData(Map data) {
    try {
      final eventType = callKeepEventTypeFromName(data['event']);
      final body = Map<String, dynamic>.from(data['body']);
      late final CallKeepBaseEvent event;
      switch (eventType) {
        case CallKeepEventType.callIncoming:
        case CallKeepEventType.callStarted:
        case CallKeepEventType.callAccepted:
        case CallKeepEventType.callDeclined:
        case CallKeepEventType.callEnded:
        case CallKeepEventType.callTimedOut:
        case CallKeepEventType.missedCallback:
          event = CallEvent.fromMap(body);
          break;
        case CallKeepEventType.holdToggled:
          event = HoldToggleEvent.fromMap(body);
          break;
        case CallKeepEventType.muteToggled:
          event = MuteToggleEvent.fromMap(body);
          break;
        case CallKeepEventType.dmtfToggled:
          event = DmtfToggleEvent.fromMap(body);
          break;
        case CallKeepEventType.callGroupToggled:
          event = CallGroupToggleEvent.fromMap(body);
          break;
        case CallKeepEventType.audioSessionToggled:
          event = AudioSessionToggleEvent.fromMap(body);
          break;
        case CallKeepEventType.devicePushTokenUpdated:
          event = VoipTokenEvent.fromMap(body);
          break;
      }
      return (event: event, type: eventType);
    } catch (e) {
      rethrow;
    }
  }
}
