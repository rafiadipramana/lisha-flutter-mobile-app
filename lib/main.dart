import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:lisha/app/config/app_colors.dart';
import 'package:lisha/app/global/main_binding.dart';
import 'package:lisha/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final AppLinks appLinks = AppLinks();
  appLinks.uriLinkStream.listen((Uri? uri) {
    if (uri != null) {
      print('Received uri: ${uri}');
    }
  });
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    debug: true,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const LishaApp());
}

class LishaApp extends StatelessWidget {
  const LishaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lisha',
      theme: ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          dividerColor: AppColors.transparent,
        ),
      ),
      initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      routingCallback:(value) {
        print(value?.current);
      },
    );
  }
}
