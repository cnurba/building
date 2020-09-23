import 'package:building/blocs/report_menu_bloc/report_menu_bloc.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_state.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportMenuBloc, ReportMenuState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is InitializedReportState) {
          final reportDetailList = state.reportDetailList;
          return Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                color: CONSTANTS.mainBackgroundColor,
                height: MediaQuery.of(context).size.height * 0.045,
              ),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                  color: CONSTANTS.mainBackgroundColor,
                  height: 2.0,
                ),
                itemCount: reportDetailList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.only(left: 35.0,top: 5.0,bottom: 8.0, right: 8.0),
                    width: MediaQuery.of(context).size.width-85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height:3.0 ,
                        ),
                        Text(
                        reportDetailList[index].subconto,
                        style: TextStyle(
                          color: CONSTANTS.mainBtnColor3,
                        ),
                        ),

                        SizedBox(
                          height:5.0 ,
                                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("${reportDetailList[index].currencyAmount}"),
                            Text("${reportDetailList[index].amount}"),
                          ],
                        ),
                        SizedBox(
                          height:5.0 ,
                        ),

                        Text(
                          "${reportDetailList[index].comment}",
                          style: TextStyle(color: CONSTANTS.mainBtnColor5),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
