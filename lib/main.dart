import 'package:flutter/material.dart';
import 'app.dart';
import 'services/ads_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdsService.init();
  runApp(const AuroraApp());
}
