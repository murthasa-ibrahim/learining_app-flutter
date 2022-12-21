import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashBordController extends GetxController{

  String getdate(DateTime value ){
       return  DateFormat('MMM dd yyyy').format(value);
  }

  String getTime(DateTime value ){
       return  DateFormat('h:mm a').format(value);
  }

}