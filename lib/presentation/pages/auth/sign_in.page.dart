import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:steps_tracker_flutter/presentation/config/routes.dart';
import 'package:steps_tracker_flutter/presentation/pages/auth/sign_in.page.controller.dart';
import 'package:steps_tracker_flutter/presentation/pages/auth/widgets/content.dart';
import 'package:steps_tracker_flutter/presentation/pages/auth/widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final fullNameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenPaddingX,
              vertical: SizeConfig.screenPaddingY * 2.4),
          child: Center(
            child: Column(
              children: <Widget>[
                const Content(),
                SizedBox(height: SizeConfig.verticalSpace),
                _buildSignInForm(tr),
                _buildLoginButton(context, ref, tr),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm(AppLocalizations tr) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: fullNameFieldController,
            hintText: tr.enterYourName,
            labelText: tr.fullName,
            keyboardType: TextInputType.emailAddress,
            onSave: (value) {},
            suffixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.emptyError;
              }
              return null;
            },
          ),
          SizedBox(height: SizeConfig.verticalSpace),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
      BuildContext context, WidgetRef ref, AppLocalizations tr) {
    final state = ref.watch(signInPageControllerProvider);
    return ElevatedButton(
      onPressed: state.maybeWhen(
        orElse: () => null,
        data: (data) => () {
          if (_formKey.currentState!.validate()) {
            ref.read(signInPageControllerProvider.notifier).signIn(
                fullName: fullNameFieldController.text,
                next: () => Navigator.of(context)
                    .pushReplacementNamed(Routes.appLayout));
          }
        },
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(SizeConfig.btnWidth, SizeConfig.btnHeight),
        padding: EdgeInsets.symmetric(vertical: SizeConfig.screenPaddingX * 1),
      ),
      child: state.when(
        data: (data) => Text(tr.signIn),
        error: (e, s) => null,
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
