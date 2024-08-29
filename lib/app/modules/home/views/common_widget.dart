import 'package:bookingdemoapp/app/data/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData? icon;
  final double width;
  final Color? color;
  const ButtonWidget2({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    required this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: MediaQuery.of(context).size.width * width,
        height: 30,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color ?? UIC.buttonColor,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 14,
                ),
                const SizedBox(width: 5),
              Flexible(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData? icon;
  final double width;
  final Color? color;
  const ButtonWidget({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    required this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color ?? UIC.buttonColor,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              if (icon != null) const SizedBox(width: 8),
              Flexible(
                child: FittedBox(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VisibilityTextWidget extends StatelessWidget {
  final bool isVisible;
  final String text;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const VisibilityTextWidget({
    super.key,
    required this.isVisible,
    required this.text,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: style ??
              TextStyle(
                  fontSize: 20,
                  color: UIC.buttonColor,
                  fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
