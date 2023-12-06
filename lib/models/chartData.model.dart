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
    this.legendIconType,
    this.dataLabelsVisible = true,
    this.dataMarkerType,
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
  final DataMarkerType? dataMarkerType;
  final LegendIconType? legendIconType;

  Map<String, dynamic> toData() {
    return {
      "value": value,
      "lowValue": lowValue,
      "highValue": highValue,
      "text": text,
      "date": date?.toIso8601String(),
      "label": label,
    };
  }
}
