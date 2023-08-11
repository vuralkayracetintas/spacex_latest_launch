// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:spacex_latest_launch/bloc/spacex_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.size,
    required this.state,
  }) : super(key: key);

  final Size size;
  final SpacexLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                state.spacexModel.links.patch.small,
              ),
            ),
            Center(
              child: Column(
                // final crewMember = state.spacexModel.crew[index];
                children: [
                  Text(
                    state.spacexModel.name, // modelname,
                    style: context.general.textTheme.displayMedium,
                  ),
                  Text(state.spacexModel.dateLocal.toString()),
                  Text(state.spacexModel.dateUtc.toString()),
                  Text(state.spacexModel.links.webcast),
                  Text(state.spacexModel.links.patch.small),
                  Text(state.spacexModel.links.reddit.launch),

                  //Text(state.spacexModel.links.reddit.media), // null
                  //Text(state.spacexModel.launch.toString()), // null
                  //Text(state.spacexModel.links.flickr.original[index])
                  // Text("${StringConstans.crewMember} :  $crewMember"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
