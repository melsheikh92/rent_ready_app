import 'package:flutter/material.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_bloc.dart';

class ItemWidget extends StatelessWidget {
  final UIAccountModel account;
  bool isSelected;
  final Function onPickAccount;
  final bool isGrid;

   ItemWidget(
      {@required this.account,
      @required this.onPickAccount,
      @required this.isGrid,
     this.isSelected = false });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onPickAccount(account);
        },
        child: Card(
            child: Container(
              decoration: BoxDecoration(
                  border: isSelected == true
                      ? Border.all(
                          color: Theme.of(context).accentColor, width: 1)
                      : Border.all(
                          color: Theme.of(context).cardColor, width: 1)),
              padding: const EdgeInsets.all(8.0),
              child: isGrid
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          account.name ?? "-",
                          style: Theme.of(context).textTheme.headline5,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterLogo(
                          size: 80,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: Text(
                          account.name ?? "-",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline3,
                        ))
                      ],
                    ),
            ),
            color: Theme.of(context).cardColor,
            elevation: 12),
      ),
    );
  }
}
