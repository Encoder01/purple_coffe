import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/empty_fortune.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/core/constants/functions.dart';

import '../../../../config/routes/router.gr.dart';

class MyFortuneTells extends StatefulWidget {
  MyFortuneTells({Key? key, required this.user, required this.onTap})
      : super(key: key);
  final AppUserModel user;
  Function(int) onTap;

  @override
  State<MyFortuneTells> createState() => _MyFortuneTellsState();
}

class _MyFortuneTellsState extends State<MyFortuneTells>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    BlocProvider.of<FortuneBloc>(context).add(GetMyFortunes(widget.user.uid!));
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Gelen Kutusu",
                  style: TextStyle(
                      color: Themes.mainColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            controller: controller,
            indicatorColor: Themes.subColor,
            tabs: [
              Tab(
                child: Text(
                  "Fallarım",
                  style: TextStyle(color: Themes.mainColor, fontSize: 15),
                ),
              ),
              Tab(
                child: Text(
                  "Bildirimler",
                  style: TextStyle(color: Themes.mainColor, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<FortuneBloc>(context)
                    .add(GetMyFortunes(widget.user.uid!));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: BlocBuilder<FortuneBloc, FortuneState>(
                  builder: (context, state) {
                    if (state is FortuneLoaded) {
                      final List<FortuneTells> fortuneTels = state.fortuneTells;
                      if (fortuneTels.isEmpty) {
                        return Center(
                          child: EmptyFortuneWidget(
                            user: widget.user,
                          ),
                        );
                      } else {
                        return ListView.separated(
                          itemCount:
                              fortuneTels.isEmpty ? 1 : fortuneTels.length,
                          itemBuilder: (context, index) {
                            final FortuneTells fortuneIndex =
                                fortuneTels[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ListTile(
                                onTap: () {
                                  if (fortuneIndex.isDone!) {
                                    context.navigateTo(
                                      FortuneDetail(fortuneTells: fortuneIndex),
                                    );
                                  }
                                },
                                contentPadding: const EdgeInsets.all(5),
                                minLeadingWidth: 3,
                                minVerticalPadding: 5,
                                title: Text(
                                  !fortuneIndex.isDone!
                                      ? "Kahve Falın Hazırlanıyor"
                                      : "Kahve Falın",
                                  style: TextStyle(
                                    color: Themes.mainColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "${formatDate(fortuneIndex.createDate!)}-${fortuneIndex.fortuneId!}",
                                  style: TextStyle(
                                    color: Themes.mainColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white,
                              ),
                            );
                          },
                        );
                      }
                    } else if (state is FortuneLoading) {
                      return Center(
                        child: PlatformCircularProgressIndicator(),
                      );
                    } else if (state is ErrorFortuneLoad) {
                      return Center(
                        child: EmptyFortuneWidget(user: widget.user),
                      );
                    } else {
                      return Center(
                        child: EmptyFortuneWidget(user: widget.user),
                      );
                    }
                  },
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<FortuneBloc>(context)
                    .add(GetMyFortunes(widget.user.uid!));
              },
              child: BlocBuilder<FortuneBloc, FortuneState>(
                builder: (context, state) {
                  if (state is FortuneLoaded) {
                    final List<FortuneTells> userNotif = state.fortuneTells;
                    if (userNotif.isEmpty) {
                      return Center(
                        child: EmptyFortuneWidget(
                          user: widget.user,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: userNotif.isEmpty ? 1 : userNotif.length,
                        itemBuilder: (context, index) {
                          final String notifIndex =
                              userNotif[index].fortuneNotif!;
                          if (notifIndex == "") {
                            return const SizedBox();
                          }
                          return Center(
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(5),
                                  minLeadingWidth: 3,
                                  minVerticalPadding: 5,
                                  title: Text(
                                    notifIndex,
                                    style: TextStyle(
                                      color: Themes.mainColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  } else if (state is UserLoading) {
                    return Center(
                      child: PlatformCircularProgressIndicator(),
                    );
                  } else if (state is ErrorUserLoad) {
                    return Center(
                      child: EmptyFortuneWidget(user: widget.user),
                    );
                  } else {
                    return Center(
                      child: EmptyFortuneWidget(user: widget.user),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
