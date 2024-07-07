import 'package:flutter/material.dart';
import 'package:fast_cli_demo/app/constants.dart';
import 'package:fast_cli_demo/app/text_theme.dart';
import 'package:fast_cli_demo/app/theme.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String provider;
  final Function onPressed;
  final bool isWide;

  const SocialLoginButton({
    Key? key,
    required this.image,
    required this.provider,
    required this.onPressed,
    this.isWide = false,
  }) : super(key: key);

  const SocialLoginButton.wide({
    Key? key,
    required this.image,
    required this.provider,
    required this.onPressed,
  })  : isWide = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: provider == 'Apple' ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(isWide ? 4 : 40),
        border: Border.all(color: context.primary, width: 1),
      ),
      child: InkWell(
        onTap: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  image,
                  width: 40,
                ),
              ),
              if (isWide) ...[
                gap8,
                Text(
                  'Continue with $provider',
                  style: context.bodyLarge.bold.copyWith(
                    color: provider == 'Apple' ? Colors.white : context.primary,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
