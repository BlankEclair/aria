import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../i18n/strings.g.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

const minFontSize = 8.0;
const defaultFontSize = 14.0;
const maxFontSize = 24.0;
const minReactionsDisplayScale = 0.1;
const maxReactionsDisplayScale = 3.0;
const minNoteFooterScale = 0.5;
const maxNoteFooterScale = 2.0;
const minEmojiPickerScale = 0.1;
const maxEmojiPickerScale = 3.0;

@freezed
class GeneralSettings with _$GeneralSettings {
  const factory GeneralSettings({
    // Locale
    // ignore: invalid_annotation_target
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    AppLocale? locale,

    // Note display
    @Default(true) bool collapseRenotes,
    @Default(SensitiveMediaDisplay.respect) SensitiveMediaDisplay sensitive,
    @Default(false) bool highlightSensitiveMedia,
    @Default(true) bool animatedMfm,
    @Default(true) bool advancedMfm,
    @Default(false) bool showReactionsCount,
    @Default(false) bool loadRawImages,
    @Default(EmojiStyle.twemoji) EmojiStyle emojiStyle,
    @Default(false) bool showNoteCreatedAt,
    @Default(true) bool showAvatarsInNote,
    @Default(true) bool showAvatarsInSubNote,
    @Default(false) bool squareAvatars,
    @Default(true) bool showAvatarDecorations,
    @Default(false) bool showLikeButtonInNoteFooter,
    @Default(false) bool showClipButtonInNoteFooter,
    @Default(false) bool showTranslateButtonInNoteFooter,
    @Default(true) bool showNoteReactionsViewer,
    @Default(false) bool showSubNoteReactionsViewer,
    @Default(true) bool showNoteFooter,
    @Default(false) bool showSubNoteFooter,
    String? fontFamily,
    @Default(defaultFontSize) double fontSize,
    @Default(1.0) double reactionsDisplayScale,
    @Default(true) bool limitWidthOfReaction,
    @Default(1.0) double noteFooterScale,

    // Emoji picker
    @Default(false) bool emojiPickerUseDialog,
    @Default(1.0) double emojiPickerScale,
    @Default(true) bool emojiPickerAutofocus,
    @Default(false) bool emojiPickerKeepOpen,

    // Appearance
    @Default(false) bool dataSaverMedia,
    @Default(false) bool dataSaverUrlPreview,
    @Default(false) bool disableDataSaverWhenOnWifi,
    @Default(false) bool forceShowAds,
    @Default(false) bool useGroupedNotifications,
    @Default(false) bool showTimelineTabBarOnBottom,
    @Default(true) bool showTimelineLastViewedAt,
    @Default(false) bool vibrateNote,
    @Default(false) bool vibrateNotification,

    // Behavior
    @Default(true) bool enableInfiniteScroll,
    @Default(false) bool keepScreenOn,
    @Default(true) bool enableHorizontalSwipe,
    @Default(false) bool openSensitiveMediaOnDoubleTap,
    @Default(NoteActionType.expand) NoteActionType noteTapAction,
    @Default(NoteActionType.menu) NoteActionType noteDoubleTapAction,
    @Default(NoteActionType.reaction) NoteActionType noteLongPressAction,
    @Default(true) bool confirmBeforePost,
    @Default(true) bool confirmBeforeReact,
    @Default(true) bool confirmBeforeFollow,

    // Theme
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default('a58a0abb-ff8c-476a-8dec-0ad7837e7e96') String lightThemeId,
    @Default('66e7e5a9-cd43-42cd-837d-12f47841fa34') String darkThemeId,
  }) = _GeneralSettings;

  factory GeneralSettings.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingsFromJson(json);
}

enum SensitiveMediaDisplay {
  respect,
  ignore,
  force,
}

enum EmojiStyle {
  native,
  twemoji,
}

enum NoteActionType {
  none,
  expand,
  menu,
  reaction,
}
