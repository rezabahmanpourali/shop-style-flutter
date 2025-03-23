# راهنمای استفاده از API ساعات کاری آرایشگاه

سلام دوست عزیز! اینجا میخوایم بگیم چطور میتونی از API های مربوط به ساعات کاری آرایشگاه استفاده کنی.

## ساختار داده‌ها

هر ساعات کاری شامل این فیلدهاست:
- `day_of_week`: روز هفته (مثلا "monday", "tuesday" و...)
- `opening_time`: ساعت شروع کار (مثلا "09:00")
- `closing_time`: ساعت پایان کار (مثلا "21:00")
- `is_closed`: آیا در این روز تعطیل است؟ (true یا false)

## API های موجود

### 1. دریافت ساعات کاری یک آرایشگاه
```
GET /barbershops/{barber_shop_id}/working-hours/
```
**کی استفاده کنم؟**
- وقتی میخوای ساعات کاری یک آرایشگاه رو نشون بدی
- مثلا در صفحه جزئیات آرایشگاه
- یا وقتی میخوای یک جدول ساعات کاری بسازی

**مثال پاسخ:**
```json
[
  {
    "day_of_week": "monday",
    "opening_time": "09:00",
    "closing_time": "21:00",
    "is_closed": false
  },
  {
    "day_of_week": "sunday",
    "opening_time": "09:00",
    "closing_time": "21:00",
    "is_closed": true
  }
]
```

### 2. ویرایش ساعات کاری
```
PUT /barbershops/{barber_shop_id}/working-hours/
```
**کی استفاده کنم؟**
- وقتی میخوای ساعات کاری رو تغییر بدی
- مثلا در پنل ادمین آرایشگاه
- یا وقتی صاحب آرایشگاه میخواد ساعات کاری رو آپدیت کنه

**نکته مهم:** باید همه روزهای هفته رو بفرستی، حتی اونایی که تغییر نکردن.

**مثال درخواست:**
```json
[
  {
    "day_of_week": "monday",
    "opening_time": "09:00",
    "closing_time": "21:00",
    "is_closed": false
  },
  {
    "day_of_week": "tuesday",
    "opening_time": "09:00",
    "closing_time": "21:00",
    "is_closed": false
  },
  // ... سایر روزها
]
```

## نکات مهم
1. ساعت‌ها باید به فرمت 24 ساعته باشن (مثلا "09:00" به جای "9:00 AM")
2. اگر یک روز تعطیل باشه، `is_closed` رو `true` بذار
3. حتماً همه روزهای هفته رو در درخواست PUT بفرست
4. روزهای هفته باید به انگلیسی و با حروف کوچک باشن:
   - monday
   - tuesday
   - wednesday
   - thursday
   - friday
   - saturday
   - sunday

## مثال کد فرانت‌اند (React)
```typescript
// دریافت ساعات کاری
const getWorkingHours = async (barberShopId: number) => {
  const response = await fetch(`/barbershops/${barberShopId}/working-hours/`);
  return await response.json();
};

// ویرایش ساعات کاری
const updateWorkingHours = async (barberShopId: number, workingHours: WorkingHours[]) => {
  const response = await fetch(`/barbershops/${barberShopId}/working-hours/`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(workingHours),
  });
  return await response.json();
};
```

## نکات امنیتی
- فقط صاحب آرایشگاه یا ادمین میتونه ساعات کاری رو تغییر بده
- حتماً قبل از هر درخواست، توکن احراز هویت رو در هدر درخواست قرار بدید
- برای امنیت بیشتر، سعی کنید تغییرات رو با تأیید کاربر انجام بدید

امیدوارم این راهنما کمکتون کرده باشه! اگر سوال دیگه‌ای دارید، خوشحال میشیم کمکتون کنیم 😊 
