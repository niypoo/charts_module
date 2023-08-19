import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmptyChartDataWidget extends StatelessWidget {
  const EmptyChartDataWidget({
    Key? key,
    this.title,
    this.padding,
  }) : super(key: key);

  final String? title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(title ?? 'No data provided yet.'.tr),
    );
  }
}
