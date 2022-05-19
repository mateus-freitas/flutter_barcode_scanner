import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog<void>(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return const BigProgressIndicator();
      },
      barrierDismissible: false);
}

class BigProgressIndicator extends StatelessWidget {
  const BigProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black45),
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(18),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    ));
  }
}
