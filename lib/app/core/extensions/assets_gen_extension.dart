import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/core/helpers/assets.gen.dart';

extension AssetsGenExtension on BuildContext {
  $AssetsEnvGen get envAssets => const $AssetsEnvGen();

  $AssetsIconsGen get iconAssets => const $AssetsIconsGen();

  $AssetsImagesGen get imageAssets => const $AssetsImagesGen();

  // $AssetsAnimationsGen get animationAssets => const $AssetsAnimationsGen();
  // $AssetsFontsGen get fontAssets => const $AssetsFontsGen();
}
