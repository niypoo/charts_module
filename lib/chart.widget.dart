import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:charts_module/enums/chartType.enum.dart';
import 'package:charts_module/helpers/chart.helper.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:charts_module/partials/emptyChartData.widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({
    Key? key,
    required this.chartsData,
    this.chartType = ChartType.Spline,
    this.animationDuration = 1000,
    this.horizontalPlotBands,
    this.verticalPlotBands,
    this.label,
    this.color,
    this.enableScrolling = false,
    this.legendVisible = true,
    this.selectedColor,
    this.autoScrollingDelta = 7,
  }) : super(key: key);

  final List<List<ChartData>>? chartsData;
  final ChartType chartType;
  final double animationDuration;
  final bool legendVisible;
  final bool enableScrolling;
  final List<PlotBand>? verticalPlotBands;
  final List<PlotBand>? horizontalPlotBands;
  final String? label;
  final Color? color;
  final int autoScrollingDelta;
  final Color? selectedColor;

  @override
  // ignore: library_private_types_in_public_api
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  // the index of selected bar
  int? index;
  ChartData? first;
  int? seriesIndex;
  // Series Name
  late List<ChartData?> seriesNames;

  @override
  Widget build(BuildContext context) {
    // check and sure the chart data not empty
    if (widget.chartsData != null &&
        widget.chartsData!.isNotEmpty &&
        (widget.chartsData!.first.isNotEmpty)) {
      // get first child from first series to make it selected as default
      first = widget.chartsData!.first.first;

      // get serial names
      seriesNames = widget.chartsData!.map((a) {
        if (a.isNotEmpty) return a.first;
      }).toList();
    }

    return SizedBox(
      height: (context.isLandscape ? context.width : context.height) * 0.4,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            zoomMode: ZoomMode.xy,
          ),
          primaryXAxis: DateTimeAxis(
            isVisible: true,
            majorTickLines: MajorTickLines(
              width: 1.sp,
            ),
            //Hide the guidelines of x-axis
            majorGridLines: const MajorGridLines(
              width: 0,
              // dashArray: const [10],
              // color: Get.theme.cardColor,
            ),
            //Hide the axis line of x-axis
            axisLine: AxisLine(width: 1.sp),
            labelStyle: TextStyle(fontSize: 10.sp),
            // desiredIntervals: 31,
            autoScrollingDelta: widget.autoScrollingDelta,
            desiredIntervals: widget.autoScrollingDelta,
            autoScrollingMode: AutoScrollingMode.start,
            autoScrollingDeltaType: DateTimeIntervalType.auto,
            // labelIntersectAction: AxisLabelIntersectAction.rotate90,
            plotBands: widget.verticalPlotBands,
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            majorTickLines: const MajorTickLines(
              width: 1,
            ),
            //Hide the grid lines of y-axis
            majorGridLines: const MajorGridLines(
              width: 0,
              // dashArray: const [10],
              // color: Get.theme.cardColor,
            ),
            //Hide the axis line of y-axis
            axisLine: const AxisLine(width: 0),
            plotBands: widget.horizontalPlotBands,
          ),
          plotAreaBorderWidth: 0,
          // tooltipBehavior: TooltipBehavior(
          //   enable: true,
          //   builder: (data, point, series, pointIndex, seriesIndex) =>
          //       JTooltipBehavior(
          //     title:
          //         '${LocaleService.tra('Lower')} ${data.lowValue} / ${LocaleService.tra('Higher')} ${data.highValue} \n ${LocaleService.tra('at')} ${data.text}',
          //     color: data.color,
          //   ),
          //   canShowMarker: false,
          //   header: '',
          //   duration: 5000,
          // ),
          enableAxisAnimation: true,
          selectionGesture: ActivationMode.singleTap,
          selectionType: SelectionType.point,
          onSelectionChanged: (selectionArgs) => selectionArgs.selectedColor,
          legend: Legend(
            isVisible: widget.legendVisible,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
            alignment: ChartAlignment.center,
            itemPadding: 10,
          ),
          // If data is empty show "no data provided" message
          annotations: first == null
              ? <CartesianChartAnnotation>[
                  const CartesianChartAnnotation(
                    widget: EmptyChartDataWidget(),
                    coordinateUnit: CoordinateUnit.logicalPixel,
                    region: AnnotationRegion.plotArea,
                    x: 150,
                    y: 200,
                    horizontalAlignment: ChartAlignment.center,
                    verticalAlignment: ChartAlignment.center,
                  )
                ]
              : null,
          series: <CartesianSeries>[
            // loop on data
            for (final chartData in widget.chartsData!)

              // if data not empty
              if (chartData.isNotEmpty)

                // if spline
                if (widget.chartType == ChartType.SplineRange)
                  ChartHelper.splineRange(
                    chartData: chartData,
                    // onPointTap: _selectBar,
                  )
                else if (widget.chartType == ChartType.Bars)
                  ChartHelper.bars(
                    chartData: chartData,
                    // onPointTap: _selectBar,
                  )
                else if (widget.chartType == ChartType.Spline)
                  ChartHelper.spline(
                    chartData: chartData,
                    // onPointTap: _selectBar,
                  )
                else if (widget.chartType == ChartType.BarsRange)
                  ChartHelper.barsRange(
                    chartData: chartData,
                    // onPointTap: _selectBar,
                  )
          ],

          // onDataLabelRender: onDataLabelRender,
        ),
      ),
    );
  }

  // //when user tap on bar or column
  // void _selectBar(ChartPointDetails args) {
  //   // if user tap on same selected data reset chart
  //   if (index == args.pointIndex && seriesIndex == args.seriesIndex) {
  //     index = null;
  //     seriesIndex = null;
  //   } else {
  //     index = args.pointIndex;
  //     seriesIndex = args.seriesIndex;
  //   }
  //   setState(() {});
  // }

  // void onDataLabelRender(DataLabelRenderArgs args) {
  //   if (
  //       // check if point is same
  //       (index != null && index == args.pointIndex) &&
  //           // check if series same
  //           (seriesIndex != null &&
  //               _getSeriesName(seriesIndex) ==
  //                   (args.seriesRenderer as ChartSeries).name)) {
  //     ChartData? candidate = _getSeriesPointData(seriesIndex, index);

  //     args.textStyle = Get.theme.textTheme.labelSmall!.copyWith(
  //       color: widget.color,
  //       fontWeight: FontWeight.bold,
  //     );

  //     args.color = candidate?.color ?? args.color;
  //     args.text = '${args.text} ${candidate?.label}';
  //   } else {
  //     args.color = null;
  //     args.textStyle = Get.theme.textTheme.labelSmall!.copyWith(fontSize: 0);
  //   }
  // }

  // // Method to return the series name based on tapped point's series index
  // String? _getSeriesName(int? index) {
  //   if (index == null || !seriesNames.asMap().containsKey(index)) return '';
  //   return seriesNames[index]!.legendText;
  // }

  // ChartData? _getSeriesPointData(int? seriesIndex, int? index) {
  //   if (seriesIndex == null || !seriesNames.asMap().containsKey(seriesIndex)) {
  //     return null;
  //   }
  //   if (index == null ||
  //       !widget.chartsData![seriesIndex].asMap().containsKey(index))
  //     return null;

  //   return widget.chartsData![seriesIndex][index];
  // }
}
