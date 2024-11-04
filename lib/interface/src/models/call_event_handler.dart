import 'package:flutter_callkeep/interface/src/models/voip_token_event.dart';

import 'audio_session_toggle_event.dart';
import 'call_event.dart';
import 'call_group_toggle_event.dart';
import 'callkeep_base_event.dart';
import 'callkeep_event_type.dart';
import 'dmtf_toggle_event.dart';
import 'hold_toggle_event.dart';
import 'mute_toggle_event.dart';

typedef CallEventCallback = void Function(CallEvent callEvent);

class CallEventHandler {
  final CallEventCallback? onCallIncoming;
  final CallEventCallback? onCallStarted;
  final CallEventCallback? onCallAccepted;
  final CallEventCallback? onCallDeclined;
  final CallEventCallback? onCallEnded;
  final CallEventCallback? onCallTimedOut;
  final CallEventCallback? onCallMissed;
  final void Function(HoldToggleEvent holdToggleEvent)? onHoldToggled;
  final void Function(MuteToggleEvent muteToggleEvent)? onMuteToggled;
  final void Function(DmtfToggleEvent dmtfToggleEvent)? onDmtfToggled;
  final void Function(CallGroupToggleEvent callGroupToggleEvent)?
      onCallGroupToggled;
  final void Function(AudioSessionToggleEvent audioSessionToggleEvent)?
      onAudioSessionToggled;
  final void Function(VoipTokenEvent voipTokenEvent)? onVoipTokenUpdated;

  CallEventHandler({
    this.onCallIncoming,
    this.onCallStarted,
    this.onCallAccepted,
    this.onCallDeclined,
    this.onCallEnded,
    this.onCallTimedOut,
    this.onCallMissed,
    this.onHoldToggled,
    this.onMuteToggled,
    this.onDmtfToggled,
    this.onCallGroupToggled,
    this.onAudioSessionToggled,
    this.onVoipTokenUpdated,
  });

  void handle(CallKeepBaseEvent event, CallKeepEventType type) {
    switch (type) {
      case CallKeepEventType.devicePushTokenUpdated:
        onVoipTokenUpdated?.call(event as VoipTokenEvent);
        break;
      case CallKeepEventType.audioSessionToggled:
        onAudioSessionToggled?.call(event as AudioSessionToggleEvent);
        break;
      case CallKeepEventType.callGroupToggled:
        onCallGroupToggled?.call(event as CallGroupToggleEvent);
        break;
      case CallKeepEventType.dmtfToggled:
        onDmtfToggled?.call(event as DmtfToggleEvent);
        break;
      case CallKeepEventType.muteToggled:
        onMuteToggled?.call(event as MuteToggleEvent);
        break;
      case CallKeepEventType.holdToggled:
        onHoldToggled?.call(event as HoldToggleEvent);
        break;
      case CallKeepEventType.missedCallback:
        onCallMissed?.call(event as CallEvent);
        break;
      case CallKeepEventType.callTimedOut:
        onCallTimedOut?.call(event as CallEvent);
        break;
      case CallKeepEventType.callEnded:
        onCallEnded?.call(event as CallEvent);
        break;
      case CallKeepEventType.callDeclined:
        onCallDeclined?.call(event as CallEvent);
        break;
      case CallKeepEventType.callAccepted:
        onCallAccepted?.call(event as CallEvent);
        break;
      case CallKeepEventType.callStarted:
        onCallStarted?.call(event as CallEvent);
        break;
      case CallKeepEventType.callIncoming:
        onCallIncoming?.call(event as CallEvent);
        break;
    }
  }
}
