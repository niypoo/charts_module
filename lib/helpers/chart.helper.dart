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

      markerSettings: MarkerSettings(
        isVisible: true,
        borderWidth: 0,
        width: 5.sp,
        height: 5.sp,
        shape: chartData.first.dataMarkerType,
        // color: chartData.first.color,
      ),

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,
      
      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      // dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
      //           textStyle: TextStyle(fontSize: 0, color: Get.theme.secondaryHeaderColor),
      //   //useSeriesColor: true,
      //   //showZeroValue: true,
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
  //     // Legend
  //     name: chartData!.first.legendText,
  //     legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
  //     legendItemText: chartData.first.legendText ?? ' ',
  //     isVisibleInLegend: chartData.first.legendText != null ? true : false,
  //     color: chartData.first.color?.withOpacity(0.2),
  //     // borderRadius: BorderRadius.all(Radius.circular(15)),
      dataSource: chartData,
  //     markerSettings: MarkerSettings(
  //       isVisible: true,
  //       borderWidth: 2,
  //       width: 9,
  //       height: 9,
  //       shape: chartData.first.dataMarkerType,
  //       // ignore: prefer_null_aware_operators
  //       color: chartData.first.color,
  //     ),

      // pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      lowValueMapper: (ChartData data, _) => data.lowValue,
      highValueMapper: (ChartData data, _) => data.highValue,
      // Map the data label text for each point from the data source
      // isTrackVisible: false,
      // dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',
      // dataLabelSettings: DataLabelSettings(
      //   isVisible: true,
      //           textStyle: TextStyle(fontSize: 0, color: Get.theme.secondaryHeaderColor),
      //   //useSeriesColor: true,
      //   //showZeroValue: true,
      //   // labelAlignment: ChartDataLabelAlignment.middle,
      //   // alignment: ChartAlignment.center,
      //   // labelPosition: ChartDataLabelPosition.outside,
      //   // labelIntersectAction: LabelIntersectAction.hide,
      //   // showCumulativeValues: true,
      // ),
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
      // name: chartData.first.legendText,
      // legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      // legendItemText: chartData.first.legendText ?? ' ',
      // isVisibleInLegend: chartData.first.legendText != null ? true : false,

      // color: chartData.first.legendColor ?? chartData.first.color,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      //dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',

      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   borderWidth: 4,
      //   width: 12,
      //   height: 12,
      //   shape: chartData.first.dataMarkerType,
      //   // ignore: prefer_null_aware_operators
      //   color: chartData.first.color,
      // ),

      // // data label setting
      // dataLabelSettings: DataLabelSettings(
      //   isVisible: true,
      //           textStyle: TextStyle(fontSize: 0, color: Get.theme.secondaryHeaderColor),

      //   //useSeriesColor: true,
      //   //showZeroValue: true,
      //   // labelAlignment: ChartDataLabelAlignment.auto,
      //   // alignment: ChartAlignment.far,
      //   // labelPosition: ChartDataLabelPosition.inside,
      //   // labelIntersectAction: LabelIntersectAction.hide,
      //   // showCumulativeValues: false,
      // ),
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
      // width: 6,
      // // Legend
      // name: chartData.first.legendText,
      // legendIconType: chartData.first.legendIconType ?? LegendIconType.circle,
      // legendItemText: chartData.first.legendText ?? ' ',
      // isVisibleInLegend: chartData.first.legendText != null ? true : false,

      // color: chartData.first.legendColor ?? chartData.first.color,

      pointColorMapper: (ChartData data, _) => data.color,
      xValueMapper: (ChartData data, _) => data.date,
      yValueMapper: (ChartData data, _) => data.value,
      //dataLabelMapper: (ChartData data, _) => '${data.value} ${data.label}',

      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   borderWidth: 4,
      //   width: 12,
      //   height: 12,
      //   shape: chartData.first.dataMarkerType,
      //   // ignore: prefer_null_aware_operators
      //   color: chartData.first.color,
      // ),

      // // data label setting
      // dataLabelSettings: DataLabelSettings(
      //   isVisible: true,
      //           textStyle: TextStyle(fontSize: 0, color: Get.theme.secondaryHeaderColor),
      //   //useSeriesColor: true,
      //  // showZeroValue: true,
      //   // labelAlignment: ChartDataLabelAlignment.auto,
      //   // alignment: ChartAlignment.far,
      //   // labelPosition: ChartDataLabelPosition.inside,
      //   // labelIntersectAction: LabelIntersectAction.hide,
      //   // showCumulativeValues: false,
      // ),
      // onPointTap: onPointTap,
    );
  }
}
