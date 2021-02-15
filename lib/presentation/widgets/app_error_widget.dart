import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget(
      {Key key, @required this.errorType, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? "Failed to connect to TMDB API"
                : "Failed to connect to Internet",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onPressed,
                text: "Retry",
              ),
              Button(
                onPressed: () => Wiredash.of(context).show(),
                text: "Report",
              )
            ],
          )
        ],
      ),
    );
  }
}
