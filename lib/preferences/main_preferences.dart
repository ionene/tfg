
import 'package:get_storage/get_storage.dart';

class MainPreferences {

  final box = GetStorage();

  get initialPage {
    return box.read('initialPage') ?? 'login';
  }

  set initialPage(String initialPage) {
    box.write('initialPage', initialPage);
  }
  
  get donePercent {
    return box.read('donePercent') ?? [];
  }

  set donePercent(List<dynamic> donePercent) {
    box.write('donePercent', donePercent);
  }
}
