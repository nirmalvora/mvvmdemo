import 'package:flutter/cupertino.dart';
import 'package:mvvmdemo/core/locator/locator.dart';
import 'package:mvvmdemo/core/viewmodel/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Function(T) onModelReady;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  BaseView({required this.onModelReady, required this.builder});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();
  @override
  void initState() {
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
