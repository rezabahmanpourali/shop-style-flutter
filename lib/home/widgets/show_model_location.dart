import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    options: const MapOptions(
                      initialCenter: LatLng(34.571112, 50.808330),
                      initialZoom: 13,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: const LatLng(34.571112, 50.808330),
                            child: Builder(
                              builder: (context) => const Icon(
                                Icons.location_pin,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(right: 22, left: 22, top: 10),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.white2,
                      border: Border.all(
                        width: 2,
                        color: AppColors.cardWhite,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 20),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.search,
                              color: AppColors.searchGreyColor,
                              size: 25,
                            ),
                            const Spacer(),
                            Text(
                              'جستجوی محله',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppColors.cardWhite,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // نمایش منوی کشویی برای انتخاب شهر
                                String? selected = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('انتخاب شهر',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                        ],
                                      ),
                                      content: DropdownButton<String>(
                                        value: selectedCity,
                                        onChanged: (String? newCity) {
                                          setState(() {
                                            selectedCity = newCity!;
                                          });
                                          Navigator.of(context).pop(newCity);
                                        },
                                        items: provinces
                                            .map<DropdownMenuItem<String>>(
                                                (String city) {
                                          return DropdownMenuItem<String>(
                                            value: city,
                                            child: Text(
                                              city,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  },
                                );
                                if (selected != null) {
                                  setState(() {
                                    selectedCity = selected;
                                  });
                                }
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  Text(
                                    selectedCity,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 22,
                  right: 22,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white2,
                      border: Border.all(
                        width: 1,
                        color: AppColors.cardWhite,
                      ),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.locationCrosshairs,
                        size: 32,
                        color: AppColors.purpleOpacity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
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
                color: AppColors.bgBlack,
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
}
