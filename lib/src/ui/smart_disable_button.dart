import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartDisableElevatedButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? disabledLabel;

  SmartDisableElevatedButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.disabledIcon = null,
        this.label = null,
        this.disabledLabel = null,
        super(key: key);

  SmartDisableElevatedButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.disabledIcon,
      required Widget label,
      this.disabledLabel})
      : this.child = null,
        this.disabledChild = null,
        this.icon = icon,
        this.label = label,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartDisableElevatedButtonState();
}

class _SmartDisableElevatedButtonState extends State<SmartDisableElevatedButton> {
  bool disabled = false;

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
        child: disabled ? widget.disabledChild ?? child : child,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
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
        icon: disabled ? widget.disabledIcon ?? icon : icon,
        label: disabled ? widget.disabledLabel ?? label : label,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}

class SmartDisableOutlinedButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? disabledLabel;

  SmartDisableOutlinedButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.disabledIcon = null,
        this.label = null,
        this.disabledLabel = null,
        super(key: key);

  SmartDisableOutlinedButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.disabledIcon,
      required Widget label,
      this.disabledLabel})
      : this.child = null,
        this.disabledChild = null,
        this.icon = icon,
        this.label = label,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartDisableOutlinedButtonState();
}

class _SmartDisableOutlinedButtonState extends State<SmartDisableOutlinedButton> {
  bool disabled = false;

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
        child: disabled ? widget.disabledChild ?? child : child,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
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
        icon: disabled ? widget.disabledIcon ?? icon : icon,
        label: disabled ? widget.disabledLabel ?? label : label,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}

class SmartDisableTextButton extends StatefulWidget {
  final AsyncCallback? onPressed;
  final AsyncCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget? child;
  final Widget? disabledChild;
  final Widget? icon;
  final Widget? disabledIcon;
  final Widget? label;
  final Widget? disabledLabel;

  SmartDisableTextButton(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget child,
      this.disabledChild})
      : this.child = child,
        this.icon = null,
        this.disabledIcon = null,
        this.label = null,
        this.disabledLabel = null,
        super(key: key);

  SmartDisableTextButton.icon(
      {Key? key,
      this.onPressed,
      this.onLongPress,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required Widget icon,
      this.disabledIcon,
      required Widget label,
      this.disabledLabel})
      : this.child = null,
        this.disabledChild = null,
        this.icon = icon,
        this.label = label,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartDisableTextButtonState();
}

class _SmartDisableTextButtonState extends State<SmartDisableTextButton> {
  bool disabled = false;

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
        child: disabled ? widget.disabledChild ?? child : child,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
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
        icon: disabled ? widget.disabledIcon ?? icon : icon,
        label: disabled ? widget.disabledLabel ?? label : label,
        onPressed: disabled || onPressed == null
            ? null
            : () {
                setState(() => disabled = true);
                onPressed().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
        onLongPress: disabled || onLongPress == null
            ? null
            : () {
                setState(() => disabled = true);
                onLongPress().whenComplete(() {
                  if (mounted) {
                    setState(() => disabled = false);
                  }
                });
              },
      );
    }
    throw ArgumentError();
  }
}
