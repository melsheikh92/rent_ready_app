import 'package:flutter/material.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_bloc.dart';

class AccountsData {
  List<AccountModel> accounts;
  AccountsData({@required this.accounts});
  AccountsData.fromJson(Map<String, dynamic> json) {
    accounts =
        (json['value'] as List).map((e) => AccountModel.fromJson(e)).toList();
  }
}

class AccountModel {
  String name;
  String image;
  String address1Line1;
  String accountNumber;
  int stateCode;
  String address1StateOrProvince;
  String emailaddress1;
  String websiteurl;
  String address1City;
  dynamic revenue;

  AccountModel(
      {this.name,
      this.revenue,
      this.address1StateOrProvince,
      this.accountNumber,
      this.websiteurl,
      this.emailaddress1,
      this.address1City,
      this.address1Line1,
      this.stateCode,
      this.image});

  AccountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['cr0fa_image'];
    address1Line1 = json['address1_line1'];
    address1City = json['address1_city'];
    accountNumber = json['accountnumber'];
    stateCode = json['statecode'];
    address1StateOrProvince = json['address1_stateorprovince'];
    emailaddress1 = json['emailaddress1'];
    websiteurl = json['websiteurl'];
    revenue = json['revenue'];
  }
}
