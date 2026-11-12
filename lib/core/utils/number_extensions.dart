extension ThousandsSeparator on int {
  /// 4000000 -> "4,000,000"
  String get withThousandsSeparator => toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (_) => ',',
      );
}
