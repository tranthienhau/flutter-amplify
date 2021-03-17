import 'dart:developer';

import 'package:fl_template/ui/pages/home/home_viewmodel.dart';
import 'package:fl_template/ui/shared/partial_viewmode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends ViewModelBuilderWidget<HomeViewModel> {
  final String argument;

  HomePage({Key key, this.argument}) : super(key: key);

  @override
  bool get reactive => false;

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget child) {
    log('HomePage build: called');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TitleSection(),
            Spacer(),
            BottomSection()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: model.updateCounter
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    final model = HomeViewModel();
    model.init(this.argument);
    return model;
  }
}

class TitleSection extends PartialViewModelWidget<HomeViewModel, String> {
  @override
  Widget build(BuildContext context, String data) {
    log('Titlesection build: called');
    return Container(
      child: Text(data, style: TextStyle(color: Color.fromRGBO(125, 125, 125, 1))),
      margin: const EdgeInsets.all(100),
    );
  }

  @override
  String buildPartialData(HomeViewModel viewModel) {
    return viewModel.title;
  }


}

class BottomSection extends PartialViewModelWidget<HomeViewModel, String> {

  @override
  Widget build(BuildContext context, String data) {
    log('Bottom Section build: called');
    return Container(
      child: Text(data, style: TextStyle(color: Color.fromRGBO(125, 125, 125, 1))),
      margin: const EdgeInsets.all(20),
    );
  }

  @override
  String buildPartialData(HomeViewModel viewModel) {
    return viewModel.bottomTitle;
  }

}

// class TitleSection extends ViewModelWidget<HomeViewModel> {
//   @override
//   Widget build(BuildContext context, HomeViewModel data) {
//     log('Titlesection build: called');
//     return Container(
//       child: Text(data.title, style: TextStyle(color: Color.fromRGBO(125, 125, 125, 1))),
//       margin: const EdgeInsets.all(100),
//     );
//   }
//
// }
//
// class BottomSection extends ViewModelWidget<HomeViewModel> {
//
//   @override
//   Widget build(BuildContext context, HomeViewModel data) {
//     log('Bottom Section build: called');
//     return Container(
//       child: Text(data.bottomTitle, style: TextStyle(color: Color.fromRGBO(125, 125, 125, 1))),
//       margin: const EdgeInsets.all(20),
//     );
//   }
//
// }
