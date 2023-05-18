import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.name,
      required this.onTap,
      required this.isAdmin,
      required this.onRemove,
      required this.onEdit});
  final String name;
  final Function() onTap;
  final Function() onRemove;
  final Function() onEdit;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(child: Text(name))),
          ),
        ),
        if (isAdmin)
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () => onEdit.call(),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ))),
        if (isAdmin)
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                  onPressed: () => onRemove.call(),
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  )))
      ],
    );
  }
}
