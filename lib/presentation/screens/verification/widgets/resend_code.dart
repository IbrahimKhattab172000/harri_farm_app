part of '../view.dart';

class _ResendWidget extends StatefulWidget {
  const _ResendWidget();

  @override
  State<_ResendWidget> createState() => _ResendWidgetState();
}

class _ResendWidgetState extends State<_ResendWidget> {
  int counter = 60;
  Timer? timer;

  @override
  void initState() {
    count();
    super.initState();
  }

  void count() {
    counter = 60;
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      setState(() {});
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (counter != 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "00:${counter.toString().padLeft(2, '0')}",
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: count,
      child: AppText(
        title: "resend_code".tr(),
        decoration: TextDecoration.underline,
        color: AppColors.gray,
        fontSize: 16,
      ),
    );
  }
}
