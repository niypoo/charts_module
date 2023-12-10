import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartHelper {
  static RangeColumnSeries<ChartData, DateTime> barsRange({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return RangeColumnSeries<ChartData, DateTime>(
      // selectionBehavior: SelectionBehavior(
      //       enable: true,
      //       selectedBorderWidth: 5,
      //       unselectedBorderWidth: 0.5,
      //     ),
      //     // Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      dataSource: chartData,
      width: 6.sp,
      markerSettings: MarkerSettings(
        isVisible: false,
        borderWidth: 0,
        width: 12.sp,
        height: 12.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,

      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      // dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        // textStyle: TextStyle(fontSize: 10.sp),
        // useSeriesColor: true,
        showZeroValue: true,
        overflowMode: OverflowMode.trim,
        labelPosition: ChartDataLabelPosition.outside,
        labelIntersectAction: LabelIntersectAction.none,
        labelAlignment: ChartDataLabelAlignment.auto,
      ),
      // onPointTap: onPointTap,
    );
  }

  static SplineRangeAreaSeries<ChartData, DateTime> splineRange({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return SplineRangeAreaSeries<ChartData, DateTime>(
      // selectionBehavior: SelectionBehavior(
      //       enable: true,
      //       selectedBorderWidth: 5,
      //       unselectedBorderWidth: 0.5,
      //     ),
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      dataSource: chartData,

      borderWidth: 6.sp,
      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 12.sp,
        height: 12.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,

      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        // textStyle: TextStyle(fontSize: 10.sp),
        // useSeriesColor: true,
        showZeroValue: true,
        overflowMode: OverflowMode.trim,
        labelPosition: ChartDataLabelPosition.outside,
        labelIntersectAction: LabelIntersectAction.none,
        labelAlignment: ChartDataLabelAlignment.auto,
      ),
      // onPointTap: onPointTap,
    );
  }

  static SplineSeries<ChartData, DateTime> spline({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return SplineSeries<ChartData, DateTime>(
      //MAKE SELECTED BAR WITH CUSTOM COLOR
      // selectionBehavior: SelectionBehavior(
      //       enable: true,
      //       selectedBorderWidth: 5,
      //       unselectedBorderWidth: 0.5,
      //     ),

      dataSource: chartData,
      // width: 6,
      // // Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      // color: chartData.first.legendColor ?? chartData.first.color,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      width: 6.sp,

      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 12.sp,
        height: 12.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // // data label setting
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        // textStyle: TextStyle(fontSize: 10.sp),
        // useSeriesColor: true,
        showZeroValue: true,
        overflowMode: OverflowMode.trim,
        labelPosition: ChartDataLabelPosition.outside,
        labelIntersectAction: LabelIntersectAction.none,
        labelAlignment: ChartDataLabelAlignment.auto,
      ),
      splineType: SplineType.cardinal,
      // onPointTap: onPointTap,
    );
  }

  static ColumnSeries<ChartData, DateTime> bars({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return ColumnSeries<ChartData, DateTime>(
      // //MAKE SELECTED BAR WITH CUSTOM COLOR
      // selectionBehavior: SelectionBehavior(
      //   enable: true,
      //   selectedBorderWidth: 5,
      //   unselectedBorderWidth: 0.5,
      // ),

      dataSource: chartData,
      //Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',

      width: 6.sp,
      markerSettings: MarkerSettings(
        isVisible: false,
        borderWidth: 0,
        width: 12.sp,
        height: 12.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // // data label setting
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        // textStyle: TextStyle(fontSize: 10.sp),
        // useSeriesColor: true,
        showZeroValue: true,
        overflowMode: OverflowMode.trim,
        labelPosition: ChartDataLabelPosition.outside,
        labelIntersectAction: LabelIntersectAction.none,
        labelAlignment: ChartDataLabelAlignment.auto,
      ),
      // onPointTap: onPointTap,
    );
  }
}
