
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier {
  HomeNotifier() : super([]){
  }

  var loading =false;
  void setData(dynamic data) {
    loading =false;
    state = data;
  }

  void deleteItem(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void addUser(dynamic user){
    state = [...state,user];
    print(state);
  }
}
