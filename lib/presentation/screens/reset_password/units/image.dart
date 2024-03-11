part of "../view.dart";

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getAssetPNGPath('splash'),
      width: 132.width,
      height: 132.height,
    );
  }
}
