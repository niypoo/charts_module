import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';

class ChartPageView extends StatefulWidget {
  const ChartPageView({
    Key? key,
    required this.child,

  }) : super(key: key);

  final Widget child;

  @override
  State<ChartPageView> createState() => _ChartPageViewState();
}

class _ChartPageViewState extends State<ChartPageView> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      appBar: AppBar(),
      child: Center(child: widget.child),
    );
  }
}
