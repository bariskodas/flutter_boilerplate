import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// [Custom Image] widget can view image from url or local cache
class CustomImage extends StatefulWidget {
  final String imageUrl;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final bool resize;
  final BoxFit? fit;
  final Alignment alignment;
  final Widget? errorWidget;
  final bool downloadToDevice;

  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.memCacheHeight,
    this.memCacheWidth,
    this.resize = true,
    this.fit,
    this.alignment = Alignment.center,
    this.errorWidget,
    this.downloadToDevice = false,
  }) : super(key: key);

  @override
  State<CustomImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomImage> {
  final Dio _dio = Dio();
  late String cacheDir;

  @override
  void initState() {
    _setCacheDir();

    if (widget.downloadToDevice) {
      _downloadToDevice();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      alignment: widget.alignment,
      fit: widget.fit,
      memCacheHeight: widget.memCacheHeight ?? (widget.resize ? 500 : null),
      memCacheWidth: widget.memCacheWidth ?? (widget.resize ? 500 : null),
      progressIndicatorBuilder: (context, child, loadingProgress) =>
          const CircularProgressIndicator.adaptive(),
      errorWidget: (context, error, stackTrace) =>
          widget.errorWidget ?? _imageFromCache(),
    );
  }

  //* methods
  void _setCacheDir() =>
      cacheDir = GetIt.I.get<String>(instanceName: 'cacheDir');

  Future<void> _downloadToDevice() async {
    try {
      String urlPath = widget.imageUrl;

      String savePath = '$cacheDir/img/$urlPath';

      await _dio.download(urlPath, savePath);
    } catch (e) {
      // log(e.toString());
    }
  }

  Widget _imageFromCache() {
    String imagePath = '$cacheDir/img/${widget.imageUrl}';
    return Image.asset(
      imagePath,
      errorBuilder: (context, err, stackTrace) => const Icon(Icons.error),
    );
  }
}
