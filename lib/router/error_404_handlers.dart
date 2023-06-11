import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_backend/router/router.dart';
import 'package:dashboard_backend/ui/views/error_404_view.dart';

import '../providers/sidemenu_provider.dart';

class NotPageFoundHandlers {
  static Handler error_404 = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideMenuProvider>(context!, listen: false)
          .setCurrentPageUrl("/404");
      return NoPageFoundView();
    },
  );
}
