// import 'dart:async';


// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// class SlidableItem extends StatefulWidget {
//   // late AnimationController animationController;
//   // late Animation<double> animation;
//   var key;
//   Widget child;
//   bool dismissible;
//   Function()? onCompleted;
//   Function()? onTap;
//   String dismissText;
//   Color? color;
//   String? dismissedText;
//   BorderRadius? borderRadius;

//   SlidableItem(
//       {required this.child,
//       this.key,
//       this.borderRadius,
//       required this.dismissText,
//       this.onCompleted,
//       this.onTap,
//       this.color,
//       this.dismissedText,
//       this.dismissible = true});

//   @override
//   _SlidableItemState createState() => _SlidableItemState();
// }

// class _SlidableItemState extends State<SlidableItem>
//     with TickerProviderStateMixin {
//   late SlidableController slidableController;
//   late AnimationController animationController;
//   late Animation<double> animation;
//   bool isOpened = false;

//   double extendRatio = 0.25;

//   StreamController<double> slidableStreamController =
//       StreamController<double>();
//   @override
//   void initState() {
//     animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 200));
//     animation = Tween<double>(begin: 0.25, end: 1).animate(animationController);
//     slidableController = SlidableController(
//         onSlideAnimationChanged: onSlideAnimationChanged,
//         onSlideIsOpenChanged: onSlideIsOpenChanged);
//     animationController.addListener(() {
//       extendRatio = animation.value;
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     // slidableStreamController.sink.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       actionPane: SlidableDrawerActionPane(),
//       controller: slidableController,
//       showAllActionsThreshold: 0,
//       // dismissal: SlidableDismissal(
//       //   child: SlidableDrawerDismissal(),
//       //   onDismissed: (actionType) {
//       //     widget.onCompleted!();
//       //   },
//       //   dragDismissible: false,
//       // ),
//       // key: widget.key,
//       actionExtentRatio: extendRatio,
//       fastThreshold: 0,
//       child: Container(
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//           color: widget.color ?? CustomColors.red,
//           borderRadius: !isOpened
//               ? widget.borderRadius ?? BorderRadius.circular(16.r)
//               : BorderRadius.horizontal(left: Radius.circular(16.r)),
//         ),
//         child: AnimatedContainer(
//             clipBehavior: Clip.hardEdge,
//             duration: Duration(milliseconds: 200),
//             alignment: Alignment.centerLeft,
//             decoration: BoxDecoration(
//               borderRadius: !isOpened
//                   ? widget.borderRadius ?? BorderRadius.zero
//                   : BorderRadius.horizontal(right: Radius.circular(16.r)),
//             ),
//             child: widget.child),
//       ),
//       secondaryActions: <Widget>[
//         Container(
//           decoration: BoxDecoration(
//             color: widget.color ?? CustomColors.red,
//           ),
//           // borderRadius: BorderRadius.horizontal(
//           //     left: Radius.circular(16 * (1.25 - animation.value)))),
//           child: AnimatedSwitcher(
//               duration: Duration(milliseconds: 300),
//               child: extendRatio != 0.25 &&
//                       widget.dismissible &&
//                       animation.value == 1
//                   ? Container(
//                       decoration: BoxDecoration(
//                           color: widget.color ?? CustomColors.red),
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                         child: Row(
//                           children: [
//                             Proccesingmoment(
//                                 duration: 5,
//                                 onStart: () => {},
//                                 onComplete: () {
//                                   widget.onCompleted!();
//                                 }),
//                             SizedBox(width: 15),
//                             Text(widget.dismissedText!,
//                                 style: TextStyle(
//                                     color: CustomColors.white, fontSize: 13.0)),
//                             Spacer(),
//                             GestureDetector(
//                                 onTap: () {
//                                   animationController.reverse();
//                                   // args.update(index, (value) => 0.25);
//                                   // extendRatio = 0.25;
//                                   // setState(() {});
//                                   // slidableStreamController.sink.add(0.25);
//                                 },
//                                 child: Center(
//                                   child: Text("UNDO",
//                                       style: TextStyle(
//                                           color: CustomColors.white,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 11.0,
//                                           height: 18 / 11)),
//                                 ))
//                           ],
//                         ),
//                       ))
//                   : Container(
//                       color: CustomColors.red,
//                     )),
//         )
//       ],
//     );
//   }

//   void onSlideAnimationChanged(Animation<double>? value) {

//     // if (!value.isCompleted) {
//     //   isOpened = true;
//     //   print('isCompleted');
//     //   // setState(() {});
//     // } else {
//     //   isOpened = true;
//     //   print('isProcess');
//     //   // setState(() {});
//     // }
//   }

//   void onSlideIsOpenChanged(bool? value) {
//     if (value!) {
//       isOpened = true;
//     } else {
//       isOpened = false;
//       animationController.value = 0.25;
//       extendRatio = 0.25;
//     }
//     setState(() {});
//   }
// }
