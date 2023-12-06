import 'package:charts_module/helpers/chart.helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartMinSplineWidget extends StatelessWidget {
  const ChartMinSplineWidget({
    Key? key,
    required this.chartsData,
  }) : super(key: key);

  final List<ChartData> chartsData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (context.isLandscape ? context.width : context.height) * 0.4,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(
            isVisible: false,
          ),
          primaryYAxis: NumericAxis(
            isVisible: false,
          ),
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,
          selectionGesture: ActivationMode.singleTap,
          selectionType: SelectionType.point,
          onSelectionChanged: (selectionArgs) => selectionArgs.selectedColor,
          series: <CartesianSeries>[
            ChartHelper.spline(
              chartData: chartsData,
            )
          ],
        ),
      ),
    );
  }
}
