import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:social_champ_task/Routes/app_routes_config.dart';

final goRouterProvider = Provider<GoRouter>((ref)=>AppRoutes().router);