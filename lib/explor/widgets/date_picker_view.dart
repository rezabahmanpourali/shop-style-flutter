import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

enum DatePickerView { date, month, year }

class DatePickerWidgetBase extends StatefulWidget {
  final Jalali now;
  final Function(Jalali newDateTime, bool shoudClose) onChange;

  const DatePickerWidgetBase({
    super.key,
    required this.now,
    required this.onChange,
  });
  @override
  DatePickerWidgetBaseState createState() => DatePickerWidgetBaseState();
}

class DatePickerWidgetBaseState extends State<DatePickerWidgetBase> {
  final List<String> _dayOfWeekName = [
    'ش',
    'ی',
    'د',
    'س',
    'چ',
    'پ',
    'ج',
  ];

  String formatMonthPersian(Jalali date) {
    final monthNames = [
      'فروردین',
      'اردیبهشت',
      'خرداد',
      'تیر',
      'مرداد',
      'شهریور',
      'مهر',
      'آبان',
      'آذر',
      'دی',
      'بهمن',
      'اسفند'
    ];
    return monthNames[date.month - 1];
  }

  int? _hoveredIndex;
  late Jalali _currentViewDate;
  late Jalali _actualSelectedDate;
  DatePickerView _currentView = DatePickerView.date;

  bool _isYearHovered = false;
  bool _isMonthHovered = false;

  DatePickerWidgetBaseState();

  @override
  void initState() {
    super.initState();
    _actualSelectedDate = widget.now;
    _currentViewDate = widget.now;
  }

