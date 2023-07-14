import 'package:flutter/material.dart';

class IconLabelAndText extends StatelessWidget {
  final String label, text;
  final IconData icon;
  const IconLabelAndText(
      {super.key, required this.label, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              text,
            ),
          ],
        ),
      ],
    );
  }
}
