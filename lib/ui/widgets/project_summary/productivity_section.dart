import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/project_summary/bar_chart.dart';

class ProductivitySection extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  const ProductivitySection({super.key,required this.width,required this.height,required this.title});

  @override
  State<ProductivitySection> createState() => _ProductivitySectionState();
}

class _ProductivitySectionState extends State<ProductivitySection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:widget. width * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: ConstColors.text),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
          ),
          CustomBarGraph(
            height: widget.height,
            width: widget.width,
          ),
        ],
      ),
    );
  }
}