  int _calculateDaysToShow(Jalali date) {
    final int daysInMonth = date.monthLength;
    final int weekdayOfFirst = (date.copy(day: 1).weekDay - 1) % 7;
    final int nextMonthDays = 42 - (daysInMonth + weekdayOfFirst);
    return daysInMonth + weekdayOfFirst + nextMonthDays;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int totalDays = _calculateDaysToShow(_currentViewDate);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        height: 254,
        width: 280,
        child: Column(
          children: [
            _appBarOfTheDatePicker(theme),
            Divider(
              height: 1,
              color: Colors.black.withOpacity(0.06),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: SizedBox(
                height: 213,
                width: 280,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: _getCurrentViewWidget(theme, totalDays),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBarOfTheDatePicker(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: SizedBox(
        height: 40,
        width: 280,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _navigationArrows(isLeft: false),
            Row(
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _currentView = DatePickerView.year;
                    });
                  },
                  onHover: (hovering) {
                    setState(() {
                      _isYearHovered = hovering;
                    });
                  },
                  child: Text(
                    '${_currentViewDate.year}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: _isYearHovered ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _currentView = DatePickerView.month;
                    });
                  },
                  onHover: (hovering) {
                    setState(() {
                      _isMonthHovered = hovering;
                    });
                  },
                  child: Text(
                    formatMonthPersian(_currentViewDate),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: _isMonthHovered ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            _navigationArrows(isLeft: true),
          ],
        ),
      ),
    );
  }

  Widget _navigationArrows({required bool isLeft}) {
    return Row(
      children: [
        if (isLeft) ...[
          _arrowButton(Icons.arrow_left, _goToNextMonth),
          const SizedBox(width: 8),
          _arrowButton(Icons.arrow_left, _goToNextYear),
        ],
        if (!isLeft) ...[
          _arrowButton(Icons.arrow_right, _goToPreviousYear),
          const SizedBox(width: 8),
          _arrowButton(Icons.arrow_right, _goToPreviousMonth),
        ],
      ],
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: 35,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }

  Widget _calendarsTable(int totalDays, ThemeData theme) {
    return SizedBox(
      height: 214,
      width: 280,
      child: Column(
        children: <Widget>[
          _weekDayHeaders(theme),
          _daysGridView(totalDays, theme),
        ],
      ),
    );
  }

  Widget _weekDayHeaders(ThemeData theme) {
    return SizedBox(
      height: 28,
      width: 256,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 36 / 28, // Aspect ratio based on day container size
        ),
        itemCount: _dayOfWeekName.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(1),
            alignment: Alignment.center,
            child: Text(
              _dayOfWeekName[index],
              style: theme.textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }

  Widget _daysGridView(int totalDays, ThemeData theme) {
    return SizedBox(
      height: 184,
      width: 256,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 36 / 28,
        ),
        itemCount: totalDays,
        itemBuilder: (context, index) {
          final Jalali date = _getDateForIndex(index);
          final String formattedDate = '${date.day}';
          return InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              _onDaySelected(date);
            },
            child: MouseRegion(
              onEnter: (_) => _onDayHovered(index),
              onExit: (_) => _onDayHovered(null),
              child: _dayContainer(theme, index, formattedDate),
            ),
          );
        },
      ),
    );
  }

  Widget _monthView(ThemeData theme) {
    final List<String> monthNames = [
      'فروردین',
      'اردیبهشت',
      'خرداد',
      'تیر',
      'مرداد',
      'شهریور',
      'مهر',
      'آبان',
      'آذر',
      'دی',
      'بهمن',
      'اسفند'
    ];

    return SizedBox(
      height: 210,
      width: 280,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 1.5,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        itemBuilder: (context, index) {
          final bool isSelectedMonth = index + 1 == _currentViewDate.month;
          return MouseRegion(
            onEnter: (_) => setState(() {
              _hoveredIndex = index;
            }),
            onExit: (_) => setState(() {
              _hoveredIndex = null;
            }),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  _currentViewDate = _currentViewDate.copy(month: index + 1);
                  _currentViewDate = _adjustDate(_currentViewDate);
                  _currentView = DatePickerView.date;
                  widget.onChange(_actualSelectedDate, false);
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelectedMonth
                      ? Colors.blue
                      : _hoveredIndex == index
                          ? Colors.grey.withOpacity(0.1)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  monthNames[index],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isSelectedMonth ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _yearView(ThemeData theme) {
    final int currentYear = _currentViewDate.year;
    final List<int> years =
        List.generate(12, (index) => currentYear - 6 + index);

    return SizedBox(
      height: 210,
      width: 280,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 1.5,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: years.length,
        itemBuilder: (context, index) {
          final bool isSelectedYear = years[index] == _currentViewDate.year;
          return MouseRegion(
            onEnter: (_) => setState(() {
              _hoveredIndex = index;
            }),
            onExit: (_) => setState(() {
              _hoveredIndex = null;
            }),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  _currentViewDate = _currentViewDate.copy(year: years[index]);
                  _currentViewDate = _adjustDate(_currentViewDate);
                  _currentView = DatePickerView.month;
                  widget.onChange(_actualSelectedDate, false);
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelectedYear
                      ? Colors.blue
                      : _hoveredIndex == index
                          ? Colors.grey.withOpacity(0.1)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  years[index].toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isSelectedYear ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getCurrentViewWidget(ThemeData theme, int totalDays) {
    switch (_currentView) {
      case DatePickerView.date:
        return _calendarsTable(totalDays, theme);
      case DatePickerView.month:
        return _monthView(theme);
      case DatePickerView.year:
        return _yearView(theme);
      default:
        return _calendarsTable(totalDays, theme);
    }
  }

  Jalali _getDateForIndex(int index) {
    final int firstDayOfWeek = (_currentViewDate.copy(day: 1).weekDay - 1) % 7;
    final int dayOffset = index - firstDayOfWeek;
    return _currentViewDate.copy(day: 1).addDays(dayOffset);
  }

  void _onDayHovered(int? index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _onDaySelected(Jalali date) {
    setState(() {
      _actualSelectedDate = date;
      _currentViewDate = date;
      widget.onChange(_actualSelectedDate, true);
    });
  }

  void _goToNextMonth() {
    setState(() {
      int nextMonth = _currentViewDate.month + 1;
      int nextYear = _currentViewDate.year;

      if (nextMonth > 12) {
        nextMonth = 1;
        nextYear += 1;
      }

      _currentViewDate = Jalali(nextYear, nextMonth, 1);
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      int previousMonth = _currentViewDate.month - 1;
      int previousYear = _currentViewDate.year;

      if (previousMonth < 1) {
        previousMonth = 12;
        previousYear -= 1;
      }

      _currentViewDate = Jalali(previousYear, previousMonth, 1);
    });
  }

  void _goToNextYear() {
    setState(() {
      int currentYear = _currentViewDate.year + 1;
      _currentViewDate = Jalali(currentYear, _currentViewDate.month, 1);
    });
  }

  void _goToPreviousYear() {
    setState(() {
      int currentYear = _currentViewDate.year - 1;
      _currentViewDate = Jalali(currentYear, _currentViewDate.month, 1);
    });
  }

  Jalali _adjustDate(Jalali date) {
    final int daysInMonth = date.monthLength;
    if (date.day > daysInMonth) {
      return date.copy(day: daysInMonth);
    }
    return date;
  }

  Widget _dayContainer(ThemeData theme, int index, String formattedDate) {
    final Jalali date = _getDateForIndex(index);
    final Jalali today = Jalali.now();
    final bool isSelected = _actualSelectedDate.year == date.year &&
        _actualSelectedDate.month == date.month &&
        _actualSelectedDate.day == date.day;
    final bool isCurrentMonth = date.month == _currentViewDate.month;
    final bool isToday = today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;

    final Color textColor = isCurrentMonth ? Colors.black : Colors.grey;
    final Color borderColor =
        isToday ? const Color(0xff1677FF) : Colors.transparent;

    final BoxDecoration decoration = BoxDecoration(
      color: isSelected && isCurrentMonth
          ? const Color(0xff1677FF)
          : (_hoveredIndex == index
              ? Colors.grey.withOpacity(0.1)
              : Colors.white),
      border: Border.all(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.circular(6),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(1),
      decoration: decoration,
      height: 28,
      width: 36,
      child: Text(
        formattedDate,
        style: theme.textTheme.bodyMedium?.copyWith(
            color: isSelected && isCurrentMonth ? Colors.white : textColor),
      ),
    );
  }
}