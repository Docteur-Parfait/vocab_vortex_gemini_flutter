import 'package:vocab_vortex/globals/base.dart';

/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets {
  const ImageAssets._();

  static const _base = BasePaths.baseImagePath;

  static const logo = "$_base/splashLogo.png";
  static const splashBg = "$_base/splashBg.jpg";
  static const nameBg = "$_base/nameBg.jpg";
  static const homeBg = "$_base/homeBg.jpg";
  static const profil = "$_base/profil.png";
}

class SvgAssets {
  const SvgAssets._();

  static const _base = BasePaths.baseSvgPath;
}

class LottieAssets {
  const LottieAssets._();

  /// Contains all the paths of animations used across the project.
  static const _base = BasePaths.baseAnimationPath;

  static const loading = "$_base/loading.json";
  static const bingo = "$_base/bingoo.json";
  static const manette = "$_base/manette.json";
}

class IconAssets {
  const IconAssets._();

  /// Contains all the paths of animations used across the project.
  static const _base = BasePaths.baseIconPath;

  static const play = "$_base/play.png";
  static const next = "$_base/next.png";
  static const tile = "$_base/tile.png";
  static const close = "$_base/close.png";
  static const books = "$_base/books.png";
  static const nextIcon = "$_base/next_icon.png";
  static const board = "$_base/board.png";
  static const coins = "$_base/coins.png";
  static const win = "$_base/win.png";
  static const match = "$_base/match.png";
  static const lost = "$_base/lost.png";
  static const profil = "$_base/profil.png";
  static const menuTile = "$_base/menu_tile.png";
  static const help = "$_base/help.png";
  static const submit = "$_base/submit.png";
  static const networkError = "$_base/connection-error.png";
}

class MusicAssets {
  const MusicAssets._();

  static const _base = BasePaths.baseMusicPath;
}
