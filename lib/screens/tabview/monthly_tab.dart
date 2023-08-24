import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../../constants/color_contants.dart';
import '../../constants/image_contants.dart';
import '../../models/response_get_report_expense_model.dart';
import '../../services/api_delete_expense.dart';
import '../../services/api_report_expense.dart';
import '../../services/format_date_time.dart';
import '../update_expense_screen.dart';

class MonthlyTab extends StatefulWidget {
  const MonthlyTab({super.key});

  @override
  MonthlyTabState createState() => MonthlyTabState();
}

class MonthlyTabState extends State<MonthlyTab> {
  List<ResponseGetReportExpenseModel> filteredList = [];
  late DateTime startOfMonth;
  late DateTime endOfMonth;
  late DateTimeRange dateRange;
  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    startOfMonth = DateTime(
      now.year,
      now.month,
    );
    endOfMonth = DateTime(now.year, now.month + 1, 0);
    dateRange = DateTimeRange(
      start: startOfMonth,
      end: DateTime.now(),
    );
  }

  // String dateText = 'Select Date';

  @override
  Widget build(BuildContext context) {
    // final start = dateRange.start;
    // final end = dateRange.end;
    // final difference = dateRange.duration;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('For Month'),
            Expanded(
              flex: 6,
              child: FutureBuilder(
                future: ApiReportExpense().reportExpense(
                    startDate:
                        FormatDateTime.formatDate(dateRange.start.toString()),
                    endDate:
                        FormatDateTime.formatDate(dateRange.end.toString())),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      // Filter expenses based on the selected date range
                      filteredList = snapshot.data!
                          .where((reportExpense) =>
                              reportExpense.date
                                  .toLocal()
                                  .isAfter(dateRange.start) &&
                              reportExpense.date
                                  .toLocal()
                                  .isBefore(dateRange.end))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: ColorConstants.colors2,
                                border: Border.all(color: Colors.purple),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  ColorConstants.colors3,
                                              backgroundImage: NetworkImage(
                                                  '${ImageConstants.iconCtgLink1}${snapshot.data?[index].category.image}${ImageConstants.iconCtgLink2}')),
                                          Text(
                                            '${snapshot.data?[index].category.categoryName}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data?[index].title}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                              '${snapshot.data?[index].amount}'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () async {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                UpdateExpenseScreen(
                                                                  expenseId: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  date:
                                                                      '${snapshot.data?[index].date}',
                                                                  title:
                                                                      '${snapshot.data?[index].title}',
                                                                  amount:
                                                                      "${snapshot.data?[index].amount}",
                                                                  categoryId:
                                                                      '${snapshot.data?[index].categoryId}',
                                                                  categoryname:
                                                                      '${snapshot.data?[index].category.categoryName}',
                                                                )));
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color:
                                                        ColorConstants.colors3,
                                                  )),
                                              IconButton(
                                                  onPressed: () async {
                                                    await ApiDeleteExpense()
                                                        .deleteData(
                                                            id: snapshot
                                                                .data![index]
                                                                .id);
                                                    setState(() {});
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  )),
                                            ],
                                          ),
                                          Row(children: [
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data?[index].date.toLocal()}',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
