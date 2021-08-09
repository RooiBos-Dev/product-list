import 'package:flutter/material.dart';

class StandardColour extends Color {
  const StandardColour(int value) : super(value);
}

class Colours {
  static const int _primaryColour = 0xFF374059;
  static const StandardColour primary = const StandardColour(_primaryColour);
  static const StandardColour blue = primary;
  static const StandardColour lightgreen = const StandardColour(0xFF9CB932);
  static const StandardColour intermediateblue =
      const StandardColour(0xFF454F63);
  static const StandardColour lightGreyMagenta =
      const StandardColour(0xFFBCBFC5);
  static const StandardColour veryLighGrey = const StandardColour(0xFFEDEDED);
  static const StandardColour darkerGrey = const StandardColour(0xFF848484);
  static const StandardColour blueishGrey = const StandardColour(0xFF415569);
  static const StandardColour verydarkblue = const StandardColour(0xFF242c47);
  static const StandardColour darkblue = const StandardColour(0xFF161836);
  static const StandardColour grey = const StandardColour(0x424242);
  static const StandardColour lightgrey = const StandardColour(0xFFEFEFF5);
  static const StandardColour intermediateGrey =
      const StandardColour(0xFFB4B4B4);
  static const StandardColour darkGrayishRed = const StandardColour(0xFFA8A4A4);
  static const StandardColour darkGrayishBlue =
      const StandardColour(0xFF728190);
  static const StandardColour grayishBlue = const StandardColour(0xFF708091);
  static const StandardColour textBoxGrey = const StandardColour(0xFFF2F2F2);
  static const StandardColour textBoxFilledGrey =
      const StandardColour(0xFF757575);

  static const StandardColour darkgrey = const StandardColour(0xFF454F63);
  static const StandardColour lightishGrey = const StandardColour(0xFF707070);
  static const StandardColour black = const StandardColour(0xFF000000);
  static const StandardColour white = const StandardColour(0xFFFFFFFF);
  static const StandardColour red = const StandardColour(0xFFF61A56);
  static const StandardColour orange = const StandardColour(0xFFFF7F00);
  static const StandardColour yellow = const StandardColour(0xFFFFDD00);
  static const StandardColour green = const StandardColour(0xFF9CB932);

  /// Primary Pallet
  static const MaterialColor pallet = const MaterialColor(_primaryColour, {
    50: const StandardColour(0xFFE1F0E8),
    100: const StandardColour(0xFFB5DAC6),
    200: const StandardColour(0xFF84C2A1),
    300: const StandardColour(0xFF53A97B),
    400: const StandardColour(0xFF2E965E),
    500: const StandardColour(_primaryColour),
    600: const StandardColour(0xFF087C3C),
    700: const StandardColour(0xFF067133),
    800: const StandardColour(0xFF05672B),
    900: const StandardColour(0xFF02541D),
  });
}
