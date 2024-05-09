import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportChart extends StatefulWidget {
  ReportChart({Key? key}) : super(key: key);
  @override
  _ReportChartState createState() => _ReportChartState();
}

class _ReportChartState extends State<ReportChart> {
  List<_SalesData> data = [
    _SalesData('07', 75),
    _SalesData('08', 74),
    _SalesData('09', 71),
    _SalesData('10', 70),
    _SalesData('11', 75)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Weight',
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            )
          ],
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
