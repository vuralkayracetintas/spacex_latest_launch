import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:spacex_latest_launch/bloc/spacex_states.dart';
import 'package:spacex_latest_launch/feature/widgets/custom_circle_progress.dart';
import 'package:spacex_latest_launch/feature/widgets/custom_link_text_widget.dart';
import 'package:spacex_latest_launch/product/constans/string_constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.size,
    required this.state,
    required this.index,
  }) : super(key: key);

  final Size size;
  final SpacexLoadedState state;
  final int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var crewMember = widget.state.spacexModel.crew[widget.index];
    final Uri urlReddit =
        Uri.parse(widget.state.spacexModel.links.reddit.launch);
    final Uri urlYoutube = Uri.parse(widget.state.spacexModel.links.webcast);
    final Uri urlWikipedia =
        Uri.parse(widget.state.spacexModel.links.wikipedia);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: context.padding.low,
        child: FutureBuilder<void>(
          future: precacheImage(
              NetworkImage(widget.state.spacexModel.links.patch.small),
              context),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomCircleProgress());
            } else if (snapshot.hasError) {
              return const Center(child: Text(StringConstans.errorLoadData));
            } else {
              return Center(
                child: Column(
                  children: [
                    Image.network(
                      widget.state.spacexModel.links.patch.small,
                    ),
                    Text(widget.state.spacexModel.name,
                        style: context.general.textTheme.displayMedium!
                            .copyWith(fontFamily: 'Schyler')),
                    Text(
                      'Crew- 5',
                      style: TextStyle(fontFamily: 'Schyler'),
                    ),
                    for (crewMember in widget.state.spacexModel.crew)
                      Row(
                        children: [
                          Padding(
                            padding: context.padding.low,
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(StringConstans.spacemanImage),
                            ),
                          ),
                          SizedBox(
                            width: widget.size.width * 0.05,
                          ),
                          Text(crewMember),
                        ],
                      ),
                    Text(
                      '${StringConstans.date}${extractDate(widget.state.spacexModel.dateUtc.toString())}',
                      style: context.general.textTheme.titleLarge,
                    ),
                    Text(
                      '${StringConstans.flightNumber} ${widget.state.spacexModel.flightNumber.toString()}',
                      style: context.general.textTheme.titleLarge,
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextReddit,
                      url: urlReddit,
                      titleText: StringConstans.titleReddit,
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextYoutube,
                      url: urlYoutube,
                      titleText: StringConstans.titleYoutube,
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextWiki,
                      url: urlWikipedia,
                      titleText: StringConstans.titleWiki,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    ));
  }

  String extractDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate =
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    return formattedDate;
  }
}
