import 'package:flutter/material.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Column(
      children: [
        Image.asset(AppImages.welcomeImage,
            width: SizeConfig.screenWidth * 0.7),
        SizedBox(height: SizeConfig.verticalSpace),
        Text(tr.personalApp, style: Theme.of(context).textTheme.headline5),
        Text(
          tr.appTitle.toUpperCase(),
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Bebas',
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: SizeConfig.verticalSpace),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
