import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/pages/employee_pages/home_employee.dart';
import 'package:graduation_project/view/pages/employee_pages/search_Employee.dart';
import 'package:meta/meta.dart';
import '../../../model/pharmacy_model.dart';
import '../../../view/pages/user/Chatbot/Chatbot_Screen.dart';
import '../../../view/pages/user/all_device_screen.dart';
import '../../../view/pages/user/all_employee_screen.dart';
import '../../../view/pages/user/medicalDevices.dart';
import '../../../view/pages/user/employee_product.dart';
import '../../../view/pages/user/search_screen.dart';
import '../../../view/pages/user/show_service.dart';
import '../../../view/pages/user/user_home_screen.dart';

part 'layout__state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context)=>BlocProvider.of<LayoutCubit>(context);
  int currentIndex = 0;
  int currentPharamcy = 0;

  List<Widget> screens = [
    HomeUserScreen(),
    AllEmployeeScreen(),
    ChatBot(),
    SearchScreen(),
  ];
  PharmacyModel? EmplyeeModel;
  void x(PharmacyModel pharmacyModel){
    EmplyeeModel = pharmacyModel;
    emit(LayoutChangeBottomNavBarState());

  }
  List<Widget> screenUserPharmacy =
  [
    EmployeeProduct(),
    const ShowServicePharmacy()
  ];
  List<Widget> Pharmacy = [
    const HomePharmacyScreen(),

    const SearchPharmacy(),
  ];
  List<String> titles = [
    'Home',
    'Cleaners',
    'chat Bot'
    'Search',
  ];
  void changeBottomNavBarPharamcy(int index) {
    currentPharamcy = index;
    emit(LayoutChangeBottomNavBarState());
  }
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBarState());
  }


}
