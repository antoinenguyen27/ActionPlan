import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() =>
      ['en', 'zh_Hant', 'id', 'bn', 'hi', 'vi', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HantText = '',
    String? idText = '',
    String? bnText = '',
    String? hiText = '',
    String? viText = '',
    String? zh_HansText = '',
  }) =>
      [
        enText,
        zh_HantText,
        idText,
        bnText,
        hiText,
        viText,
        zh_HansText
      ][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    's3xbjkia': {
      'en': 'Current location',
      'bn': 'এখন যেখানে আছ',
      'hi': 'वर्तमान स्थान',
      'id': 'Lokasi saat ini',
      'vi': 'Vị trí hiện tại',
      'zh_Hans': '当前位置',
      'zh_Hant': '目前位置',
    },
    'wwcxjylg': {
      'en': 'Action plans',
      'bn': 'কর্ম পরিকল্পনা',
      'hi': 'क्रिया योजनाएँ',
      'id': 'Rencana aksi',
      'vi': 'kế hoạch hành động',
      'zh_Hans': '行动计划',
      'zh_Hant': '行動計劃',
    },
    'lbazyhmt': {
      'en': 'Use unknown contact',
      'bn': 'অজানা পরিচিতি ব্যবহার করুন',
      'hi': 'अज्ञात संपर्क का उपयोग करें',
      'id': 'Gunakan kontak yang tidak dikenal',
      'vi': 'Sử dụng liên hệ không xác định',
      'zh_Hans': '使用未知联系人',
      'zh_Hant': '使用未知聯絡人',
    },
    'ay6ecy0e': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // actionSelect
  {
    '7i51x7dz': {
      'en': 'What type of emergency?',
      'bn': 'কি ধরনের জরুরী?',
      'hi': 'किस प्रकार का आपातकाल?',
      'id': 'Jenis darurat apa?',
      'vi': 'Loại trường hợp khẩn cấp nào?',
      'zh_Hans': '什么类型的紧急情况？',
      'zh_Hant': '什麼類型的緊急狀況？',
    },
    '5kmtcgc5': {
      'en': 'Stroke',
      'bn': 'স্ট্রোক',
      'hi': 'आघात',
      'id': 'Stroke',
      'vi': 'Đột quỵ',
      'zh_Hans': '中风',
      'zh_Hant': '中風',
    },
    'r69ahcv1': {
      'en': 'Heart Attack',
      'bn': 'হৃদপিন্ডে হঠাৎ আক্রমণ',
      'hi': 'दिल का दौरा',
      'id': 'Serangan jantung',
      'vi': 'Đau tim',
      'zh_Hans': '心脏病发作',
      'zh_Hant': '心臟病發作',
    },
    'jp68t1f3': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // strokePage1
  {
    'l02yyjxd': {
      'en': 'Step 1: Recognise using FAST',
      'bn': 'ধাপ 1: FAST ব্যবহার করে চিনুন',
      'hi': 'चरण 1: FAST का उपयोग करके पहचानें',
      'id': 'Langkah 1: Kenali menggunakan FAST',
      'vi': 'Bước 1: Nhận biết bằng FAST',
      'zh_Hans': '第 1 步：使用 FAST 进行识别',
      'zh_Hant': '第 1 步：使用 FAST 進行識別',
    },
    'ilf00oib': {
      'en': 'Face',
      'bn': 'মুখ',
      'hi': 'चेहरा',
      'id': 'Menghadapi',
      'vi': 'Khuôn mặt',
      'zh_Hans': '脸',
      'zh_Hant': '臉',
    },
    '3vkbe04i': {
      'en': ' - has their face or mouth drooped?',
      'bn': '- তাদের মুখ বা মুখ কি নিচু হয়ে গেছে?',
      'hi': '- क्या उनका चेहरा या मुंह झुक गया है?',
      'id': '- apakah wajah atau mulutnya terkulai?',
      'vi': '- mặt hoặc miệng của họ có bị xệ xuống không?',
      'zh_Hans': '- 他们的脸或嘴是否下垂？',
      'zh_Hant': '- 他們的臉或嘴巴是否下垂？',
    },
    'o7qx1qo7': {
      'en': 'Arms',
      'bn': 'অস্ত্র',
      'hi': 'हथियारों',
      'id': 'Lengan',
      'vi': 'Cánh tay',
      'zh_Hans': '武器',
      'zh_Hant': '武器',
    },
    'ikrl8j40': {
      'en': ' - Can they lift both arms?',
      'bn': '- তারা উভয় হাত তুলতে পারে?',
      'hi': '- क्या वे दोनों हाथ उठा सकते हैं?',
      'id': '- Bisakah mereka mengangkat kedua tangannya?',
      'vi': '- Họ có thể nâng cả hai tay được không?',
      'zh_Hans': '- 他们能举起双臂吗？',
      'zh_Hant': '- 他們能舉起雙臂嗎？',
    },
    't2zdwzye': {
      'en': 'Speech',
      'bn': 'বক্তৃতা',
      'hi': 'भाषण',
      'id': 'Pidato',
      'vi': 'Lời nói',
      'zh_Hans': '演讲',
      'zh_Hant': '演講',
    },
    'pdrzn72p': {
      'en': ' - Is their speech slurred? Do they understand you?',
      'bn': '- তাদের বক্তৃতা কি ঝাপসা? তারা কি আপনাকে বুঝতে পারে?',
      'hi': '- क्या उनका भाषण अस्पष्ट है? क्या वे आपको समझते हैं?',
      'id': '- Apakah ucapan mereka tidak jelas? Apakah mereka memahamimu?',
      'vi': '- Họ nói ngọng à? Họ có hiểu bạn không?',
      'zh_Hans': '- 他们说话含糊不清吗？他们理解你吗？',
      'zh_Hant': '- 他們說話含糊不清嗎？他們理解你嗎？',
    },
    '0qs127bt': {
      'en': 'Time is critical',
      'bn': 'সময় সমালোচনামূলক',
      'hi': 'समय महत्वपूर्ण है',
      'id': 'Waktu sangat penting',
      'vi': 'Thời gian rất quan trọng',
      'zh_Hans': '时间很关键',
      'zh_Hant': '時間很關鍵',
    },
    'pktgnt8p': {
      'en':
          ' - If you see any of these signs, follow DRSABCD, call triple zero (000) immediately and ask for an ambulance. Early treatment could save their life.',
      'bn':
          '- যদি আপনি এই লক্ষণগুলির মধ্যে কোনটি দেখতে পান, DRSABCD অনুসরণ করুন, অবিলম্বে ট্রিপল জিরো (000) কল করুন এবং একটি অ্যাম্বুলেন্সের জন্য বলুন। প্রাথমিক চিকিৎসা তাদের জীবন বাঁচাতে পারে।',
      'hi':
          '- यदि आपको इनमें से कोई भी संकेत दिखाई दे, तो DRSABCD का पालन करें, तुरंत ट्रिपल ज़ीरो (000) पर कॉल करें और एम्बुलेंस के लिए पूछें। शीघ्र उपचार से उनकी जान बचाई जा सकती है।',
      'id':
          '- Jika Anda melihat tanda-tanda ini, ikuti DRSABCD, segera hubungi triple zero (000) dan minta ambulans. Perawatan dini bisa menyelamatkan nyawa mereka.',
      'vi':
          '- Nếu bạn thấy bất kỳ dấu hiệu nào trong số này, hãy làm theo DRSABCD, gọi ngay ba số không (000) và yêu cầu xe cấp cứu. Điều trị sớm có thể cứu sống họ.',
      'zh_Hans':
          '- 如果您看到任何这些迹象，请遵循 DRSAABCD，立即拨打三个零 (000) 并要求救护车。早期治疗可以挽救他们的生命。',
      'zh_Hant':
          '- 如果您看到任何這些跡象，請遵循 DRSAABCD，立即撥打三個零 (000) 並要求救護車。早期治療可以挽救他們的生命。',
    },
    '42hog5z7': {
      'en': 'Next',
      'bn': 'পরবর্তী',
      'hi': 'अगला',
      'id': 'Berikutnya',
      'vi': 'Kế tiếp',
      'zh_Hans': '下一个',
      'zh_Hant': '下一個',
    },
    'jm1o16sx': {
      'en': 'More Symptoms',
      'bn': 'আরো উপসর্গ',
      'hi': 'अधिक लक्षण',
      'id': 'Gejala Lainnya',
      'vi': 'Thêm triệu chứng',
      'zh_Hans': '更多症状',
      'zh_Hant': '更多症狀',
    },
    '7fxcrorx': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // strokePage2
  {
    '3s8yfzx4': {
      'en': 'Step 2: Management',
      'bn': 'ধাপ 2: ব্যবস্থাপনা',
      'hi': 'चरण 2: प्रबंधन',
      'id': 'Langkah 2: Manajemen',
      'vi': 'Bước 2: Quản lý',
      'zh_Hans': '第二步：管理',
      'zh_Hant': '第二步：管理',
    },
    '9zvempgy': {
      'en': 'Conscious?',
      'bn': 'সচেতন?',
      'hi': 'सचेत?',
      'id': 'Sadar?',
      'vi': 'Biết rõ?',
      'zh_Hans': '有意识的？',
      'zh_Hant': '有意識的？',
    },
    '9m6vycji': {
      'en':
          ' \nSupport head and shoulders on pillows\nLoosen tight clothing\nMaintain body temperature\nWipe away secretions from their mouth\nEnsure airway is clear and open',
      'bn':
          'বালিশে মাথা এবং কাঁধকে সমর্থন করুন\nটাইট পোশাক ঢিলা করুন\nশরীরের তাপমাত্রা বজায় রাখুন\nতাদের মুখ থেকে ক্ষরণ মুছে ফেলুন\nশ্বাসনালী পরিষ্কার এবং খোলা আছে তা নিশ্চিত করুন',
      'hi':
          'सिर और कंधों को तकिये का सहारा लें\nतंग कपड़ों को ढीला करें\nशरीर का तापमान बनाए रखें\nउनके मुँह से स्राव मिटा दो\nसुनिश्चित करें कि वायुमार्ग साफ़ और खुला हो',
      'id':
          'Sangga kepala dan bahu dengan bantal\nKendurkan pakaian ketat\nMenjaga suhu tubuh\nBersihkan sekret dari mulutnya\nPastikan jalan napas bersih dan terbuka',
      'vi':
          'Hỗ trợ đầu và vai trên gối\nNới lỏng quần áo chật\nDuy trì nhiệt độ cơ thể\nLau sạch dịch tiết từ miệng của họ\nĐảm bảo đường thở thông thoáng và thông thoáng',
      'zh_Hans': '用枕头支撑头部和肩膀\n松开紧的衣服\n维持体温\n擦掉嘴里的分泌物\n确保呼吸道畅通',
      'zh_Hant': '用枕頭支撐頭部和肩膀\n鬆開緊的衣服\n維持體溫\n擦掉嘴裡的分泌物\n確保呼吸道暢通',
    },
    'grsukne2': {
      'en': 'Unconscious?',
      'bn': 'অজ্ঞান?',
      'hi': 'अचेत?',
      'id': 'Tidak sadar?',
      'vi': 'Bất tỉnh?',
      'zh_Hans': '无意识？',
      'zh_Hant': '無意識？',
    },
    'e3ipbsfe': {
      'en': '\nPlace them in the recovery position',
      'bn': 'তাদের পুনরুদ্ধারের অবস্থানে রাখুন',
      'hi': 'उन्हें पुनर्प्राप्ति स्थिति में रखें',
      'id': 'Tempatkan mereka pada posisi pemulihan',
      'vi': 'Đặt chúng vào vị trí phục hồi',
      'zh_Hans': '将它们置于恢复位置',
      'zh_Hant': '將它們置於恢復位置',
    },
    'w3xbs3of': {
      'en': 'Call now',
      'bn': 'এখন ডাকো',
      'hi': 'अब कॉल करें',
      'id': 'Telepon sekarang',
      'vi': 'Gọi ngay bây giờ',
      'zh_Hans': '现在打电话',
      'zh_Hant': '現在打電話',
    },
    'e8x1ldun': {
      'en':
          '- If you haven\'t already. Call triple zero (000) immediately and ask for an ambulance. Early treatment could save their life.',
      'bn':
          '- যদি আপনি ইতিমধ্যে না. অবিলম্বে ট্রিপল জিরো (000) কল করুন এবং একটি অ্যাম্বুলেন্সের জন্য জিজ্ঞাসা করুন। প্রাথমিক চিকিৎসা তাদের জীবন বাঁচাতে পারে।',
      'hi':
          '- यदि आपने पहले से नहीं किया है। तुरंत ट्रिपल ज़ीरो (000) पर कॉल करें और एम्बुलेंस के लिए पूछें। शीघ्र उपचार से उनकी जान बचाई जा सकती है।',
      'id':
          '- Jika kamu belum melakukannya. Segera hubungi triple zero (000) dan minta ambulans. Perawatan dini bisa menyelamatkan nyawa mereka.',
      'vi':
          '- Nếu chưa. Hãy gọi ngay ba số không (000) và yêu cầu xe cứu thương. Điều trị sớm có thể cứu sống họ.',
      'zh_Hans': '- 如果你还没有的话。立即拨打三个零 (000) 并请求救护车。早期治疗可以挽救他们的生命。',
      'zh_Hant': '- 如果你還沒有的話。立即撥打三個零 (000) 並請求救護車。早期治療可以挽救他們的生命。',
    },
    '0s1twzju': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // strokeInformation
  {
    'gst3fxg2': {
      'en': 'More symptoms',
      'bn': 'আরো উপসর্গ',
      'hi': 'अधिक लक्षण',
      'id': 'Gejala lebih lanjut',
      'vi': 'Thêm triệu chứng',
      'zh_Hans': '更多症状',
      'zh_Hant': '更多症狀',
    },
    'bz40nnic': {
      'en':
          '- Sudden decrease in level of consciousness\n- Weakness or paralysis, especially on one side of the body\n- Feeling of numbness in face, arm or leg on either or both sides of the body\n- Difficulty swallowing\n- Difficulty speaking or understanding\n- Unexplained dizziness\n- Disturbed vision – blurred or a decrease in vision in one or both eyes\n- Loss of balance\n- Headache, usually severe and abrupt\n- Drowsiness\n- Confusion',
      'bn':
          '- হঠাৎ চেতনার মাত্রা কমে যাওয়া\n- দুর্বলতা বা পক্ষাঘাত, বিশেষ করে শরীরের একপাশে\n- মুখ, বাহু বা পায়ে উভয় বা শরীরের উভয় পাশে অসাড়তা অনুভব করা\n- গিলতে অসুবিধা\n- কথা বলতে বা বুঝতে অসুবিধা হওয়া\n- ব্যাখ্যাতীত মাথা ঘোরা\n- বিঘ্নিত দৃষ্টি - এক বা উভয় চোখে ঝাপসা বা দৃষ্টিশক্তি হ্রাস\n- ভারসাম্য হারানো\n- মাথাব্যথা, সাধারণত তীব্র এবং আকস্মিক\n- তন্দ্রা\n- বিভ্রান্তি',
      'hi':
          '- चेतना के स्तर में अचानक कमी आना\n- कमजोरी या पक्षाघात, विशेषकर शरीर के एक तरफ\n-चेहरे, हाथ या पैर में शरीर के एक या दोनों तरफ सुन्नता महसूस होना\n- निगलने में कठिनाई\n- बोलने या समझने में कठिनाई होना\n-अकारण चक्कर आना\n- बिगड़ी हुई दृष्टि - एक या दोनों आँखों में धुंधलापन या दृष्टि में कमी\n- संतुलन खोना\n- सिरदर्द, आमतौर पर गंभीर और अचानक\n- तंद्रा\n- भ्रम',
      'id':
          '- Penurunan tingkat kesadaran secara tiba-tiba\n- Kelemahan atau kelumpuhan terutama pada salah satu sisi tubuh\n- Rasa kebas pada wajah, lengan atau kaki pada salah satu atau kedua sisi tubuh\n- Kesulitan menelan\n- Kesulitan berbicara atau memahami\n- Pusing tanpa sebab yang jelas\n- Penglihatan terganggu – kabur atau berkurangnya penglihatan pada salah satu atau kedua mata\n- Hilangnya keseimbangan\n- Sakit kepala, biasanya parah dan tiba-tiba\n- Mengantuk\n- Kebingungan',
      'vi':
          '- Suy giảm ý thức đột ngột\n- Yếu hoặc tê liệt, đặc biệt ở một bên cơ thể\n- Cảm giác tê ở mặt, tay hoặc chân ở một hoặc cả hai bên cơ thể\n- Khó nuốt\n- Khó nói hoặc khó hiểu\n- Chóng mặt không rõ nguyên nhân\n- Rối loạn thị lực – mờ hoặc giảm thị lực ở một hoặc cả hai mắt\n- Mất thăng bằng\n- Đau đầu thường dữ dội và đột ngột\n- Buồn ngủ\n- Lú lẫn',
      'zh_Hans':
          '- 意识水平突然下降\n- 虚弱或瘫痪，尤其是身体的一侧\n- 身体一侧或两侧的面部、手臂或腿部感觉麻木\n- 吞咽困难\n- 说话或理解困难\n- 不明原因的头晕\n- 视力障碍 – 一只或两只眼睛视力模糊或下降\n- 失去平衡\n- 头痛，通常严重且突然\n- 嗜睡\n- 困惑',
      'zh_Hant':
          '- 意識水平突然下降\n- 虛弱或癱瘓，尤其是身體的一側\n- 身體一側或兩側的臉部、手臂或腿部感覺麻木\n- 吞嚥困難\n- 說話或理解困難\n- 不明原因的頭暈\n- 視力障礙 – 一隻或兩隻眼睛視力模糊或下降\n- 失去平衡\n- 頭痛，通常嚴重且突然\n- 嗜睡\n- 錯亂',
    },
    'tqwze66r': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // callInfoPage
  {
    'f354dt1n': {
      'en': 'Declare incident',
      'bn': 'ঘটনা ঘোষণা করুন',
      'hi': 'घटना घोषित करें',
      'id': 'Nyatakan kejadian',
      'vi': 'Khai báo sự cố',
      'zh_Hans': '宣布事件',
      'zh_Hant': '宣布事件',
    },
    'prt96lek': {
      'en': ' - Call 000 and ask for ambulance',
      'bn': '- 000 নম্বরে কল করুন এবং অ্যাম্বুলেন্সের জন্য জিজ্ঞাসা করুন',
      'hi': '- 000 पर कॉल करें और एम्बुलेंस मांगें',
      'id': '- Hubungi 000 dan minta ambulans',
      'vi': '- Gọi 000 và yêu cầu xe cứu thương',
      'zh_Hans': '- 拨打 000 并要求救护车',
      'zh_Hant': '- 撥打 000 並要求救護車',
    },
    'wbvu6gjp': {
      'en': 'Location\n',
      'bn': 'অবস্থান',
      'hi': 'जगह',
      'id': 'Lokasi',
      'vi': 'Vị trí',
      'zh_Hans': '地点',
      'zh_Hant': '地點',
    },
    'd56e7zi1': {
      'en': ' Use street address preferably',
      'bn': 'রাস্তার ঠিকানা পছন্দ করে ব্যবহার করুন',
      'hi': 'अधिमानतः सड़क के पते का उपयोग करें',
      'id': 'Gunakan alamat jalan sebaiknya',
      'vi': 'Tốt nhất nên sử dụng địa chỉ đường phố',
      'zh_Hans': '最好使用街道地址',
      'zh_Hant': '最好使用街道地址',
    },
    'vhmfi3gs': {
      'en': 'Reveal 3 word coordinate code',
      'bn': '3 শব্দ সমন্বয় কোড প্রকাশ করুন',
      'hi': '3 शब्द समन्वय कोड प्रकट करें',
      'id': 'Mengungkapkan kode koordinat 3 kata',
      'vi': 'Tiết lộ mã tọa độ 3 từ',
      'zh_Hans': '显示3字坐标代码',
      'zh_Hant': '顯示3字坐標代碼',
    },
    '3vlmhhqk': {
      'en':
          'It is often faster to give 3 word coordinate codes to 000 if you are in a difficult area. Let them know you have \"what3words\" available',
      'bn':
          'আপনি যদি একটি কঠিন এলাকায় থাকেন তবে 000-এ 3টি শব্দ সমন্বয় কোড দেওয়া প্রায়শই দ্রুত। তাদের জানান যে আপনার কাছে \"what3words\" উপলব্ধ আছে',
      'hi':
          'यदि आप किसी कठिन क्षेत्र में हैं तो 000 पर 3 शब्द समन्वय कोड देना अक्सर तेज़ होता है। उन्हें बताएं कि आपके पास \"what3words\" उपलब्ध है',
      'id':
          'Seringkali lebih cepat memberikan kode koordinat 3 kata ke 000 jika Anda berada di area yang sulit. Beri tahu mereka bahwa Anda memiliki \"kata-kata apa\" yang tersedia',
      'vi':
          'Việc cung cấp mã tọa độ 3 từ cho 000 thường nhanh hơn nếu bạn ở khu vực khó khăn. Hãy cho họ biết bạn có sẵn \"what3words\"',
      'zh_Hans': '如果您位于困难区域，将 3 个字的坐标代码设置为 000 通常会更快。让他们知道您有可用的“三词地址”',
      'zh_Hant': '如果您位於困難區域，將 3 個字的座標代碼設為 000 通常會更快。讓他們知道您有可用的“三詞地址”',
    },
    '02kopgqk': {
      'en': 'what3words',
      'bn': 'what3words',
      'hi': 'क्या3शब्द',
      'id': 'kata-kata apa',
      'vi': 'what3words',
      'zh_Hans': '三个词',
      'zh_Hant': '三個詞',
    },
    '5xzcdyzh': {
      'en': 'Incident Description',
      'bn': 'ঘটনা বর্ণনা',
      'hi': 'घटना विवरण',
      'id': 'Deskripsi Insiden',
      'vi': 'Mô tả sự cố',
      'zh_Hans': '事件描述',
      'zh_Hant': '事件描述',
    },
    's53l9h5v': {
      'en': '- Describe what has happened',
      'bn': '- কি ঘটেছে বর্ণনা করুন',
      'hi': '- वर्णन करें कि क्या हुआ है',
      'id': '- Jelaskan apa yang terjadi',
      'vi': '- Miêu tả chuyện gì đã xảy ra',
      'zh_Hans': '- 描述发生了什么',
      'zh_Hant': '- 描述發生了什麼',
    },
    '39dce1ex': {
      'en': 'Hazards and access',
      'bn': 'বিপদ এবং অ্যাক্সেস',
      'hi': 'खतरे और पहुंच',
      'id': 'Bahaya dan akses',
      'vi': 'Mối nguy hiểm và khả năng tiếp cận',
      'zh_Hans': '危险和进入',
      'zh_Hant': '危險和進入',
    },
    '9j30dp2k': {
      'en':
          '- Describe any hazards and how to access your location for paramedics',
      'bn':
          '- কোনো বিপদ এবং প্যারামেডিকদের জন্য আপনার অবস্থান কীভাবে অ্যাক্সেস করবেন তা বর্ণনা করুন',
      'hi':
          '- किसी भी खतरे का वर्णन करें और पैरामेडिक्स के लिए अपने स्थान तक कैसे पहुंचें',
      'id':
          '- Jelaskan bahaya apa pun dan cara mengakses lokasi Anda untuk paramedis',
      'vi':
          '- Mô tả bất kỳ mối nguy hiểm nào và cách tiếp cận vị trí của bạn cho nhân viên y tế',
      'zh_Hans': '- 描述任何危险以及如何让护理人员进入您的位置',
      'zh_Hant': '- 描述任何危險以及如何讓護理人員進入您的位置',
    },
    '37iyoise': {
      'en': 'Quick reference notes',
      'bn': 'দ্রুত রেফারেন্স নোট',
      'hi': 'त्वरित संदर्भ नोट्स',
      'id': 'Catatan referensi cepat',
      'vi': 'Ghi chú tham khảo nhanh',
      'zh_Hans': '快速参考笔记',
      'zh_Hant': '快速參考筆記',
    },
    'g6odhwig': {
      'en': 'Name: ',
      'bn': 'নাম:',
      'hi': 'नाम:',
      'id': 'Nama:',
      'vi': 'Tên:',
      'zh_Hans': '姓名：',
      'zh_Hant': '姓名：',
    },
    'r2dygbq2': {
      'en': 'Age: ',
      'bn': 'বয়স:',
      'hi': 'आयु:',
      'id': 'Usia:',
      'vi': 'Tuổi:',
      'zh_Hans': '年龄：',
      'zh_Hant': '年齡：',
    },
    'dfbgowpl': {
      'en': 'Medication notes:  ',
      'bn': 'ওষুধের নোট:',
      'hi': 'दवा संबंधी नोट:',
      'id': 'Catatan pengobatan:',
      'vi': 'Ghi chú thuốc:',
      'zh_Hans': '用药注意事项：',
      'zh_Hant': '用藥注意事項：',
    },
    'm7kszxl9': {
      'en': 'History: ',
      'bn': 'ইতিহাস:',
      'hi': 'इतिहास:',
      'id': 'Sejarah:',
      'vi': 'Lịch sử:',
      'zh_Hans': '历史：',
      'zh_Hant': '歷史：',
    },
    'o1rz55id': {
      'en': 'Special notes: ',
      'bn': 'বিশেষ নোট:',
      'hi': 'विशेष नोट:',
      'id': 'Catatan khusus:',
      'vi': 'Ghi chú đặc biệt:',
      'zh_Hans': '特别提示：',
      'zh_Hant': '特別提示：',
    },
    'm6ge43g1': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // patientSelect
  {
    'fxkcp7lf': {
      'en': 'Your contacts',
      'bn': 'আপনার পরিচিতি',
      'hi': 'आपके संपर्क',
      'id': 'Kontak Anda',
      'vi': 'Danh bạ của bạn',
      'zh_Hans': '您的联系人',
      'zh_Hant': '您的聯絡人',
    },
    '3i3tnck4': {
      'en': 'Use unknown contact',
      'bn': 'অজানা পরিচিতি ব্যবহার করুন',
      'hi': 'अज्ञात संपर्क का उपयोग करें',
      'id': 'Gunakan kontak yang tidak dikenal',
      'vi': 'Sử dụng liên hệ không xác định',
      'zh_Hans': '使用未知联系人',
      'zh_Hant': '使用未知聯絡人',
    },
    'swmeadid': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // heartAttackPage2C
  {
    'sj5l42v0': {
      'en': 'Conscious',
      'bn': 'সচেতন',
      'hi': 'सचेत',
      'id': 'Sadar',
      'vi': 'Biết rõ',
      'zh_Hans': '有意识的',
      'zh_Hant': '有意識的',
    },
    'odsw0wpq': {
      'en':
          '1. Follow DRSABCD St John Action Plan.\n2. Locate the nearest defibrillator and keep it on standby\n3. Advise the casualty to immediately sit down to rest and reassure them\n4. If the casualty has been prescribed medication such as a tablet or oral spray for angina, assist them to take it as they have been directed\n5. If symptoms last for ten (10) minutes or become worse quickly or are severe, call Triple Zero (000) for an ambulance immediately\n6. Give 300mg (one tablet) of aspirin with water. DO NOT give aspirin to those allergic to it or if their doctor has advised them against taking aspirin\n7. Stay with the casualty and monitor consciousness and vital signs. Be prepared to give CPR and administer defibrillation if symptoms worsen.',
      'bn':
          '1. DRSABCD সেন্ট জন অ্যাকশন প্ল্যান অনুসরণ করুন।\n2. নিকটতম ডিফিব্রিলেটর সনাক্ত করুন এবং এটি স্ট্যান্ডবাইতে রাখুন\n3. আহত ব্যক্তিকে অবিলম্বে বিশ্রামের জন্য বসতে এবং তাদের আশ্বস্ত করার পরামর্শ দিন\n4. যদি আহত ব্যক্তিকে এনজাইনার জন্য ট্যাবলেট বা ওরাল স্প্রের মতো ওষুধ দেওয়া হয়, তবে তাদের নির্দেশিত হিসাবে এটি গ্রহণ করতে সহায়তা করুন\n5. যদি লক্ষণগুলি দশ (10) মিনিটের জন্য স্থায়ী হয় বা দ্রুত খারাপ হয়ে যায় বা গুরুতর হয়, অবিলম্বে একটি অ্যাম্বুলেন্সের জন্য ট্রিপল জিরো (000) কল করুন\n6. পানির সাথে 300mg (একটি ট্যাবলেট) অ্যাসপিরিন দিন। যাদের অ্যালার্জি আছে তাদের অ্যাসপিরিন দেবেন না বা যদি তাদের ডাক্তার তাদের অ্যাসপিরিন গ্রহণের বিরুদ্ধে পরামর্শ দেন\n7. হতাহতদের সাথে থাকুন এবং চেতনা এবং গুরুত্বপূর্ণ লক্ষণগুলি পর্যবেক্ষণ করুন। সিপিআর দেওয়ার জন্য প্রস্তুত থাকুন এবং উপসর্গগুলি খারাপ হলে ডিফিব্রিলেশন পরিচালনা করুন।',
      'hi':
          '1. डीआरएसएबीसीडी सेंट जॉन एक्शन प्लान का पालन करें।\n2. निकटतम डिफाइब्रिलेटर का पता लगाएं और इसे स्टैंडबाय पर रखें\n3. पीड़ित को तुरंत आराम करने और आश्वस्त करने के लिए बैठने की सलाह दें\n4. यदि पीड़ित को एनजाइना के लिए टैबलेट या ओरल स्प्रे जैसी दवा दी गई है, तो उन्हें निर्देशानुसार इसे लेने में सहायता करें।\n5. यदि लक्षण दस (10) मिनट तक रहते हैं या जल्दी खराब हो जाते हैं या गंभीर हैं, तो तुरंत एम्बुलेंस के लिए ट्रिपल ज़ीरो (000) को कॉल करें\n6. 300 मिलीग्राम (एक गोली) एस्पिरिन पानी के साथ दें। जिन लोगों को एस्पिरिन से एलर्जी है या जिनके डॉक्टर ने उन्हें एस्पिरिन न लेने की सलाह दी है, उन्हें एस्पिरिन न दें\n7. पीड़ित के साथ रहें और चेतना और महत्वपूर्ण संकेतों की निगरानी करें। लक्षण बिगड़ने पर सीपीआर देने और डिफाइब्रिलेशन देने के लिए तैयार रहें।',
      'id':
          '1. Ikuti Rencana Aksi DRSABCD St John.\n2. Temukan defibrilator terdekat dan jaga agar tetap siaga\n3. Anjurkan korban untuk segera duduk beristirahat dan menenangkannya\n4. Jika korban telah diberi resep obat seperti tablet atau semprotan oral untuk angina, bantulah mereka untuk meminumnya sesuai petunjuk.\n5. Jika gejala berlangsung selama sepuluh (10) menit atau memburuk dengan cepat atau parah, segera hubungi Triple Zero (000) untuk ambulans\n6. Berikan 300mg (satu tablet) aspirin dengan air. JANGAN berikan aspirin kepada mereka yang alergi atau jika dokter menyarankan mereka untuk tidak mengonsumsi aspirin\n7. Tetap bersama korban dan pantau kesadaran dan tanda-tanda vital. Bersiaplah untuk memberikan CPR dan lakukan defibrilasi jika gejalanya memburuk.',
      'vi':
          '1. Thực hiện theo Kế hoạch hành động DRSABCD St John.\n2. Xác định vị trí máy khử rung tim gần nhất và giữ nó ở chế độ chờ\n3. Khuyên nạn nhân ngồi xuống nghỉ ngơi ngay và trấn an họ\n4. Nếu nạn nhân đã được kê đơn thuốc như thuốc viên hoặc thuốc xịt miệng để điều trị chứng đau thắt ngực, hãy giúp họ dùng thuốc theo chỉ dẫn\n5. Nếu các triệu chứng kéo dài trong mười (10) phút hoặc trở nên tồi tệ nhanh chóng hoặc nghiêm trọng, hãy gọi Ba Số Không (000) để được cấp cứu ngay lập tức\n6. Cho 300mg (một viên) aspirin với nước. KHÔNG dùng aspirin cho những người bị dị ứng với nó hoặc nếu bác sĩ khuyên họ không nên dùng aspirin\n7. Ở bên cạnh nạn nhân và theo dõi ý thức cũng như các dấu hiệu sinh tồn. Hãy chuẩn bị thực hiện hô hấp nhân tạo và khử rung tim nếu các triệu chứng trở nên trầm trọng hơn.',
      'zh_Hans':
          '1. 遵循 DRSABCD 圣约翰行动计划。\n2. 找到最近的除颤器并使其处于待命状态\n3.建议伤员立即坐下休息并安抚他们\n4. 如果为伤员开了治疗心绞痛的药片或口腔喷雾剂等药物，请协助他们按照指示服用\n5. 如果症状持续十 (10) 分钟或迅速恶化或严重，请立即拨打三个零 (000) 叫救护车\n6. 用水送服 300 毫克（一粒）阿司匹林。不要给对阿司匹林过敏的人服用阿司匹林，或者如果他们的医生建议他们不要服用阿司匹林\n7. 留在伤员身边并监测意识和生命体征。如果症状恶化，准备好进行心肺复苏并进行除颤。',
      'zh_Hant':
          '1. 遵循 DRSABCD 聖約翰行動計畫。\n2. 找到最近的除顫器並使其處於待命狀態\n3.建議傷者立即坐下休息並安撫他們\n4. 如果為傷者開了治療心絞痛的藥片或口腔噴霧等藥物，請協助他們依照指示服用\n5. 如果症狀持續十 (10) 分鐘或迅速惡化或嚴重，請立即撥打三個零 (000) 叫救護車\n6. 用水送服 300 毫克（一粒）阿斯匹靈。不要給對阿斯匹靈過敏的人服用阿斯匹靈，或者如果他們的醫生建議他們不要服用阿斯匹靈\n7. 留在傷者身邊並監測意識和生命徵象。如果症狀惡化，準備好進行心肺復甦術並進行除顫。',
    },
    'o9s1f5gx': {
      'en': 'DRSABCD',
      'bn': 'DRSABCD',
      'hi': 'डीआरएसएबीसीडी',
      'id': 'DRSABCD',
      'vi': 'DRSABCD',
      'zh_Hans': 'DRSABCD',
      'zh_Hant': 'DRSABCD',
    },
    '1uizfij5': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // heartAttackPage1
  {
    'wh3e36yt': {
      'en': 'Step 1: Recognise ',
      'bn': 'ধাপ 1: চিনুন',
      'hi': 'चरण 1: पहचानें',
      'id': 'Langkah 1: Kenali',
      'vi': 'Bước 1: Nhận biết',
      'zh_Hans': '第 1 步：认识',
      'zh_Hant': '第 1 步：認識',
    },
    'fay8vosc': {
      'en': 'Pain',
      'bn': 'ব্যাথা',
      'hi': 'दर्द',
      'id': 'Nyeri',
      'vi': 'Nỗi đau',
      'zh_Hans': '疼痛',
      'zh_Hant': '疼痛',
    },
    '4gycqmhf': {
      'en':
          ' - pain  in the chest may be:\n+ Tight, gripping or squeezing\n+ Mild to severe\n+ Felt in the centre of the chest, shoulders, back, neck or jaw.',
      'bn':
          '- বুকে ব্যথা হতে পারে:\n+ আঁটসাঁট, আঁকড়ে ধরা বা চেপে ধরা\n+ হালকা থেকে গুরুতর\n+ বুক, কাঁধ, পিঠ, ঘাড় বা চোয়ালের মাঝখানে অনুভূত হয়।',
      'hi':
          '- सीने में दर्द हो सकता है:\n+ कसकर, पकड़ना या निचोड़ना\n+ हल्के से गंभीर\n+ छाती, कंधे, पीठ, गर्दन या जबड़े के बीच में महसूस होना।',
      'id':
          '- nyeri di dada mungkin:\n+ Ketat, mencekam atau meremas\n+ Ringan hingga parah\n+ Terasa di bagian tengah dada, bahu, punggung, leher atau rahang.',
      'vi':
          '- Đau ngực có thể là:\n+ Siết chặt, kẹp chặt\n+ Từ nhẹ đến nặng\n+ Cảm giác ở trung tâm ngực, vai, lưng, cổ hoặc hàm.',
      'zh_Hans': '- 胸部疼痛可能是：\n+ 紧、夹紧或挤压\n+ 轻度至重度\n+ 感觉在胸部、肩膀、背部、颈部或下巴的中心。',
      'zh_Hant': '- 胸部疼痛可能是：\n+ 緊、夾緊或擠壓\n+ 輕度至重度\n+ 感覺在胸部、肩膀、背部、頸部或下巴的中心。',
    },
    'jojrmzy5': {
      'en': 'Breathlessness',
      'bn': 'শ্বাসকষ্ট',
      'hi': 'सांस फूलना',
      'id': 'Sesak napas',
      'vi': 'Khó thở',
      'zh_Hans': '呼吸困难',
      'zh_Hant': '呼吸困難',
    },
    '86f9nabe': {
      'en': 'Dizzy, lightheaded',
      'bn': 'মাথা ঘোরা, হালকা মাথা',
      'hi': 'चक्कर आ रहा है, सिर चकरा रहा है',
      'id': 'Pusing, pusing',
      'vi': 'Chóng mặt, choáng váng',
      'zh_Hans': '头晕、头重脚轻',
      'zh_Hant': '頭暈、頭重腳輕',
    },
    'uq61ynm8': {
      'en': 'Feel sick or may vomit',
      'bn': 'অসুস্থ বোধ করা বা বমি হতে পারে',
      'hi': 'बीमार महसूस करें या उल्टी हो सकती है',
      'id': 'Merasa mual atau mungkin muntah',
      'vi': 'Cảm thấy ốm yếu hoặc có thể nôn mửa',
      'zh_Hans': '感觉不舒服或可能呕吐',
      'zh_Hant': '感覺不舒服或可能嘔吐',
    },
    '7tmhn0qx': {
      'en': 'Pale, cold, clammy skin',
      'bn': 'ফ্যাকাশে, ঠান্ডা, আঁটসাঁট ত্বক',
      'hi': 'पीली, ठंडी, चिपचिपी त्वचा',
      'id': 'Kulit pucat, dingin, dan lembap',
      'vi': 'Da nhợt nhạt, lạnh, ẩm ướt',
      'zh_Hans': '皮肤苍白、寒冷、湿冷',
      'zh_Hant': '皮膚蒼白、冰冷、濕冷',
    },
    'v0k9zyxx': {
      'en': 'May collapse and suffer a cardiac arrest.',
      'bn': 'ভেঙে পড়তে পারে এবং কার্ডিয়াক অ্যারেস্টের শিকার হতে পারে।',
      'hi': 'गिर सकता है और हृदयाघात हो सकता है।',
      'id': 'Mungkin pingsan dan menderita serangan jantung.',
      'vi': 'Có thể suy sụp và bị ngừng tim.',
      'zh_Hans': '可能会崩溃并导致心脏骤停。',
      'zh_Hant': '可能會崩潰並導致心臟驟停。',
    },
    'kk37gp79': {
      'en': 'Next (conscious)',
      'bn': 'পরবর্তী (সচেতন)',
      'hi': 'अगला (सचेत)',
      'id': 'Selanjutnya (sadar)',
      'vi': 'Tiếp theo (có ý thức)',
      'zh_Hans': '接下来（有意识）',
      'zh_Hant': '接下來（有意識）',
    },
    '3v8jparb': {
      'en': 'Next (unconscious)',
      'bn': 'পরবর্তী (অচেতন)',
      'hi': 'अगला (अचेतन)',
      'id': 'Selanjutnya (tidak sadarkan diri)',
      'vi': 'Tiếp theo (vô thức)',
      'zh_Hans': '接下来（无意识）',
      'zh_Hant': '接下來（無意識）',
    },
    'jqk5jkgu': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // heartAttackPage2U
  {
    'z5al3jrm': {
      'en': 'Unconscious',
      'bn': 'অজ্ঞান',
      'hi': 'अचेत',
      'id': 'Tidak sadar',
      'vi': 'Vô ý thức',
      'zh_Hans': '无意识',
      'zh_Hant': '無意識',
    },
    '05dgr2tb': {
      'en':
          '1. Follow DRSABCD St John Action Plan\n2. Locate the nearest defibrillator and keep it on standby\n3. Place casualty in recovery position\n4. Urgent medical aid. Call Triple Zero (000) for an ambulance\n5. Stay with the casualty and monitor breathing\n6. Be prepared to give CPR and administer defibrillation if symptoms worsen.',
      'bn':
          '1. DRSABCD সেন্ট জন অ্যাকশন প্ল্যান অনুসরণ করুন\n2. নিকটতম ডিফিব্রিলেটর সনাক্ত করুন এবং এটি স্ট্যান্ডবাইতে রাখুন\n3. আহত ব্যক্তিকে পুনরুদ্ধারের অবস্থানে রাখুন\n4. জরুরী চিকিৎসা সহায়তা। একটি অ্যাম্বুলেন্সের জন্য ট্রিপল জিরো (000) কল করুন\n5. আহত ব্যক্তির সাথে থাকুন এবং শ্বাস-প্রশ্বাস নিরীক্ষণ করুন\n6. সিপিআর দেওয়ার জন্য প্রস্তুত থাকুন এবং উপসর্গগুলি খারাপ হলে ডিফিব্রিলেশন পরিচালনা করুন।',
      'hi':
          '1. डीआरएसएबीसीडी सेंट जॉन एक्शन प्लान का पालन करें\n2. निकटतम डिफाइब्रिलेटर का पता लगाएं और इसे स्टैंडबाय पर रखें\n3. हताहत को पुनर्प्राप्ति स्थिति में रखें\n4. तत्काल चिकित्सा सहायता. एम्बुलेंस के लिए ट्रिपल जीरो (000) पर कॉल करें\n5. पीड़ित के साथ रहें और सांस लेने की निगरानी करें\n6. लक्षण बिगड़ने पर सीपीआर देने और डिफिब्रिलेशन देने के लिए तैयार रहें।',
      'id':
          '1. Ikuti Rencana Aksi DRSABCD St John\n2. Temukan defibrilator terdekat dan jaga agar tetap siaga\n3. Baringkan korban pada posisi pemulihan\n4. Bantuan medis yang mendesak. Hubungi Triple Zero (000) untuk ambulans\n5. Tetap bersama korban dan pantau pernapasannya\n6. Bersiaplah untuk memberikan CPR dan lakukan defibrilasi jika gejalanya memburuk.',
      'vi':
          '1. Thực hiện theo Kế hoạch hành động DRSABCD St John\n2. Xác định vị trí máy khử rung tim gần nhất và giữ nó ở chế độ chờ\n3. Đặt nạn nhân ở tư thế hồi phục\n4. Hỗ trợ y tế khẩn cấp. Gọi Ba Số Không (000) để gọi xe cứu thương\n5. Ở bên nạn nhân và theo dõi nhịp thở\n6. Hãy chuẩn bị thực hiện hô hấp nhân tạo và khử rung tim nếu các triệu chứng trở nên trầm trọng hơn.',
      'zh_Hans':
          '1. 遵循 DRSABCD 圣约翰行动计划\n2. 找到最近的除颤器并使其处于待命状态\n3. 将伤员置于恢复位置\n4.紧急医疗救助。拨打三个零 (000) 叫救护车\n5. 留在伤员身边并监测呼吸\n6. 如果症状恶化，准备好进行心肺复苏并进行除颤。',
      'zh_Hant':
          '1. 遵循 DRSABCD 聖約翰行動計劃\n2. 找到最近的除顫器並使其處於待命狀態\n3. 將傷患置於恢復位置\n4.緊急醫療救助。撥打三個零 (000) 叫救護車\n5. 留在傷患身邊並監測呼吸\n6. 如果症狀惡化，準備好進行心肺復甦術並進行除顫。',
    },
    'wy4i2gkj': {
      'en': 'DRSABCD',
      'bn': 'DRSABCD',
      'hi': 'डीआरएसएबीसीडी',
      'id': 'DRSABCD',
      'vi': 'DRSABCD',
      'zh_Hans': 'DRSABCD',
      'zh_Hant': 'DRSABCD',
    },
    'ioane2i1': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // DRSABCDPAGE
  {
    '9lewjifg': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Settings
  {
    'csuom9on': {
      'en': 'Manage action plans',
      'bn': 'কর্ম পরিকল্পনা পরিচালনা করুন',
      'hi': 'कार्य योजनाएँ प्रबंधित करें',
      'id': 'Kelola rencana tindakan',
      'vi': 'Quản lý kế hoạch hành động',
      'zh_Hans': '管理行动计划',
      'zh_Hant': '管理行動計劃',
    },
    '5icb2tit': {
      'en': 'Create new',
      'bn': 'নতুন তৈরী করা',
      'hi': 'नया निर्माण',
      'id': 'Membuat baru',
      'vi': 'Tạo mới',
      'zh_Hans': '创建新的',
      'zh_Hant': '創建新的',
    },
    'utspxnap': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // createPlan
  {
    '46zevhly': {
      'en': 'Person name...',
      'bn': 'ব্যক্তির নাম...',
      'hi': 'व्यक्ति का नाम...',
      'id': 'Nama orang...',
      'vi': 'Tên người...',
      'zh_Hans': '人名...',
      'zh_Hant': '人名...',
    },
    'b6at6he2': {
      'en': 'Age...',
      'bn': 'বয়স...',
      'hi': 'आयु...',
      'id': 'Usia...',
      'vi': 'Tuổi...',
      'zh_Hans': '年龄...',
      'zh_Hant': '年齡...',
    },
    '2gxnrtn9': {
      'en': 'Medical history...',
      'bn': 'চিকিৎসা ইতিহাস...',
      'hi': 'चिकित्सा का इतिहास...',
      'id': 'Riwayat kesehatan...',
      'vi': 'Tiền sử bệnh...',
      'zh_Hans': '病史...',
      'zh_Hant': '病史...',
    },
    '7mkpinaa': {
      'en': 'Medication notes...',
      'bn': 'ওষুধের নোট...',
      'hi': 'दवा नोट्स...',
      'id': 'Catatan obat...',
      'vi': 'Ghi chú thuốc...',
      'zh_Hans': '用药笔记...',
      'zh_Hant': '用藥筆記...',
    },
    'gyufkikv': {
      'en': 'Special notes...',
      'bn': 'বিশেষ নোট...',
      'hi': 'विशेष नोट...',
      'id': 'Catatan khusus...',
      'vi': 'Ghi chú đặc biệt...',
      'zh_Hans': '特别说明...',
      'zh_Hant': '特別說明...',
    },
    'xg4fndwi': {
      'en': 'Create',
      'bn': 'সৃষ্টি',
      'hi': 'बनाएं',
      'id': 'Membuat',
      'vi': 'Tạo nên',
      'zh_Hans': '创造',
      'zh_Hant': '創造',
    },
    '80gkkwvn': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // editPlan
  {
    'abvn74e0': {
      'en': 'Person name...',
      'bn': 'ব্যক্তির নাম...',
      'hi': 'व्यक्ति का नाम...',
      'id': 'Nama orang...',
      'vi': 'Tên người...',
      'zh_Hans': '人名...',
      'zh_Hant': '人名...',
    },
    'o3artxus': {
      'en': 'Age...',
      'bn': 'বয়স...',
      'hi': 'आयु...',
      'id': 'Usia...',
      'vi': 'Tuổi...',
      'zh_Hans': '年龄...',
      'zh_Hant': '年齡...',
    },
    'nz949xpn': {
      'en': 'Medical history...',
      'bn': 'চিকিৎসা ইতিহাস...',
      'hi': 'चिकित्सा का इतिहास...',
      'id': 'Riwayat kesehatan...',
      'vi': 'Tiền sử bệnh...',
      'zh_Hans': '病史...',
      'zh_Hant': '病史...',
    },
    'zdpsx9rv': {
      'en': 'Medication...',
      'bn': 'ওষুধ...',
      'hi': 'दवाई...',
      'id': 'Pengobatan...',
      'vi': 'Thuốc...',
      'zh_Hans': '药物...',
      'zh_Hant': '藥物...',
    },
    'ee0ut7wl': {
      'en': 'Special notes...',
      'bn': 'বিশেষ নোট...',
      'hi': 'विशेष नोट...',
      'id': 'Catatan khusus...',
      'vi': 'Ghi chú đặc biệt...',
      'zh_Hans': '特别说明...',
      'zh_Hant': '特別說明...',
    },
    'r93bgz0i': {
      'en': 'Apply',
      'bn': 'আবেদন করুন',
      'hi': 'आवेदन करना',
      'id': 'Menerapkan',
      'vi': 'Áp dụng',
      'zh_Hans': '申请',
      'zh_Hant': '申請',
    },
    'bm3cr38i': {
      'en': 'Home',
      'bn': 'বাড়ি',
      'hi': 'घर',
      'id': 'Rumah',
      'vi': 'Trang chủ',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // languageSelect
  {
    'o4v86psf': {
      'en': 'Select language',
      'bn': 'ভাষা নির্বাচন কর',
      'hi': 'भाषा चुने',
      'id': 'Pilih bahasa',
      'vi': 'Chọn ngôn ngữ',
      'zh_Hans': '选择语言',
      'zh_Hant': '選擇語言',
    },
    'qtu7iqdk': {
      'en': 'English',
      'bn': 'ইংরেজি',
      'hi': 'अंग्रेज़ी',
      'id': 'Bahasa inggris',
      'vi': 'Tiếng Anh',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'jajnhjpb': {
      'en': 'Bengali',
      'bn': 'বাংলা',
      'hi': 'बंगाली',
      'id': 'Benggala',
      'vi': 'tiếng Bengali',
      'zh_Hans': '孟加拉',
      'zh_Hant': '孟加拉',
    },
    'qv5wvnb8': {
      'en': 'Chinese (Traditional)',
      'bn': 'প্রথাগত চীনা)',
      'hi': 'चीनी पारंपरिक)',
      'id': 'Cina tradisional)',
      'vi': 'Truyền thống Trung Hoa)',
      'zh_Hans': '中国传统的）',
      'zh_Hant': '中國傳統的）',
    },
    'mz3r369r': {
      'en': 'Chinese (Simplified)',
      'bn': 'সরলীকৃত চীনা)',
      'hi': 'सरलीकृत चीनी)',
      'id': 'Bahasa Tiongkok yang disederhanakan)',
      'vi': 'Tiếng Trung (Giản thể)',
      'zh_Hans': '简体中文）',
      'zh_Hant': '簡體中文）',
    },
    '1mp4k4aa': {
      'en': 'Hindi',
      'bn': 'হিন্দি',
      'hi': 'हिंदी',
      'id': 'Hindi',
      'vi': 'Tiếng Hindi',
      'zh_Hans': '印地语',
      'zh_Hant': '印地語',
    },
    'clehg0zn': {
      'en': 'Indonesian',
      'bn': 'ইন্দোনেশিয়ান',
      'hi': 'इन्डोनेशियाई',
      'id': 'bahasa Indonesia',
      'vi': 'tiếng Indonesia',
      'zh_Hans': '印度尼西亚',
      'zh_Hant': '印尼',
    },
    'omsdx4ar': {
      'en': 'Vietnamese',
      'bn': 'ভিয়েতনামী',
      'hi': 'वियतनामी',
      'id': 'Orang Vietnam',
      'vi': 'Tiếng Việt',
      'zh_Hans': '越南语',
      'zh_Hant': '越南語',
    },
  },
  // Disclaimer
  {
    'xi62ix8a': {
      'en': 'Disclaimer',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7wlxpi3f': {
      'en': 'You must accept this disclaimer prior to using the app',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r355ycxx': {
      'en':
          'FlutterFlow is an amazing platform that allows developers to create powerful, interactive and responsive mobile and web applications. It is built using Flutter, a popular open-source framework for creating cross-platform applications, and offers a wide range of features that make app development faster and more efficient. With FlutterFlow, developers can create beautiful and engaging user interfaces, implement complex logic and animations, and easily connect to APIs and other services. \n\nAdditionally, it provides real-time collaboration feature, so multiple developers can work on the same project simultaneously. Overall, FlutterFlow is a fantastic tool for any developer looking to build high-quality apps quickly and easily.',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ggk1gm8t': {
      'en': 'Cancel',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2ui96pyr': {
      'en': 'Confirm Action',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    'yemtnvs4': {
      'en':
          'In order to provide accurate location data for you to pass on to emergency services',
      'bn':
          'জরুরী পরিষেবাগুলিতে আপনার কাছে যাওয়ার জন্য সঠিক অবস্থানের ডেটা সরবরাহ করার জন্য',
      'hi':
          'आपको आपातकालीन सेवाओं तक पहुंचाने के लिए सटीक स्थान डेटा प्रदान करने के लिए',
      'id':
          'Untuk memberikan data lokasi yang akurat untuk Anda sampaikan ke layanan darurat',
      'vi':
          'Để cung cấp dữ liệu vị trí chính xác để bạn chuyển đến các dịch vụ khẩn cấp',
      'zh_Hans': '为了向您提供准确的位置数据以传递给紧急服务部门',
      'zh_Hant': '為了向您提供準確的位置資料以傳遞給緊急服務部門',
    },
    'xw1ulvwe': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l6ghwdpp': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yonskk85': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ob16z6ag': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l1ae0xmn': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    's3rfj5o0': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0l31dl57': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'b03up51t': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dr302poe': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7vcayxuf': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7o8bdui4': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'q84ei3pm': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0usotke2': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'f6xhl4pe': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1ap98ddh': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mv5yas06': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1ushzihj': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a1yp3mgg': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bxw4swz3': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'drpc450g': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lwogne6b': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9xxqmaow': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'g7wn1ok3': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '7t6goeu0': {
      'en': '',
      'bn': '',
      'hi': '',
      'id': '',
      'vi': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
