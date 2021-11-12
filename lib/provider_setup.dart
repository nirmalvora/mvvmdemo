import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/enums/connection_status.dart';
import 'core/helper/connectivity.dart';
import 'core/locator/locator.dart';
import 'core/providers/user_data_provider.dart';
import 'core/viewmodel/network_view_model.dart';

List<SingleChildWidget> providers = [
  //...independentServices,
  //...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  //Provider.value(value: API())
];

List<SingleChildWidget> dependentServices = [
/*ProxyProvider<API, AuthenticationService>(
      update: (context, api, authenticationService) =>
          AuthenticationService(api: api))*/
];

List<SingleChildWidget> uiConsumableProviders = [
  ValueListenableProvider<ConnectivityResult>.value(
      value: locator<NetworkViewModel>().connectivityResultStatus),
  StreamProvider<ConnectionStatus>.value(
    value: ConnectivityService().connectivityController.stream,
    initialData: ConnectionStatus.offline,
  ),
  ChangeNotifierProvider(create: (_) => UserDataProvider()),
];
