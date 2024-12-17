import 'package:flutter/material.dart';
import 'package:islami_app_new/core/app_colors.dart';

class AyahPreview extends StatefulWidget {
  AyahPreview(
      {super.key,
      required this.content,
      required this.index,
      this.clicked = false});
  final String content;
  final int index;
  bool clicked;

  @override
  State<AyahPreview> createState() => _AyahPreviewState();
}

class _AyahPreviewState extends State<AyahPreview> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.clicked = !widget.clicked;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            color: widget.clicked ? AppColors.primaryDark : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primaryDark, width: 2)),
        child: Text(
          "${widget.content} [${widget.index + 1}]",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.clicked
                  ? AppColors.blackColor
                  : AppColors.primaryDark),
        ),
      ),
    );
  }
}
