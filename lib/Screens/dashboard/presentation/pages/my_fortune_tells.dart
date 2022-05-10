import 'package:flutter/material.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/get_fortune_usecase.dart';
import 'package:purple_coffe/injection_container.dart';

import '../../../../config/themes/themes.dart';
import '../../../../core/params/get_fortune_params.dart';

class MyFortuneTells extends StatefulWidget {
  MyFortuneTells({Key? key, required this.fortuneIds}) : super(key: key);
  final List<String> fortuneIds;

  @override
  State<MyFortuneTells> createState() => _MyFortuneTellsState();
}

class _MyFortuneTellsState extends State<MyFortuneTells>
    with TickerProviderStateMixin {
  GetFortuneUseCase getUserUseCase = serviceLocator();
  List<FortuneTells> fortuneTels = [];

  @override
  void initState() {
    getUserUseCase = serviceLocator();
    getFortunes();
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  getFortunes() async {
    final result = await getUserUseCase
        .call(GetFortuneParams(fortuneIds: widget.fortuneIds));
    print(widget.fortuneIds);
    result.fold((failure) {}, (success) {
      fortuneTels = success;
      print(fortuneTels.first.userId);
      setState(() {});
    });
  }

  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo/title_tr.png",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Gelen Kutusu",
                  style: TextStyle(
                      color: Themes.subColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
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
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.separated(
                itemCount: fortuneTels.isEmpty ? 1 : fortuneTels.length,
                itemBuilder: (context, index) {
                  if (fortuneTels.isEmpty) {
                    return const Center(child: Text("Gelen Kutunuz boş"));
                  } else {
                    return ListTile(
                      onTap: () {

                      },
                      leading: !fortuneTels[index].isDone!
                          ? const Icon(Icons.mark_email_unread)
                          : const SizedBox(),
                      contentPadding: const EdgeInsets.all(5),
                      minLeadingWidth: 3,
                      minVerticalPadding: 5,
                      title: Text(
                        !fortuneTels[index].isDone!
                            ? "Kahve Falın Hazırlanıyor"
                            : "Kahve Falın",
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "${DateTime.now().toLocal()}-${fortuneTels[index]
                            .userId!}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    );
                  }
                }, separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              ),
            ),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
