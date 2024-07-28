import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/project_summary/custom_tool_tip.dart';

class CustomBarGraph extends StatefulWidget {
  final double width;
  final double height;

  const CustomBarGraph({super.key, required this.height, required this.width});

  @override
  State<CustomBarGraph> createState() => _CustomBarGraphState();
}

class _CustomBarGraphState extends State<CustomBarGraph> {
  int _touchedIndex = -1;
  double _tooltipX = 0;
  double _tooltipY = 0;
  String _tooltipValue = '';

  List<BarChartGroupData> getBarGroups() {
    return List.generate(6, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: i == 3
                ? 0.56
                : (i == 4
                    ? 0.65
                    : (i == 5 ? 0.70 : (i == 2 ? 0.4 : (i == 1 ? 0.75 : 0.6)))),
            color: i == _touchedIndex ? ConstColors.app : ConstColors.disabled,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: i == _touchedIndex
                  ? [ConstColors.app, ConstColors.app]
                  : [
                      ConstColors.grey.withOpacity(0.12),
                      ConstColors.grey.withOpacity(0.06),
                    ],
            ),
            width: widget.width / 8,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ],
      );
    });
  }

  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height / 4,
          margin: EdgeInsets.symmetric(horizontal: widget.width * 0.06),
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(
                touchCallback: (event, response) {
                  if (response != null && response.spot != null) {
                    final spot = response.spot!;
                    setState(() {
                      _touchedIndex = spot.touchedBarGroupIndex;
                      _tooltipX = spot.offset.dx;
                      _tooltipY = spot.offset.dy;
                      _tooltipValue = '${(spot.spot.y * 100).toInt()} %';
                    });
                  } else {
                    setState(() {
                      _touchedIndex = -1;
                      _tooltipValue = '';
                    });
                  }
                },
              ),
              maxY: 1.1,
              minY: 0,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(
                show: false,
              ),
              titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                months[value.toInt()],
                                style: TextStyle(
                                  color: value == _touchedIndex
                                      ? ConstColors.app
                                      : ConstColors.secondaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }))),
              barGroups: getBarGroups(),
            ),
          ),
        ),
        if (_tooltipValue.isNotEmpty)
          Positioned(
            left: _tooltipX - 10,
            top: _tooltipY - 60,
            child: CustomTooltip(
              value: _tooltipValue,
            ),
          ),
      ],
    );
  }
}
