import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int quantity;
  final Function(int qty) onAdd;
  final Function(int qty) onRemove;

  const CartButton(
      {Key? key,
      required this.quantity,
      required this.onAdd,
      required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (quantity < 1) {
      return Material(
        color: Color.fromARGB(255, 255, 254, 254),
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: IconButton(
            onPressed: () {
              onAdd(1);
            },
            icon: const Icon(Icons.shopping_cart)),
      );
    }
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          _iconButton(Icons.remove, () {
            onRemove(quantity - 1);
          }),
          SizedBox(
              width: 40,
              child: Center(
                  child: Text(
                "$quantity",
                style: TextStyle(color: Color(0XFFE78F0B)),
              ))),
          _iconButton(Icons.add, () {
            onAdd(quantity + 1);
          })
        ],
      ),
    );
  }

  Widget _iconButton(IconData iconData, VoidCallback onPressed) => Material(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(1.0),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(iconData),
          ),
        ),
      );
}
