import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_style/common/configs/colors.dart';

class ShowModelLocation extends StatefulWidget {
  final Function(String) onSelectOption;

  const ShowModelLocation({super.key, required this.onSelectOption});

  @override
  State<ShowModelLocation> createState() => _ShowModelLocationState();
}

class _ShowModelLocationState extends State<ShowModelLocation> {
  List<String> provinces = [
    'آذربایجان شرقی',
    'آذربایجان غربی',
    'اصفهان',
    'البرز',
    'ایلام',
    'بوشهر',
    'تهران',
    'چهارمحال و بختیاری',
    'خراسان جنوبی',
    'خراسان رضوی',
    'خراسان شمالی',
    'خوزستان',
    'زنجان',
    'سمنان',
    'سیستان و بلوچستان',
    'فارس',
    'قزوین',
    'قم',
    'کردستان',
    'کرمان',
    'کرمانشاه',
    'کهگیلویه و بویراحمد',
    'گلستان',
    'گیلان',
    'لرستان',
    'مازندران',
    'مركزی',
    'هرمزگان',
    'همدان',
    'یزد'
  ];

  String selectedCity = 'قم';

  Map<String, LatLng> cityCoordinates = {
    'آذربایجان شرقی': const LatLng(38.0962, 46.2732),
    'آذربایجان غربی': const LatLng(37.4905, 45.3034),
    'اصفهان': const LatLng(32.6559, 51.6740),
    'البرز': const LatLng(35.8694, 50.9877),
    'ایلام': const LatLng(33.6406, 46.4019),
    'بوشهر': const LatLng(28.9257, 50.8383),
    'تهران': const LatLng(35.6892, 51.3890),
    'چهارمحال و بختیاری': const LatLng(32.6343, 50.0797),
    'خراسان جنوبی': const LatLng(32.8693, 59.2194),
    'خراسان رضوی': const LatLng(36.3035, 59.5890),
    'خراسان شمالی': const LatLng(37.3270, 57.0604),
    'خوزستان': const LatLng(31.3207, 48.2935),
    'زنجان': const LatLng(36.6690, 48.4850),
    'سمنان': const LatLng(35.5772, 53.3941),
    'سیستان و بلوچستان': const LatLng(30.2824, 60.3887),
    'فارس': const LatLng(29.5911, 52.5832),
    'قزوین': const LatLng(36.2810, 50.0024),
    'قم': const LatLng(34.5711, 50.8083),
    'کردستان': const LatLng(35.3105, 46.9925),
    'کرمان': const LatLng(30.2832, 57.0743),
    'کرمانشاه': const LatLng(34.3145, 47.0630),
    'کهگیلویه و بویراحمد': const LatLng(30.6363, 51.4243),
    'گلستان': const LatLng(37.3549, 54.0425),
    'گیلان': const LatLng(37.2735, 49.5887),
    'لرستان': const LatLng(33.4811, 48.3543),
    'مازندران': const LatLng(36.5955, 53.0731),
    'مركزی': const LatLng(34.0743, 50.7049),
    'هرمزگان': const LatLng(27.1900, 56.3635),
    'همدان': const LatLng(34.7973, 48.5145),
    'یزد': const LatLng(31.8974, 54.3560),
  };

  final MapController mapController = MapController();
  LatLng? tappedLocation; // ذخیره مختصات کلیک شده
  bool isMarkerVisible = false; // نشان‌دهنده نمایش یا عدم نمایش آیکون

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // دریافت موقعیت مکانی کاربر
  }

  // متد برای دریافت موقعیت مکانی کاربر
  Future<void> _getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng currentLocation = LatLng(position.latitude, position.longitude);
      mapController.move(
          currentLocation, 13); // نقشه را به موقعیت کاربر حرکت می‌دهیم
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.9,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 32, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                ),
                Text(
                  'انتخاب موقعیت مکانی',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: height * 0.7,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: cityCoordinates[selectedCity]!,
                      initialZoom: 13,
                      onTap: (_, latlng) {
                        setState(() {
                          tappedLocation = latlng; // ذخیره مختصات کلیک شده
                          isMarkerVisible = true; // نمایش آیکون
                        });
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      if (isMarkerVisible && tappedLocation != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: tappedLocation!, // مختصات انتخاب شده
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.location_pin,
                                size: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: width * 0.1,
                  child: Container(
                    width: width * 0.8,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 22,
                        ),
                        const Icon(
                          Icons.search,
                          color: AppColors.searchGreyColor,
                          size: 24,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 140,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              hintText: 'جستجو',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 60,
                          child: DropdownButton<String>(
                            value: selectedCity,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCity = newValue!;
                              });

                              // حرکت نرم با انیمیشن
                              _moveMapWithAnimation(
                                  cityCoordinates[selectedCity]!);
                            },
                            isDense: true,
                            isExpanded: true,
                            items: provinces
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 22,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white2,
                    ),
                    child: Icon(
                      Icons.my_location,
                      size: 35,
                      color: AppColors.tankBlue3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (tappedLocation != null) {
                widget.onSelectOption(
                    "Lat: ${tappedLocation!.latitude}, Lng: ${tappedLocation!.longitude}");
              }
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 24,
                top: 16,
                left: 22,
                right: 22,
              ),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.tankBlueButton,
              ),
              child: Center(
                child: Text(
                  'انتخاب',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // متد برای حرکت نرم نقشه
  void _moveMapWithAnimation(LatLng destination) async {
    const duration = Duration(milliseconds: 1);
    const steps = 100; // تعداد مراحل حرکت
    LatLng currentPosition = mapController.camera.center;

    for (int i = 1; i <= steps; i++) {
      // تغییر مختصات به تدریج
      double newLat = currentPosition.latitude +
          (destination.latitude - currentPosition.latitude) * (i / steps);
      double newLng = currentPosition.longitude +
          (destination.longitude - currentPosition.longitude) * (i / steps);

      // حرکت نقشه
      mapController.move(LatLng(newLat, newLng), 13);

      // تاخیر برای حرکت نرم
      await Future.delayed(duration);
    }
  }
}
