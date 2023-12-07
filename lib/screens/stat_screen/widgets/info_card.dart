import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String header;
  final String body;
  final String bodyInfo;
  final bool isAlert;
  const InfoCard({
    super.key,
    required this.header,
    required this.body,
    required this.bodyInfo,
    required this.isAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFDFC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  header,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF071A2F),
                  ),
                ),
                isAlert
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: Image.asset('assets/icons/alert.png'),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    body,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF798994),
                    ),
                  ),
                  Text(
                    bodyInfo,
                    style: TextStyle(
                      color: isAlert
                          ? const Color(0xFFEA0001)
                          : const Color(0xFF798994),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
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
