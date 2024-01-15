import 'package:api_golden_price/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getSilverPrice()
        ..getGoldPrice(),
      child: BlocConsumer<MainCubit, States>(
        listener: (context, States) {},
        builder: (context, States) {
          return Scaffold(
            backgroundColor: Colors.grey[800],
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TODAY ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "PRICE",
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        shadows: [
                          BoxShadow(
                            color: Colors.yellow[300]!,
                            offset: Offset(0, 0),
                            blurRadius: 2,
                          ),
                        ]),
                  ),
                ],
              )),
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 50, right: 8, left: 8, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "images/golden.png",
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      Text(
                        "GOLD",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 8,
                            shadows: [
                              BoxShadow(
                                color: Colors.yellow[300]!,
                                offset: Offset(1, 2),
                                blurRadius: 2,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${MainCubit.getContext(context).goldI}",
                        style: TextStyle(
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "images/silver.png",
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      Text(
                        "SILVER",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 8,
                            shadows: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 2),
                                blurRadius: 2,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${MainCubit.getContext(context).silverI}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
