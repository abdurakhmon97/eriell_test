import 'package:eriell/presentation/home/bloc/home_bloc.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:eriell/gen/colors.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class PortraitModeData extends StatelessWidget {
  const PortraitModeData({
    Key? key,
    required this.radius,
    required this.bloc,
  }) : super(key: key);

  final double radius;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            'Top-4 most popular social media platforms',
            style: AppStyle.interW500x12WBlack,
          ),
          const SizedBox(height: 16),
          PieChart(
            chartLegendSpacing: 45,
            initialAngleInDegree: 0,
            dataMap: bloc.pieChartData,
            chartType: ChartType.disc,
            animationDuration: const Duration(milliseconds: 800),
            colorList: const [
              ColorName.red,
              ColorName.green,
              ColorName.blue,
              ColorName.yellowOcher,
            ],
            chartRadius: radius,
            legendOptions: const LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.top,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              decimalPlaces: 0,
              showChartValues: true,
              showChartValuesOutside: true,
              showChartValueBackground: false,
              showChartValuesInPercentage: true,
              chartValueStyle: AppStyle.interW500x12WBlack,
            ),
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                bool onSort = true;
                if (state is HomeOnSortState) {
                  onSort = state.onSort;
                }
                return DataTable(
                  sortAscending: onSort,
                  sortColumnIndex: 0,
                  columnSpacing: 38,
                  border: const TableBorder(
                      verticalInside: BorderSide(color: ColorName.black),
                      horizontalInside: BorderSide(
                        color: ColorName.black,
                      )),
                  columns: const [
                    DataColumn(
                      label: Text("Platform"),
                    ),
                    DataColumn(
                      label: Text("Revenue (USD)"),
                    ),
                    DataColumn(
                      label: Text("Active users"),
                    ),
                    DataColumn(
                      label: Text("Origin country"),
                    ),
                    DataColumn(
                      label: Text("CEO"),
                    ),
                  ],
                  rows: bloc.dummyData
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(
                              Text(data.platform),
                            ),
                            DataCell(
                              Text(data.revenue),
                            ),
                            DataCell(
                              Text(data.activeUsers),
                            ),
                            DataCell(
                              Text(data.originCountry),
                            ),
                            DataCell(
                              Text(data.ceo),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
