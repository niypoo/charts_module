import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charts_module/chart.widget.dart';
import 'package:charts_module/enums/chartType.enum.dart';
import 'package:charts_module/models/chartData.model.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPageView extends StatefulWidget {
  const ChartPageView({
    Key? key,
    required this.charts,
    this.horizontalPlotBands,
    this.verticalPlotBands,
    this.oneDayMode = true,
    this.legendVisible = true,
  }) : super(key: key);

  final List<PlotBand>? verticalPlotBands;
  final List<PlotBand>? horizontalPlotBands;
  final List<List<ChartData>> charts;
  final bool legendVisible;
  final bool oneDayMode;

  @override
  State<ChartPageView> createState() => _ChartPageViewState();
}

class _ChartPageViewState extends State<ChartPageView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      appBar: AppBar(),
      child: ChartWidget(
        chartsData: widget.charts,
        verticalPlotBands: widget.verticalPlotBands,
        chartType: ChartType.Spline,
        enableScrolling: true,
      ),
    );
  }
}
