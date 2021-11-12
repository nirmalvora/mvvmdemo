import 'package:flutter/material.dart';
import 'package:mvvmdemo/core/preference/preference_keys.dart';
import 'package:mvvmdemo/core/preference/prerences.dart';
import 'package:mvvmdemo/core/providers/user_data_provider.dart';
import 'package:mvvmdemo/core/routing/routes.dart';
import 'package:mvvmdemo/core/viewmodel/home/home_viewmodel.dart';
import 'package:mvvmdemo/ui/view/base_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserDataProvider? userDataProvider;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        userDataProvider = Provider.of<UserDataProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Preferences.remove(PreferenceKeys.isLogin);
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(userDataProvider!.userName!),
              ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            model.decrementCount();
                          },
                          icon: Icon(Icons.remove)),
                      SizedBox(
                        width: 16,
                      ),
                      Text("${model.count}"),
                      SizedBox(
                        width: 16,
                      ),
                      IconButton(
                          onPressed: () {
                            model.incrementCount();
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
