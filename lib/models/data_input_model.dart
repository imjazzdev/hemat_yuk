class DataInput {
  final String dana, gopay, ovo, date_time, user;

  DataInput({
    required this.dana,
    required this.gopay,
    required this.ovo,
    required this.date_time,
    required this.user,
  });

  Map<String, dynamic> toJson() => {
        'dana': dana,
        'gopay': gopay,
        'ovo': ovo,
        'date_time': date_time,
        'user': user
      };
}
