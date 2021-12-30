import 'package:rent_ready_app/resources/assets_svg_generated.dart';
import 'package:flutter/material.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';

class _SuccessBottomSheet extends StatelessWidget {
  final GestureTapCallback onClose;
  final GestureTapCallback onDone;
  final String successMessage;
  final Widget imageIcon;
  final String title;
  final String actionTitle;

  const _SuccessBottomSheet(
      {Key key,
        this.onClose,
        this.onDone,
        this.successMessage,
        this.imageIcon,
        this.title,
        this.actionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          backgroundColor: const Color(0xff343235).withOpacity(.6),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                    color: Theme.of(context).bottomSheetTheme.backgroundColor,
                    child: _buildSuccessWidget(context)),
              ),
            ],
          )),
    );
  }

  Widget _buildSuccessWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: onClose,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              imageIcon,
              const SizedBox(
                height: 24,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(successMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: onDone,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    actionTitle ?? "Done", //TODO Replace text
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<SuccessActions> showSuccessBottomSheet(BuildContext context,
    {@required String successMessage}) {
  return showGeneralDialog<SuccessActions>(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
        _SuccessBottomSheet(
          onDone: () {
            Navigator.of(context).pop(SuccessActions.ACTION_DONE);
          },
          onClose: () {
            Navigator.of(context).pop(SuccessActions.ACTION_CLOSE);
          },
          successMessage: successMessage,
          title: AppStrings.success,
          imageIcon:
          SvgImagesProvider.getWidget(context, assetName: AppSVGAssets.success),
        ),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
  );
}

Future<NoticeActions> showNoticeBottomSheet(BuildContext context,
    {@required String successMessage,
      String title,
      String actionTitle,
      Widget image}) {
  return showGeneralDialog<NoticeActions>(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
        _SuccessBottomSheet(
          onDone: () {
            Navigator.of(context).pop(NoticeActions.ACTION_OK);
          },
          onClose: () {
            Navigator.of(context).pop(NoticeActions.ACTION_CLOSE);
          },
          successMessage: successMessage,
          title: title ?? AppStrings.notice,
          imageIcon: image ??
              SvgImagesProvider.getWidget(context,
                  assetName: AppSVGAssets.noticeIcon),
          actionTitle: actionTitle,
        ),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
  );
}

Future<SuccessActions> showFailureBottomSheet(BuildContext context,
    {@required String failureMessage}) {
  return showGeneralDialog<SuccessActions>(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
        _SuccessBottomSheet(
          onDone: () {
            Navigator.of(context).pop(SuccessActions.ACTION_DONE);
          },
          onClose: () {
            Navigator.of(context).pop(SuccessActions.ACTION_CLOSE);
          },
          successMessage: failureMessage,
          title: AppStrings.failed,
          imageIcon:
          SvgImagesProvider.getWidget(context, assetName: AppSVGAssets.error),
        ),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 300),
  );
}

enum NoticeActions {
  ACTION_OK,
  ACTION_CLOSE,
}

enum SuccessActions {
  ACTION_DONE,
  ACTION_CLOSE,
}
