import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData({
    this.value = 0,
    this.highValue = 0,
    this.lowValue = 0,
    this.color,
    this.legendColor,
    this.textColor,
    this.text = '',
    this.label = '',
    this.legendText,
    this.date,
    this.type,
    this.dataLabelsVisible = true,
    this.legendIconType = LegendIconType.circle,
    this.dataMarkerType = DataMarkerType.circle,
  });
  final num value;
  final num lowValue;
  final num highValue;
  final Color? color;
  final Color? legendColor;
  final Color? textColor;
  final String text;
  final DateTime? date;
  final dynamic type;
  final String label;
  final String? legendText;
  final bool dataLabelsVisible;
  final DataMarkerType dataMarkerType;
  final LegendIconType legendIconType;
}
