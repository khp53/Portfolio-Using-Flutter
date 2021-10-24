import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel.dart';

//----------------------------------------------------------------------------
// Default View is with Selector and ChangeNotifierProvier
// Don't do anything with this file
//----------------------------------------------------------------------------

class View extends StatelessWidget {
  final Widget Function(
      BuildContext context, Viewmodel viewmodel, Widget? child) _builder;

  final Widget Function(BuildContext context, Viewmodel viewmodel)
      _progressBuilder;
  final Viewmodel _viewmodel;

  // ignore: use_key_in_widget_constructors
  const View({@required builder, @required viewmodel, progressBuilder})
      : _builder = builder,
        _viewmodel = viewmodel,
        _progressBuilder = progressBuilder;

  Widget _baseBuilder(
      BuildContext context, Viewmodel viewmodel, Widget? child) {
    if (viewmodel.busy) {
      if (_progressBuilder != null) return _progressBuilder(context, viewmodel);
      return const Center(child: CircularProgressIndicator());
    }

    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _viewmodel,
        child: Consumer<Viewmodel>(builder: _baseBuilder),
      );
}
