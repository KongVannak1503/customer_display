import 'package:flutter/material.dart';

class BtnLogoutOutlineWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double height;

  const BtnLogoutOutlineWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
    this.height = 40,
  });

  @override
  State<BtnLogoutOutlineWidget> createState() => _BtnLogoutOutlineWidgetState();
}

class _BtnLogoutOutlineWidgetState extends State<BtnLogoutOutlineWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.onError;
    final textColor = Theme.of(context).colorScheme.error;
    final hoverBg = Theme.of(context).colorScheme.secondaryContainer;
    final radius = BorderRadius.circular(50);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: widget.height,
            padding: widget.padding,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: _isHovered ? hoverBg : bgColor,
              borderRadius: radius,
              border: Border.all(
                color: textColor, // color of the outline
                width: 1.5, // thickness of the border
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.logout, color: textColor),
                SizedBox(width: 10),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
