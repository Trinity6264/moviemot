import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moviemot/dashboard/components/nav_bar_item.dart';
import 'package:moviemot/favorite/page/favorite_page.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:moviemot/home/page/home_page.dart';
import 'package:moviemot/settings/page/settings_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState<int>(0);

    useEffect(() {
      context.read<HomeBloc>().add(const HomeEvent.fetchedData());
      return () {};
    }, []);

    return Scaffold(
      body: Builder(builder: (context) {
        if (index.value == 1) {
          return const FavoritePage();
        } else if (index.value == 2) {
          return const SettingsPage();
        }
        return const HomePage();
      }),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavBarItem(
              icon: Icons.home,
              isSelected: index.value == 0,
              onTap: () {
                index.value = 0;
              },
              title: "Home",
            ),
            NavBarItem(
              icon: Icons.favorite,
              isSelected: index.value == 1,
              onTap: () {
                index.value = 1;
              },
              title: "Favorite",
            ),
            NavBarItem(
              icon: Icons.settings,
              isSelected: index.value == 2,
              onTap: () {
                index.value = 2;
              },
              title: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
