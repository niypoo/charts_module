import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartHelper {
  final double animationDuration;

  ChartHelper({
    this.animationDuration = 1000,
  });

  SplineRangeAreaSeries<ChartData, DateTime> splineRange({
    required List<ChartData>? chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return SplineRangeAreaSeries<ChartData, DateTime>(
      // selectionBehavior: SelectionBehavior(
      //   enable: true,
      //   selectedColor: widget.selectedColor,
      // ),
      // Legend
      name: chartData!.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      color: chartData.first.color?.withOpacity(0.2),
      // borderRadius: BorderRadius.all(Radius.circular(15)),
      dataSource: chartData,
      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 2,
        width: 9,
        height: 9,
        shape: chartData.first.dataMarkerType,
        // ignore: prefer_null_aware_operators
        color: chartData.first.color,
      ),

      animationDuration: animationDuration,
      // pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,
      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      // dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        textStyle: Get.textTheme.labelSmall!.copyWith(fontSize: 0),
        showZeroValue: false,
        labelAlignment: ChartDataLabelAlignment.middle,
        alignment: ChartAlignment.center,
        labelPosition: ChartDataLabelPosition.outside,
        labelIntersectAction: LabelIntersectAction.hide,
        showCumulativeValues: true,
      ),
      onPointTap: onPointTap,
    );
  }

  SplineSeries<ChartData, DateTime> spline({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return SplineSeries<ChartData, DateTime>(

      dataSource: chartData,
      animationDuration: animationDuration,

      // Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,

      color: chartData.first.legendColor ?? chartData.first.color,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => DateTime.now(),
      yValueMapper: (ChartData data, _) => 100,
      dataLabelMapper: (ChartData data, _) => 'Label',

    );
  }
}
