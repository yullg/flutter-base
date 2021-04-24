import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartElevatedButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? lockedChild;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? lockedIcon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? lockedLabel;
  final Widget? disabledLabel;

  SmartElevatedButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.lockedChild,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.lockedIcon = null,
        this.disabledIcon = null,
        this.label = null,
        this.lockedLabel = null,
        this.disabledLabel = null,
        super(key: key);

  SmartElevatedButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.lockedIcon,
      this.disabledIcon,
      required Widget label,
      this.lockedLabel,
      this.disabledLabel})
      : this.icon = icon,
        this.label = label,
        this.child = null,
        this.lockedChild = null,
        this.disabledChild = null,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartElevatedButtonState();
}

class _SmartElevatedButtonState extends State<SmartElevatedButton> {
  bool locked = false;

  @override
  Widget build(BuildContext context) {
    Widget? child = widget.child, icon = widget.icon, label = widget.label;
    AsyncCallback? onPressed = widget.onPressed, onLongPress = widget.onLongPress;
    if (child != null) {
      return ElevatedButton(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        child: onPressed == null && onLongPress == null
            ? widget.disabledChild ?? child
            : locked
                ? widget.lockedChild ?? child
                : child,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    } else if (icon != null && label != null) {
      return ElevatedButton.icon(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        icon: onPressed == null && onLongPress == null
            ? widget.disabledIcon ?? icon
            : locked
                ? widget.lockedIcon ?? icon
                : icon,
        label: onPressed == null && onLongPress == null
            ? widget.disabledLabel ?? label
            : locked
                ? widget.lockedLabel ?? label
                : label,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}

class SmartOutlinedButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? lockedChild;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? lockedIcon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? lockedLabel;
  final Widget? disabledLabel;

  SmartOutlinedButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.lockedChild,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.lockedIcon = null,
        this.disabledIcon = null,
        this.label = null,
        this.lockedLabel = null,
        this.disabledLabel = null,
        super(key: key);

  SmartOutlinedButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.lockedIcon,
      this.disabledIcon,
      required Widget label,
      this.lockedLabel,
      this.disabledLabel})
      : this.child = null,
        this.lockedChild = null,
        this.disabledChild = null,
        this.icon = icon,
        this.label = label,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartOutlinedButtonState();
}

class _SmartOutlinedButtonState extends State<SmartOutlinedButton> {
  bool locked = false;

  @override
  Widget build(BuildContext context) {
    Widget? child = widget.child, icon = widget.icon, label = widget.label;
    AsyncCallback? onPressed = widget.onPressed, onLongPress = widget.onLongPress;
    if (child != null) {
      return OutlinedButton(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        child: onPressed == null && onLongPress == null
            ? widget.disabledChild ?? child
            : locked
                ? widget.lockedChild ?? child
                : child,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    } else if (icon != null && label != null) {
      return OutlinedButton.icon(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        icon: onPressed == null && onLongPress == null
            ? widget.disabledIcon ?? icon
            : locked
                ? widget.lockedIcon ?? icon
                : icon,
        label: onPressed == null && onLongPress == null
            ? widget.disabledLabel ?? label
            : locked
                ? widget.lockedLabel ?? label
                : label,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}

class SmartTextButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? lockedChild;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? lockedIcon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? lockedLabel;
  final Widget? disabledLabel;

  SmartTextButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.lockedChild,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.lockedIcon = null,
        this.disabledIcon = null,
        this.label = null,
        this.lockedLabel = null,
        this.disabledLabel = null,
        super(key: key);

  SmartTextButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.lockedIcon,
      this.disabledIcon,
      required Widget label,
      this.lockedLabel,
      this.disabledLabel})
      : this.child = null,
        this.lockedChild = null,
        this.disabledChild = null,
        this.icon = icon,
        this.label = label,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartTextButtonState();
}

class _SmartTextButtonState extends State<SmartTextButton> {
  bool locked = false;

  @override
  Widget build(BuildContext context) {
    Widget? child = widget.child, icon = widget.icon, label = widget.label;
    AsyncCallback? onPressed = widget.onPressed, onLongPress = widget.onLongPress;
    if (child != null) {
      return TextButton(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        child: onPressed == null && onLongPress == null
            ? widget.disabledChild ?? child
            : locked
                ? widget.lockedChild ?? child
                : child,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    } else if (icon != null && label != null) {
      return TextButton.icon(
        style: widget.style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        icon: onPressed == null && onLongPress == null
            ? widget.disabledIcon ?? icon
            : locked
                ? widget.lockedIcon ?? icon
                : icon,
        label: onPressed == null && onLongPress == null
            ? widget.disabledLabel ?? label
            : locked
                ? widget.lockedLabel ?? label
                : label,
        onPressed: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}

class SmartButton extends StatefulWidget {
  final Widget child;
  final Widget? lockedChild;
  final Widget? disabledChild;
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;

  SmartButton({Key? key, required this.child, this.lockedChild, this.disabledChild, this.onPressed, this.onLongPress}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartButtonState();
}

class _SmartButtonState extends State<SmartButton> {
  bool locked = false;

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;
    AsyncCallback? onPressed = widget.onPressed, onLongPress = widget.onLongPress;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: onPressed == null && onLongPress == null
            ? widget.disabledChild ?? child
            : locked
                ? widget.lockedChild ?? child
                : child,
        onTap: locked || onPressed == null
            ? null
            : () {
                setState(() => locked = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
        onLongPress: locked || onLongPress == null
            ? null
            : () {
                setState(() => locked = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => locked = false);
                  }
                });
              },
      ),
    );
  }
}
