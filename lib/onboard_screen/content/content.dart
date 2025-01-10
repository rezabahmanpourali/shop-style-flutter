class ContentOnboard {
  // String image;
  String title;
  String title2;
  String title3;
  String title4;
  String discription;
  String discription2;

  ContentOnboard({
    // required this.image,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.discription,
    required this.discription2,
  });
}

List<ContentOnboard> contents = [
  ContentOnboard(
    // image: 'assets/images/uuacu.jpg',
    title: 'رزرو نوبت به',
    title2: 'آسان',
    title3: 'ترین',
    title4: '!شکل ممکن',
    discription: 'یه زمانی رزرو نوبت آرایشگاه یک چالش ',
    discription2: '!بزرگ بود',
  ),
  ContentOnboard(
    // image: 'assets/images/uuacu.jpg',
    title: 'رزرو نوبت به',
    title2: 'سریع',
    title3: 'ترین',
    title4: '!شکل ممکن',
    discription: 'یه زمانی برای رزرو نوبت باید تا ',
    discription2: '!آرایشگاه میرفتی',
  ),
  ContentOnboard(
    // image: 'assets/images/uuacu.jpg',
    title: 'لذت اصلاح با',
    title2: 'حرفه ای',
    title3: 'ترین',
    title4: '!آرایشگر ها',
    discription: '!آرایشگرهای ما امتحانشونُ پس دادن',
    discription2: '',
  ),
];
