part of "../view.dart";

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.height,
      width: 300.width,
      child: Center(
        child: Image.asset(
          Utils.getAssetPNGPath("forget_password"),
        ),
      ),
    );
  }
}
