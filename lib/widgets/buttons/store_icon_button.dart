import 'package:flutter/material.dart';

class StoreIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color bgColor;
  final Color hoverColor;
  final double size;
  final Color iconColor;

  const StoreIconButton({
    super.key,
    required this.icon,
    required this.url,
    this.bgColor = Colors.transparent,
    this.hoverColor = Colors.grey,
    this.size = 25,
    this.iconColor = Colors.black,
  });

  @override
  State<StoreIconButton> createState() => _StoreIconButtonState();
}

class _StoreIconButtonState extends State<StoreIconButton> {
  bool _isHover = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    // if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //   throw Exception('Could not launch ${widget.url}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(50),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHover
                ? Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha((0.20 * 255).round())
                : widget.bgColor,
          ),
          child: Icon(widget.icon, size: widget.size, color: widget.iconColor),
        ),
      ),
    );
  }
}
