import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';
import 'package:godofdiscipline/screens/search_screen/widgets/last_requests.dart';
import 'package:godofdiscipline/screens/search_screen/widgets/search_field.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController serchCtrl;

  final getIt = GetIt.I;

  void _clearSearch() {
    setState(() {
      serchCtrl.text = '';
    });
  }

  void _clearHistory() {
    setState(() {
      getIt.get<AppUser>().searchHistory.clear();
    });
  }

  void _deleteSearchField(int index) {
    setState(() {
      getIt.get<AppUser>().searchHistory.removeAt(index);
    });
  }

  @override
  void dispose() {
    serchCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    serchCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Поиск',
          style: TextStyle(
            color: Color(0xFF071A2F),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SerchField(
              controller: serchCtrl,
              clearSearch: _clearSearch,
            ),
            const SizedBox(
              height: 34,
            ),
            LastRequests(
              searchHistory: getIt.get<AppUser>().searchHistory,
              deleteSearchField: _deleteSearchField,
              clearHistory: _clearHistory,
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  TOutlineButton(
                    text: 'Отмена',
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TElevatedButton(
                    text: 'Найти',
                    onTap: () {
                      setState(() {
                        GetIt.I.get<AppUser>().searchHistory.add(
                              serchCtrl.text.trim(),
                            );
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
