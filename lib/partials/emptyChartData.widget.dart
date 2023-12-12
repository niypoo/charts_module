import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(UniconsLine.chart, size: 20.sp),
        SizedBox(height: 5.sp),
        Text(title ?? 'No data provided yet.'.tr),
      ],
    );
  }
}
