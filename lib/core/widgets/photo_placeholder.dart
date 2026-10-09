import 'package:flutter/material.dart';

/// A scenic stand-in for a photo.
///
/// Pass [image] when a bundled asset should fill the frame. [darkOverlay]
/// adds a top-to-bottom scrim so light text stays readable.
class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({
    super.key,
    required this.icon,
    this.height = 180,
    this.width,
    this.borderRadius = 20,
    this.colors,
    this.image,
    this.darkOverlay = false,
  });

  final IconData icon;
  final double height;
  final double? width;
  final double borderRadius;
  final List<Color>? colors;
  final ImageProvider? image;
  final bool darkOverlay;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final gradientColors =
        colors ?? [scheme.primaryContainer, scheme.secondaryContainer];
    final iconSize = height <= 72 ? 22.0 : 48.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            if (image != null)
              Image(
                image: image!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    _IconMark(icon: icon, size: iconSize),
              ),
            if (darkOverlay)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x33000000), Color(0xCC000000)],
                  ),
                ),
              ),
            if (image == null) _IconMark(icon: icon, size: iconSize),
          ],
        ),
      ),
    );
  }
}

class _IconMark extends StatelessWidget {
  const _IconMark({required this.icon, required this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(icon, size: size, color: Colors.white.withValues(alpha: 0.9)),
    );
  }
}
