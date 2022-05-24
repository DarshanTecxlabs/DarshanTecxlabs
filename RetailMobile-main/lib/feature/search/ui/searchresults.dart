import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_bloc.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Searchbloc, SearchState>(builder: (context, state) {
      var searchResults = [];
      if (state is SearchResults) {
        searchResults = (state).lstContractSearch;
      }
      return Scaffold(
        body:ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey, width: 0.2),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2.9,
                          color: Colors.grey.withOpacity(0.05))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    searchResults[index].tsym,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),                              
                                ),
                              ),                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ));
    });
  }
}
