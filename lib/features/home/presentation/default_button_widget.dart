import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/utils.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onPressed;
  final bool isOutlined;
  final bool withIcon;
  final IconData icon;

  const DefaultButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.onPressed,
    this.isOutlined = false,
    this.withIcon = false,
    this.icon = Icons.arrow_forward,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme.titleSmall;
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.01),
      child: SizedBox(
        width: screenWidth!,
        height: screenHeight! * 0.06,
        child: isOutlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: theme.outlinedButtonTheme.style?.copyWith(
                  backgroundColor: MaterialStateProperty.all(backgroundColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(withIcon)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        icon,
                        color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
                      ),
                    ),
                    Text(
                      text,
                      style: textTheme?.copyWith(color: foregroundColor),
                    ),
                  ],
                ),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kPadding * 3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(withIcon)
                      Icon(
                        icon,
                        color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
                      ),
                    Text(
                      text,
                      style: textTheme?.copyWith(color: foregroundColor),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
