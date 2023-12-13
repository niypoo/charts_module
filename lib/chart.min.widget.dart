import 'package:charts_module/enums/chartType.enum.dart';
import 'package:charts_module/helpers/chart.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartMinSplineWidget extends StatelessWidget {
  const ChartMinSplineWidget({
    Key? key,
    required this.chartData,
    this.chartType = ChartType.Spline,
  }) : super(key: key);

  final List<ChartData> chartData;
  final ChartType chartType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (context.isLandscape ? context.width : context.height) * 0.4,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(
            isVisible: true,
            majorTickLines: MajorTickLines(
              width: 1.sp,
            ),
            // //Hide the guidelines of x-axis
            majorGridLines: MajorGridLines(
              width: 0.2.sp,
            ),

            axisLine: AxisLine(width: 0.2.sp),
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
              majorTickLines: MajorTickLines(
                width: 1.sp,
              ),
              majorGridLines: MajorGridLines(
                width: 0.2.sp,
              ),
              axisLine: AxisLine(width: 0.2.sp),
          ),
          plotAreaBorderWidth:  0.2.sp,
          enableAxisAnimation: true,
          onSelectionChanged: (selectionArgs) => selectionArgs.selectedColor,
          series: <CartesianSeries>[
            // if spline
            if (chartType == ChartType.SplineRange)
              ChartHelper.splineRange(
                chartData: chartData,
                // onPointTap: _selectBar,
              )
            else if (chartType == ChartType.Bars)
              ChartHelper.bars(
                chartData: chartData,
                // onPointTap: _selectBar,
              )
            else if (chartType == ChartType.Spline)
              ChartHelper.spline(
                chartData: chartData,
                // onPointTap: _selectBar,
              )
            else if (chartType == ChartType.BarsRange)
              ChartHelper.barsRange(
                chartData: chartData,
                // onPointTap: _selectBar,
              )
          ],
        ),
      ),
    );
  }
}
