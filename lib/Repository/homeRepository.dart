import 'package:dio/dio.dart';

class HomeRepository{
  Dio dio = Dio();
Future getData()async{
  var url = "https://jsonplaceholder.typicode.com/users";
  var response = await dio.get(url);
  if(response.statusCode==200){
    return response.data;
  }else{
    return "";
  }
}
}