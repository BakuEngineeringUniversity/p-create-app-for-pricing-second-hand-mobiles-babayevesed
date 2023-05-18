import 'package:flutter/material.dart';

bool _hasSnackBar = false;

enum SnackbarType { info, error, success }

void showCustomSnackBar(
  BuildContext context, {
  Widget? child,
  ValueKey? value,
  Duration showOutAnimationDuration = const Duration(milliseconds: 400),
  Duration hideOutAnimationDuration = const Duration(milliseconds: 400),
  Duration displayDuration = const Duration(milliseconds: 20000),
  double additionalTopPadding = 16.0,
  VoidCallback? onTap,
  OverlayState? overlayState,
  String? message,
  SnackbarType type = SnackbarType.info,
}) async {
  if (context.findRenderObject() == null) return;
  overlayState ??= Overlay.of(context);

  OverlayEntry? overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (ctx) {
      return Stack(
        children: [
          TopSnackBar(
            key: value,
            type: type,
            message: message,
            onDismissed: () {
              try {
                overlayEntry?.remove();
                overlayEntry = null;
              } catch (e) {
                debugPrint(e.toString());
              }
              _hasSnackBar = false;
            },
            showOutAnimationDuration: showOutAnimationDuration,
            hideOutAnimationDuration: hideOutAnimationDuration,
            displayDuration: displayDuration,
            additionalTopPadding: additionalTopPadding,
            onTap: () => onTap?.call(),
          ),
        ],
      );
    },
  );
  if (!_hasSnackBar && overlayEntry != null) {
    overlayState?.insert(overlayEntry!);
    _hasSnackBar = true;
  }
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  final Widget? child;
  final VoidCallback onDismissed;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration displayDuration;
  final double additionalTopPadding;
  final VoidCallback onTap;
  final SnackbarType type;
  final String? message;

  const TopSnackBar({
    Key? key,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
    required this.onTap,
    required this.type,
    this.message,
    this.child,
  }) : super(key: key);

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar> with SingleTickerProviderStateMixin {
  late Animation offsetAnimation;
  late AnimationController animationController;
  late double topPosition;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    widget.onDismissed();

    offsetAnimation.removeStatusListener((status) {});
    offsetAnimation.removeListener(() {});
    animationController.dispose();

    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
        reverseCurve: Curves.decelerate,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(widget.displayDuration);
          animationController.reverse();
          if (mounted) {
            setState(() {
              topPosition = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      bottom: topPosition,
      left: 16,
      right: 16,
      child: Material(
        type: MaterialType.transparency,
        child: SlideTransition(
          position: offsetAnimation as Animation<Offset>,
          child: Dismissible(
            key: GlobalKey(),
            direction: DismissDirection.vertical,
            onDismissed: (direction) {
              widget.onDismissed.call();
            },
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration:
                    BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Expanded(
                      child: Text(widget.message ?? '',
                          style: const TextStyle(color: Colors.white, fontSize: 18))),
                  ElevatedButton(
                    child: const Text('Tamam'),
                    onPressed: () => widget.onDismissed(),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
