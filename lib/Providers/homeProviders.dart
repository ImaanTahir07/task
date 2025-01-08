import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/HomeModel.dart';
import '../Repository/homeRepository.dart';

final fetchDataProvider = FutureProvider((ref) async {
  final homeRepo = ref.watch(homeRepositoryProvider);
  ref.read(homeNotifierProvider.notifier).loading=true;
  final data = await homeRepo.getData();
  ref.read(homeNotifierProvider.notifier).setData(data);
  return data;
});

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, dynamic>((ref) {
  return HomeNotifier();
});

final homeRepositoryProvider = Provider((ref) => HomeRepository());
