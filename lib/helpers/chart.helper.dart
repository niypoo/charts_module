import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartHelper {
  static RangeColumnSeries<ChartData, DateTime> barsRange({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return RangeColumnSeries<ChartData, DateTime>(
      // selectionBehavior: SelectionBehavior(
      //   enable: true,
      //   toggleSelection: true,
      //   selectedColor: Get.theme.primaryColor,
      //   unselectedColor: Get.theme.cardColor,
      //   selectedBorderWidth:5.sp,
      //   unselectedBorderWidth: 3.sp,
      //   unselectedOpacity: 0.7,
      // ),
      //     // Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
       color: chartData.first.legendColor ?? chartData.first.color,
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      dataSource: chartData,

      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 10.sp,
        height: 10.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,

      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
     
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(color: chartData.first.color),
        useSeriesColor: false,
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
      //   enable: true,
      //   // selectedBorderWidth: 5,
      //   // unselectedBorderWidth: 0.5,
      // ),
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      color: chartData.first.legendColor ?? chartData.first.color,
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      dataSource: chartData,

      borderWidth: 3.sp,

      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 8.sp,
        height: 8.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,

      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(color: chartData.first.color),
        useSeriesColor: false,
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

  static SplineSeries<ChartData, DateTime> spline({
    required List<ChartData> chartData,
    Function(ChartPointDetails)? onPointTap,
  }) {
    return SplineSeries<ChartData, DateTime>(
      //MAKE SELECTED BAR WITH CUSTOM COLOR
      // selectionBehavior: SelectionBehavior(
      //   enable: true,
      //   toggleSelection: true,
      //   selectedColor: Get.theme.primaryColor,
      //   unselectedColor: Get.theme.cardColor,
      //   selectedBorderWidth:5.sp,
      //   unselectedBorderWidth: 3.sp,
      //   unselectedOpacity: 0.7,
      //   // selectedBorderWidth: 5,
      //   // unselectedBorderWidth: 0.5,
      // ),

      dataSource: chartData,
      // // Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      color: chartData.first.legendColor ?? chartData.first.color,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      width: 3.sp,

      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 8.sp,
        height: 8.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // // data label setting
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(color: chartData.first.color),
        useSeriesColor: false,
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
      // // //MAKE SELECTED BAR WITH CUSTOM COLOR
      // selectionBehavior: SelectionBehavior(
      //   enable: true,
      //   // selectedBorderWidth: 5,
      //   // unselectedBorderWidth: 0.5,
      // ),

      dataSource: chartData,
      //Legend
      name: chartData.first.legendText,
      legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      legendItemText: chartData.first.legendText ?? ' ',
      isVisibleInLegend: chartData.first.legendText != null ? true : false,
      color: chartData.first.legendColor ?? chartData.first.color,
       borderRadius: BorderRadius.all(Radius.circular(15.sp)),
       
      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',

      markerSettings: MarkerSettings(
        isVisible: false,
        borderWidth: 0,
        width: 10.sp,
        height: 10.sp,
        shape: chartData.first.dataMarkerType,
        color: chartData.first.color,
      ),

      // // data label setting
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(color: chartData.first.color),
        useSeriesColor: false,
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
