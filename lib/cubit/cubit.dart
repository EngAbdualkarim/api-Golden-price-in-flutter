

import 'package:api_golden_price/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/dio_helper.dart';

class MainCubit extends Cubit<States>{
  MainCubit():super(InitState());


  static MainCubit getContext(context)=>BlocProvider.of(context);


  double? goldD;
  int? goldI;

  double? silverD;
  int? silverI;

  getGoldPrice(){
    DioHelper.getData("XAU/USD/").then((value) {
      goldD=value.data['price'];
      goldI=goldD!.round();
      print(goldD);
      emit(GetGoldPriceState());
    }).catchError((onError){});

    return goldI;
  }

  getSilverPrice(){
    DioHelper.getData("XAG/USD/").then((value) {
        silverD=value.data['price'];
        silverI=silverD!.round();
        print(silverD);
        emit(GetSilverPriceState());

    }).catchError((onError){});

    return silverI;
  }

}