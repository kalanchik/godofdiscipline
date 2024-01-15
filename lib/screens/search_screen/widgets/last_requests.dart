import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastRequests extends StatelessWidget {
  const LastRequests({
    super.key,
    required this.searchHistory,
    required this.deleteSearchField,
    required this.clearHistory,
    required this.selectRequest,
  });

  final List<String> searchHistory;
  final void Function(int index) deleteSearchField;
  final VoidCallback clearHistory;
  final void Function(String item) selectRequest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          searchHistory.isEmpty
              ? const SizedBox.shrink()
              : const Row(
                  children: [
                    Text(
                      'Последние поисковые запросы',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF798994),
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 11,
          ),
          searchHistory.isEmpty
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBFDFC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            ...List.generate(
                              searchHistory.length,
                              (index) => Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    selectRequest(searchHistory[index]);
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            searchHistory[index],
                                            style: const TextStyle(
                                              color: Color(0xFF798994),
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              onTap: () {
                                                deleteSearchField(index);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                height: 20,
                                                width: 20,
                                                child: SizedBox(
                                                  height: 11,
                                                  width: 11,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/close.svg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 29,
          ),
          searchHistory.isEmpty
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: clearHistory,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Text(
                          'Очистить журнал поиска',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF00A7FF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
