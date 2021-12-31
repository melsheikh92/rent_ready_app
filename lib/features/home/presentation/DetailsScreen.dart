import 'package:flutter/material.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_bloc.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';

class DetailsScreen extends StatelessWidget {
  final UIAccountModel _accountModel;

  DetailsScreen(this._accountModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: _accountModel == null
          ? Center(
              child: Text(
                AppStrings.accountDetailsTitle,
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    _accountModel.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsState,
                      details: _accountModel.address1StateOrProvince),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsStateCode,
                      details: _accountModel.stateCode.toString()),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsAccountnumber,
                      details: _accountModel.accountNumber),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsAddress,
                      details: _accountModel.address1Line1),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsCity,
                      details: _accountModel.addressCity),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsWebsite,
                      details: _accountModel.website),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsEmail,
                      details: _accountModel.email),
                  SizedBox(
                    height: 8,
                  ),
                  _buildRow(
                      context: context,
                      title: AppStrings.accountDetailsRevenue,
                      details: (_accountModel.revenue ?? "-").toString()),
                ]),
    );
  }

  Widget _buildRow(
      {@required BuildContext context,
      @required String title,
      @required String details}) {
    return Row(
      children: [
        Text(title + ":", style: Theme.of(context).textTheme.headline6),
        SizedBox(
          width: 20,
        ),
        Text(
          details ?? "-",
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
