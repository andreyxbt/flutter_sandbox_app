import 'package:flutter/material.dart';
import '../widgets/outlined_button.dart';

class ContentCard extends StatefulWidget {
  final String headline;
  final String subhead;
  final String title;
  final String subtitle;
  final String content;
  final String? imageUrl;
  final String? assetPath;
  final VoidCallback? onButton1Pressed;
  final VoidCallback? onButton2Pressed;

  const ContentCard({
    super.key,
    this.headline = 'Headline',
    this.subhead = 'Subhead',
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.content = 'Please add your content here. Keep it short and simple. And smile :)',
    this.imageUrl,
    this.assetPath,
    this.onButton1Pressed,
    this.onButton2Pressed,
  }) : assert(imageUrl == null || assetPath == null, 'Cannot provide both imageUrl and assetPath');

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool _isAssetLoading = false;
  ImageProvider? _assetImage;

  @override
  void initState() {
    super.initState();
    _loadAssetImage();
  }

  @override
  void didUpdateWidget(ContentCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _loadAssetImage();
    }
  }

  Future<void> _loadAssetImage() async {
    if (widget.assetPath == null) {
      setState(() {
        _assetImage = null;
        _isAssetLoading = false;
      });
      return;
    }

    setState(() {
      _isAssetLoading = true;
    });

    final imageProvider = AssetImage(widget.assetPath!);
    await precacheImage(imageProvider, context);

    if (mounted) {
      setState(() {
        _assetImage = imageProvider;
        _isAssetLoading = false;
      });
    }
  }

  Widget _buildImage() {
    if (widget.imageUrl != null) {
      return Image.network(
        widget.imageUrl!,
        width: 600,
        height: 198,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingIndicator();
        },
      );
    } else if (widget.assetPath != null) {
      if (_isAssetLoading) {
        return _buildLoadingIndicator();
      }
      return _assetImage != null
          ? Image(
              image: _assetImage!,
              width: 600,
              height: 198,
              fit: BoxFit.cover,
            )
          : _buildPlaceholder();
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildLoadingIndicator() {
    return Container(
      width: 600,
      height: 198,
      color: const Color(0xFFDEDEDE),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 600,
      height: 198,
      color: const Color(0xFFDEDEDE),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDEDEDE),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.headline,
                      style: const TextStyle(
                        fontFamily: 'Source Code Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.subhead,
                      style: const TextStyle(
                        fontFamily: 'Source Code Pro',
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDEDEDE),
                  ),
                ),
              ],
            ),
          ),
          _buildImage(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3C3C43),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 14,
                    color: Color(0xFF3C3C43),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.content,
                  style: const TextStyle(
                    fontFamily: 'Source Code Pro',
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ContentCardButton(
                      text: 'Button 2',
                      onPressed: widget.onButton2Pressed,
                      isPrimary: false,
                    ),
                    const SizedBox(width: 16),
                    ContentCardButton(
                      text: 'Button 1',
                      onPressed: widget.onButton1Pressed,
                      isPrimary: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

