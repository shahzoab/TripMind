import 'package:flutter/material.dart';

import '../colors.dart';

/// Full-width pill button painted with [AppGradients.ai].
///
/// Scales to 0.98 while pressed. [leadingIcon] sits before the label, and
/// [loading] replaces the label with a spinner and ignores taps.
class AiGradientButton extends StatefulWidget {
  const AiGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.loading = false,
    this.showArrow = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final bool loading;
  final bool showArrow;

  @override
  State<AiGradientButton> createState() => _AiGradientButtonState();
}

class _AiGradientButtonState extends State<AiGradientButton> {
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null && !widget.loading;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelMedium
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600);

    return AnimatedScale(
      scale: _pressed && _enabled ? 0.98 : 1,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _enabled ? widget.onPressed : null,
          onHighlightChanged: (highlighted) {
            if (!_enabled) return;
            setState(() => _pressed = highlighted);
          },
          borderRadius: BorderRadius.circular(AppRadii.pill),
          child: Ink(
            height: 52,
            decoration: BoxDecoration(
              gradient: AppGradients.ai,
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
            child: Opacity(
              opacity: _enabled ? 1 : 0.6,
              child: Center(
                child: widget.loading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.leadingIcon != null) ...[
                            Icon(
                              widget.leadingIcon,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(widget.label, style: labelStyle),
                          if (widget.showArrow) ...[
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
