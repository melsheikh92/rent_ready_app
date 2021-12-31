import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';

class FiltersWidget extends StatelessWidget {
  final List<UIAccountModel> accounts;
  final List<String> allStates;
  final Function onFiltersChanged;
  final Filters filtersModel;

  FiltersWidget(
      {@required this.accounts,
      @required this.allStates,
      @required this.onFiltersChanged,
      @required this.filtersModel});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = filtersModel.searchText;
    return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24)),
            height: 60,
            child: TextField(
              controller: _textEditingController,
              onChanged: (txt) async {
                await Future.delayed(const Duration(seconds: 2));
                if (txt != filtersModel.searchText) {
                  filtersModel.searchText = txt;
                  onFiltersChanged(filtersModel);
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.greenAccent.withOpacity(0.3),
                hintText: AppStrings.search,
                contentPadding: EdgeInsets.all(16),
                suffixIcon: Icon(Icons.search,
                    color: Theme.of(context).iconTheme.color),
                border: InputBorder.none,
              ),
            ),
          ),),
          SizedBox(
            width: 16,
          ),
          PopupMenuButton(
              onSelected: (txt) {
                filtersModel.filterValue = txt;
                onFiltersChanged(filtersModel);
              },
              child: Icon(
                Icons.filter_alt,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              itemBuilder: (context) => allStates
                  .map((e) => PopupMenuItem(
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        value: e,
                      ))
                  .toList()),
          SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              filtersModel.isGrid = !filtersModel.isGrid;
              onFiltersChanged(filtersModel);
            },
            child: Icon(
              filtersModel.isGrid ? Icons.list_sharp : Icons.grid_on,
              color: Theme.of(context).iconTheme.color,
              size: 30,
            ),
          ),
          SizedBox(
            width: 16,
          )
        ]);
  }
}

class Filters extends Equatable {
  Filters(
      {this.searchText = null, this.filterValue = null, this.isGrid = true});

  String searchText;
  bool isGrid;
  String filterValue;

  @override
  List<Object> get props => [searchText, isGrid, filterValue];
}
