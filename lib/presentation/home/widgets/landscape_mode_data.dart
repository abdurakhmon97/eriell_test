import 'package:eriell/presentation/home/bloc/home_bloc.dart';
import 'package:eriell/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LandscapeModeData extends StatelessWidget {
  final HomeBloc bloc;

  const LandscapeModeData({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      thumbVisibility: true,
      child: CupertinoScrollbar(
        thumbVisibility: true,
        notificationPredicate: (notif) => notif.depth == 1,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                bool onSort = false;
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
                      label: Text("Company"),
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
        ),
      ),
    );
  }
}
