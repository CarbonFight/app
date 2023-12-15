import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

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
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

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
  // signin
  {
    '6uqcb4p5': {
      'fr': 'Bienvenue !',
      'en': '',
    },
    'ehk7h084': {
      'fr': 'Continuer avec Google',
      'en': '',
    },
    'rbkd2dwn': {
      'fr': 'Continuer avec Facebook',
      'en': '',
    },
    'j2i2e8sw': {
      'fr': 'Continuer avec Apple',
      'en': '',
    },
    'eo1evjqd': {
      'fr': 'OU',
      'en': '',
    },
    'rqtmbglk': {
      'fr': 'Email',
      'en': '',
    },
    'wpifx5qj': {
      'fr': 'Saisissez votre E-mail',
      'en': '',
    },
    'exnbjce7': {
      'fr': 'Mot de passe',
      'en': '',
    },
    'pxkzid22': {
      'fr': 'Entrez votre mot de passe',
      'en': '',
    },
    '6pc0e09e': {
      'fr': 'Suivant',
      'en': '',
    },
    't7u0tm3i': {
      'fr': 'Mot de passe oublié',
      'en': '',
    },
    '3gfbhqb5': {
      'fr': 'Pas encore de compte ? ',
      'en': '',
    },
    '2lv2akw8': {
      'fr': 'Ouvrez un compte',
      'en': '',
    },
    'aliu447u': {
      'fr': 'Home',
      'en': '',
    },
  },
  // home
  {
    'fn0v3p5y': {
      'fr': 'Journée',
      'en': '',
    },
    'rxuh8t51': {
      'fr': 'Semaine',
      'en': '',
    },
    '5w9uwt6p': {
      'fr': 'Mois',
      'en': '',
    },
    'm7r6h8h7': {
      'fr': 'Journée',
      'en': '',
    },
    'x7lx96z5': {
      'fr': '',
      'en': '',
    },
    'fb5tanar': {
      'fr': 'co2e ',
      'en': '',
    },
    '9dw9wfe9': {
      'fr': 'Objectif : ',
      'en': '',
    },
    '5q1t5ybu': {
      'fr': '\nActions : ',
      'en': '',
    },
    '2q5mvw1p': {
      'fr': '8',
      'en': '',
    },
    'egwarsii': {
      'fr': '\nRestant : ',
      'en': '',
    },
    'eb60dfzq': {
      'fr': '4.2 kg',
      'en': '',
    },
    'psa1l9a5': {
      'fr': 'Ajouter',
      'en': '',
    },
    'pzswimp1': {
      'fr': 'Acceuil',
      'en': '',
    },
  },
  // challenges
  {
    '4jru0nxj': {
      'fr': 'Score \n',
      'en': '',
    },
    'ud4x7r30': {
      'fr': ' / ',
      'en': '',
    },
    'kb73nmdc': {
      'fr': 'Validés',
      'en': '',
    },
    'ftocvnf8': {
      'fr': 'Tous',
      'en': '',
    },
    'rhnew14v': {
      'fr': 'Non validés',
      'en': '',
    },
    'n6bbpw7n': {
      'fr': 'Tous',
      'en': '',
    },
    'o75pt1cq': {
      'fr': 'Prise en main ',
      'en': '',
    },
    'f2vzsfr2': {
      'fr': ' / ',
      'en': '',
    },
    'ggmbgj8r': {
      'fr': 'Tut tut ! ',
      'en': '',
    },
    'kfriy1o1': {
      'fr': '\nAjouter votre première action dans la catégorie trajets.',
      'en': '',
    },
    'tyf5bf8g': {
      'fr': 'Et mes chausettes...\n',
      'en': '',
    },
    'olcmrjx9': {
      'fr': 'Ajouter votre première action dans la catégorie habits.',
      'en': '',
    },
    'f69642yh': {
      'fr': '0100110101010111 !\n',
      'en': '',
    },
    'dnocnwvb': {
      'fr': 'Ajouter votre première action dans la catégorie numérique.',
      'en': '',
    },
    'd8g7rris': {
      'fr': 'Le "four" tout\n',
      'en': '',
    },
    'h0i9x50s': {
      'fr': 'Ajouter votre première action dans la catégorie éectroménager.',
      'en': '',
    },
    '8w82szb3': {
      'fr': 'Fond de canap\n',
      'en': '',
    },
    '1jyocymq': {
      'fr': 'Ajouter votre première action dans la catégorie mobilier.',
      'en': '',
    },
    '1kr6jt0o': {
      'fr': 'Je possède des trucs\n',
      'en': '',
    },
    'gucmastk': {
      'fr': 'Ajouter votre première action dans la catégorie objets.',
      'en': '',
    },
    'ipw1lv26': {
      'fr': 'Home sweet home\n',
      'en': '',
    },
    '257yhjra': {
      'fr': 'Ajouter votre première action dans la catégorie logement.',
      'en': '',
    },
    'lnh6lvom': {
      'fr': 'La crèpe au sucre\n',
      'en': '',
    },
    'ebetsoj3': {
      'fr': 'Ajouter votre première action dans la catégorie repas.',
      'en': '',
    },
    '5ulxwrhf': {
      'fr': 'Fidélisation ',
      'en': '',
    },
    'mtxzwn2j': {
      'fr': ' / ',
      'en': '',
    },
    '6sc3zdis': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    '1ivcmeux': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'g9pj9rrb': {
      'fr': 'Trajets ',
      'en': '',
    },
    'nc0yehjw': {
      'fr': ' / ',
      'en': '',
    },
    'd7i2n8lq': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    '8ff4os7p': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'u95m8j09': {
      'fr': 'Repas ',
      'en': '',
    },
    'b95ic137': {
      'fr': ' / ',
      'en': '',
    },
    'pcg0vh04': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    '4d1ok44r': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'u6azu41v': {
      'fr': 'Communauté ',
      'en': '',
    },
    'nk9vd2sg': {
      'fr': ' / ',
      'en': '',
    },
    'cckfy06h': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    'etb5acw6': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'w0v2ko2z': {
      'fr': 'Défis',
      'en': '',
    },
  },
  // actions
  {
    'zzwr8zjm': {
      'fr': 'Total de la journée: ',
      'en': '',
    },
    'ei7wuxeu': {
      'fr': 'Ajouter',
      'en': '',
    },
    'f76nnnpw': {
      'fr': 'Déclarer',
      'en': '',
    },
  },
  // stats
  {
    'zml0k9s1': {
      'fr': 'Statistiques',
      'en': '',
    },
    '0ru50o8x': {
      'fr': 'Période : ',
      'en': '',
    },
    '2q8tnc6r': {
      'fr': '1 semaine',
      'en': '',
    },
    'uc07utw6': {
      'fr': 'Aujourd\'hui',
      'en': '',
    },
    '99t9lu5k': {
      'fr': '1 semaine',
      'en': '',
    },
    '5ep0rmp9': {
      'fr': '1 mois',
      'en': '',
    },
    '7i3igmai': {
      'fr': 'Please select...',
      'en': '',
    },
    'e1ayigwd': {
      'fr': 'Search for an item...',
      'en': '',
    },
    '22fgei0g': {
      'fr': 'CO2e',
      'en': '',
    },
    'f86dijiz': {
      'fr': 'Emissions par catégories',
      'en': '',
    },
    '63o0r9e6': {
      'fr': 'Trajets',
      'en': '',
    },
    'gm72b53c': {
      'fr': 'Numérique',
      'en': '',
    },
    'sdnioeag': {
      'fr': 'Electro',
      'en': '',
    },
    '4gzkhqa1': {
      'fr': 'Logement',
      'en': '',
    },
    '9y33zkv8': {
      'fr': 'Mobilier',
      'en': '',
    },
    'vat4daoa': {
      'fr': 'Objets',
      'en': '',
    },
    'pth1wsep': {
      'fr': 'Repas',
      'en': '',
    },
    'tmiy5sq3': {
      'fr': 'Habits',
      'en': '',
    },
    'nj0est65': {
      'fr': 'Services',
      'en': '',
    },
    'o8lpi1in': {
      'fr': 'Nombre de parrainages : ',
      'en': '',
    },
    'dqtpj9dr': {
      'fr': 'Stats',
      'en': '',
    },
  },
  // profil
  {
    'k88at6dd': {
      'fr': 'Mon objectif',
      'en': '',
    },
    'gtkuqi5o': {
      'fr': 'Mes badges',
      'en': '',
    },
    'yj45uxpz': {
      'fr': 'Mes informations',
      'en': '',
    },
    'j1lhla3n': {
      'fr': 'Mon journal',
      'en': '',
    },
    'musobdbz': {
      'fr': 'L\'association CarbonFight',
      'en': '',
    },
    'n0nwij6r': {
      'fr': 'Se déconnecter',
      'en': '',
    },
    'u7lri6tm': {
      'fr': ' - ',
      'en': '',
    },
    '3c3oyb8t': {
      'fr': 'Supprimer mon compte',
      'en': '',
    },
    '9mhj5ig3': {
      'fr': 'Profil',
      'en': '',
    },
  },
  // categories
  {
    'xt1y5qyx': {
      'fr': 'Trajets',
      'en': '',
    },
    '1wqq8ncp': {
      'fr': 'Logement',
      'en': '',
    },
    '87thqolb': {
      'fr': 'Repas',
      'en': '',
    },
    '2wmj66wh': {
      'fr': 'Numérique',
      'en': '',
    },
    'gz68zuzc': {
      'fr': 'Mobilier',
      'en': '',
    },
    '420txis1': {
      'fr': 'Habits',
      'en': '',
    },
    'qel90sfm': {
      'fr': 'Electroménager',
      'en': '',
    },
    'nti13tuj': {
      'fr': 'Objets',
      'en': '',
    },
    'onvzvy0x': {
      'fr': 'Services',
      'en': '',
    },
    'ha0ole06': {
      'fr': 'Ajouter',
      'en': '',
    },
  },
  // declare
  {
    'uzyjon9c': {
      'fr': 'car',
      'en': '',
    },
    'r8spbk3v': {
      'fr': 'metro',
      'en': '',
    },
    'ezm982kx': {
      'fr': 'Sélectionnez une action',
      'en': '',
    },
    'pq1en8os': {
      'fr': 'Search for an item...',
      'en': '',
    },
    '6byteb6m': {
      'fr': 'Distance parcourue',
      'en': '',
    },
    '75gi91h0': {
      'fr': 'Ajouter ',
      'en': '',
    },
    'i0kcs37q': {
      'fr': 'km',
      'en': '',
    },
    'j0d3nrxy': {
      'fr': 'Options',
      'en': '',
    },
    're2wij26': {
      'fr': 'Type d\'énergie',
      'en': '',
    },
    'o0pz607f': {
      'fr': 'Voiture',
      'en': '',
    },
    '7z4pvhaq': {
      'fr': 'Vélo',
      'en': '',
    },
    'lcseappi': {
      'fr': 'Train',
      'en': '',
    },
    'gq7an2f4': {
      'fr': 'Moto',
      'en': '',
    },
    'ocimsd2k': {
      'fr': 'Scooter',
      'en': '',
    },
    'tyfy9id3': {
      'fr': 'Trotinette',
      'en': '',
    },
    'rbhwvuat': {
      'fr': 'Bus',
      'en': '',
    },
    'vxl8xm5s': {
      'fr': 'Avion',
      'en': '',
    },
    'v30pwb30': {
      'fr': 'Bateau',
      'en': '',
    },
    'e3furvu9': {
      'fr': 'Car',
      'en': '',
    },
    'y8ft7lwo': {
      'fr': 'Métro',
      'en': '',
    },
    't5v24chj': {
      'fr': 'Sélectionnez',
      'en': '',
    },
    '3c8he2hl': {
      'fr': 'Search for an item...',
      'en': '',
    },
    'ncgoamt7': {
      'fr': 'Passagers',
      'en': '',
    },
    'm9ist8ld': {
      'fr': 'Aller-retour',
      'en': '',
    },
    'ser08hli': {
      'fr': 'Répétition',
      'en': '',
    },
    'lc5autez': {
      'fr': 'L',
      'en': '',
    },
    'iawtdj0h': {
      'fr': 'Ma',
      'en': '',
    },
    'uu95kg1b': {
      'fr': 'Me',
      'en': '',
    },
    'b0yrz9tx': {
      'fr': 'J',
      'en': '',
    },
    'ycjgbt2f': {
      'fr': 'V',
      'en': '',
    },
    'af7hyn0k': {
      'fr': 'S',
      'en': '',
    },
    'arrxv5hc': {
      'fr': 'D',
      'en': '',
    },
    '7q5vatf8': {
      'fr': 'Type',
      'en': '',
    },
    'oe08ckiv': {
      'fr': 'Voiture',
      'en': '',
    },
    's3q67vts': {
      'fr': 'Vélo',
      'en': '',
    },
    '1x9bh91u': {
      'fr': 'Train',
      'en': '',
    },
    'ohugnhqy': {
      'fr': 'Moto',
      'en': '',
    },
    '4ri5tz9d': {
      'fr': 'Scooter',
      'en': '',
    },
    'ghqqxnkk': {
      'fr': 'Trotinette',
      'en': '',
    },
    'a4xefuvk': {
      'fr': 'Bus',
      'en': '',
    },
    'tbgthayz': {
      'fr': 'Avion',
      'en': '',
    },
    'jgql5z0r': {
      'fr': 'Bateau',
      'en': '',
    },
    'elcu3eof': {
      'fr': 'Car',
      'en': '',
    },
    'hm6m0whz': {
      'fr': 'Métro',
      'en': '',
    },
    '4qnitu8l': {
      'fr': 'Sélectionnez',
      'en': '',
    },
    'uglcs1nu': {
      'fr': 'Search for an item...',
      'en': '',
    },
    'xk78vqlb': {
      'fr': 'Quantité',
      'en': '',
    },
    'vxejlurr': {
      'fr': 'Année d\'achat',
      'en': '',
    },
    'qbxmonfj': {
      'fr': '2023',
      'en': '',
    },
    '6p8djvpd': {
      'fr': '2024',
      'en': '',
    },
    'gdz3mw7n': {
      'fr': '2023',
      'en': '',
    },
    'pgziao4p': {
      'fr': '2022',
      'en': '',
    },
    '38mgbquq': {
      'fr': '2021',
      'en': '',
    },
    'n3fjb0os': {
      'fr': '2020',
      'en': '',
    },
    'wxrwx697': {
      'fr': '2019',
      'en': '',
    },
    'ikdx9qon': {
      'fr': '2018',
      'en': '',
    },
    'dt4egfak': {
      'fr': '2017',
      'en': '',
    },
    'nwkr2n5d': {
      'fr': '2016',
      'en': '',
    },
    'vse2o31x': {
      'fr': '2015',
      'en': '',
    },
    '52ukpbon': {
      'fr': '2014',
      'en': '',
    },
    '66txgs91': {
      'fr': '2013',
      'en': '',
    },
    '2dhp7sk3': {
      'fr': 'Please select...',
      'en': '',
    },
    'i996jvfi': {
      'fr': 'Search for an item...',
      'en': '',
    },
    '1hwkra8l': {
      'fr': 'Achat neuf',
      'en': '',
    },
    'ohw0nf13': {
      'fr': 'Année de fabrication',
      'en': '',
    },
    '15rf1l8y': {
      'fr': '2023',
      'en': '',
    },
    '9ft96uwq': {
      'fr': '2024',
      'en': '',
    },
    'titumonx': {
      'fr': '2023',
      'en': '',
    },
    'gpl9vlel': {
      'fr': '2022',
      'en': '',
    },
    'vh8joni1': {
      'fr': '2021',
      'en': '',
    },
    '9yso4xf5': {
      'fr': '2020',
      'en': '',
    },
    'lt6gitjl': {
      'fr': '2019',
      'en': '',
    },
    'yo7mwwsu': {
      'fr': '2018',
      'en': '',
    },
    'btxn1zgw': {
      'fr': '2017',
      'en': '',
    },
    'gwswjlm4': {
      'fr': '2016',
      'en': '',
    },
    'n99qq044': {
      'fr': '2015',
      'en': '',
    },
    '27t7q7jp': {
      'fr': '2014',
      'en': '',
    },
    'w34zxxuc': {
      'fr': '2013',
      'en': '',
    },
    '2yfefqpp': {
      'fr': 'Please select...',
      'en': '',
    },
    'hi1rd5iw': {
      'fr': 'Search for an item...',
      'en': '',
    },
    'qmifyg1m': {
      'fr': 'Ce type d\'object émet un total de ',
      'en': '',
    },
    'iaidmvz3': {
      'fr': ' de co2e, amorti sur une durée de ',
      'en': '',
    },
    'ehajmgsv': {
      'fr': '5 ans.',
      'en': '',
    },
    '9lme7jzz': {
      'fr': '\n\nVous allez ajouter une émission hebodmadaire de ',
      'en': '',
    },
    'pe0o4akd': {
      'fr': ' de co2e par jour pendant ',
      'en': '',
    },
    '9quk3a68': {
      'fr': ' ans.',
      'en': '',
    },
    '6nj5vt8u': {
      'fr': 'Déclarer',
      'en': '',
    },
  },
  // target
  {
    'qahhilg1': {
      'fr': 'En Tonnes par an',
      'en': '',
    },
    'hvomtwpc': {
      'fr': '0',
      'en': '',
    },
    'y2qbs45m': {
      'fr': '10',
      'en': '',
    },
    'mh98qxc1': {
      'fr': 'Objectif 0 Tonnes',
      'en': '',
    },
    'mqhpyuia': {
      'fr': '0 Kg de CO2e par jour',
      'en': '',
    },
    'l9nyr46d': {
      'fr': 'Félicitations ! Vous voulez passer en dessous des 2 Tonnes ?',
      'en': '',
    },
    'g0l2v1ov': {
      'fr': ' C\'est beau.',
      'en': '',
    },
    'mtfc9p6d': {
      'fr': 'Objectif 2 Tonnes',
      'en': '',
    },
    '9sjoo82w': {
      'fr': '5,5 Kg de CO2e par jour',
      'en': '',
    },
    'y8du7bmu': {
      'fr':
          'Afin de limiter les effets du changement climatique, l’Accord de Paris (2015) a fixé un objectif : limiter la hausse de la température ',
      'en': '',
    },
    'orfqo4ci': {
      'fr': 'en-dessous de 2 degrés d’ici la fin du siècle.\n\n',
      'en': '',
    },
    'k4teag56': {
      'fr':
          'Pour y arriver, nous devons réduire nos émissions de gaz à effet de serre, et notamment passer à ',
      'en': '',
    },
    'hssfv10p': {
      'fr': '2 tonnes équivalent CO2 par an et par habitant d’ici 2050.',
      'en': '',
    },
    '69awk3xn': {
      'fr': 'Objectif 4 Tonnes',
      'en': '',
    },
    'tmslm9wk': {
      'fr': '11 Kg de CO2e par jour',
      'en': '',
    },
    'cllnbmxy': {
      'fr':
          'Un objectif de 4 Tonnes de  CO2e/an, c\'est l’équivalent d’un citoyen d’Arménie, de République Dominicaine, de Guinée, du Liberia, du Pérou ou encore de la Tanzanie.',
      'en': '',
    },
    '9pa56q8p': {
      'fr': '\nC\'est déjà pas mal ! \n',
      'en': '',
    },
    'xkmhp3u3': {
      'fr':
          '\nEncore 600 kg CO2e, et vous êtes à la moyenne Africaine. Bel effort, cependant, ',
      'en': '',
    },
    '7pjbsdxp': {
      'fr': 'le monde va se réchauffer entre 2 et 2,8°C.',
      'en': '',
    },
    '9vcffv6m': {
      'fr': 'Objectif 6 Tonnes',
      'en': '',
    },
    'lzgjd6ml': {
      'fr': '16.5 Kg de CO2e par jour',
      'en': '',
    },
    'r3d63624': {
      'fr':
          'A 6 Tonnes de CO2e/an, vous émettez autant qu’un citoyen d’Angola, des Îles Vierges Brittaniques,  de la République Démocratique du Congo, du Liban, du Nicaragua,  du Panama, ou encore du Vietnam.\n\nC\'est un objectif juste en dessous de la moyenne mondiale de 7 Tonnes de CO2e/an et vous êtes aux environs de la moyenne asiatique. \n',
      'en': '',
    },
    'dzd61ikf': {
      'fr': 'Vous êtes sur la bonne voie !\n',
      'en': '',
    },
    '8ua9tbuj': {
      'fr':
          '\nMais cela ne suffit toujours pas : avec une telle empreinte carbone et si tout le monde faisait comme vous, vous contribueriez à ',
      'en': '',
    },
    '08anyco7': {
      'fr': 'un monde qui se réchaufferait entre 2,8°C et 3,2°C.',
      'en': '',
    },
    'mehah468': {
      'fr': 'Objectif 8 Tonnes',
      'en': '',
    },
    'fiu167qz': {
      'fr': '22 Kg de CO2e par jour',
      'en': '',
    },
    'ov8zigjr': {
      'fr':
          'A 8 Tonnes de CO2e/an, vous méttez autant qu\'un citoyen  du Botswana, d’Israel, d’Indonésie ou de Lettonie.\n\nRéduisez encore d’ 1 Tonne de CO2e/an et vous êtes à la moyenne mondiale actuelle.\n',
      'en': '',
    },
    'lmw491sy': {
      'fr': 'Mais ça ne suffira pas !\n\n',
      'en': '',
    },
    'pwrhzzrx': {
      'fr':
          'Avec une telle empreinte carbone et si tout le monde faisait comme vous, vous contribueriez à',
      'en': '',
    },
    'il5u00hj': {
      'fr': ' un monde qui se réchaufferait entre 3,2°C et 3,6°C.',
      'en': '',
    },
    'a08g9fvn': {
      'fr': 'Objectif 10 Tonnes',
      'en': '',
    },
    'rvyfexgq': {
      'fr': '27.5 Kg de CO2e par jour',
      'en': '',
    },
    'oact0k6j': {
      'fr':
          'Avec 10 Tonnes de CO2e/an, vous émettez autant qu\'un citoyen de Biélorussie, de Bolivie, du Brésil, d’Estonie, d’Iran, de Libye ou de Pologne.\n',
      'en': '',
    },
    'b0u8i0k9': {
      'fr': 'Là, c\'est franchement pas possible. Vous pouvez faire mieux.\n',
      'en': '',
    },
    'xqrs1w7h': {
      'fr': '\nSi tout le monde était comme vous, ',
      'en': '',
    },
    '81ey4dsx': {
      'fr':
          'le monde se réchaufferait selon les pires prévisions du GIEC entre 3,6°C et 4,4°C.',
      'en': '',
    },
    'fte7orbo': {
      'fr': 'Valider',
      'en': '',
    },
    'ducbovo8': {
      'fr': 'Profil',
      'en': '',
    },
  },
  // association
  {
    'n1vk39dj': {
      'fr': 'Rejoignez l’équipe !',
      'en': '',
    },
    '9f2e8ads': {
      'fr':
          'Designers, développeurs, experts carbone, ou tout simplement plein de bonne volonté,',
      'en': '',
    },
    '9g3fhkfx': {
      'fr': ' rejoignez l’équipe !',
      'en': '',
    },
    '0p7h3eg4': {
      'fr': 'Rejoindre l\'équipe',
      'en': '',
    },
    'v8ydxc87': {
      'fr': 'Faites un don !',
      'en': '',
    },
    'a1h9p607': {
      'fr': 'L’association ',
      'en': '',
    },
    'a8mbcj1s': {
      'fr': 'a besoin de vos dons ',
      'en': '',
    },
    'cgpzi7rm': {
      'fr':
          ' pour couvrir ses dépenses de fonctionnement. L’association étant d’intérêt général, vos dons donnent droit à',
      'en': '',
    },
    '6kkcqfq3': {
      'fr': ' réduction fiscale.',
      'en': '',
    },
    'ovu0gv6e': {
      'fr': 'Faire un don',
      'en': '',
    },
    'sbnkrp35': {
      'fr': 'Qui sommes-nous ?',
      'en': '',
    },
    'mayc3zfq': {
      'fr':
          'CarbonFight est une association loi 1901, reconnue d’intérêt général. \n',
      'en': '',
    },
    'jallox8m': {
      'fr':
          'L’application est développée par des bénévoles et intervenants en mécénat de compétence.',
      'en': '',
    },
    'wdeznv3t': {
      'fr': 'Adhérer',
      'en': '',
    },
    'k6c74ixe': {
      'fr': 'Profil',
      'en': '',
    },
  },
  // signup
  {
    'w69qzzr0': {
      'fr': 'Nom',
      'en': '',
    },
    '2tnijjhj': {
      'fr': 'Saisissez votre nom',
      'en': '',
    },
    'i13bdk0x': {
      'fr': 'Prénom',
      'en': '',
    },
    'lirexkpa': {
      'fr': 'Saisissez votre prénom',
      'en': '',
    },
    'a7fi3kai': {
      'fr': 'Email',
      'en': '',
    },
    'ez2uhgoo': {
      'fr': 'Saisissez votre email',
      'en': '',
    },
    'v285r1zu': {
      'fr': 'Mot de passe',
      'en': '',
    },
    'i15ww280': {
      'fr': 'Entrez votre mot de passe',
      'en': '',
    },
    '9vrucev4': {
      'fr': 'J\'accepte les ',
      'en': '',
    },
    '1uavm6jw': {
      'fr': 'CGU',
      'en': '',
    },
    'pgv9lfau': {
      'fr': ' et la ',
      'en': '',
    },
    'v9k4pwp9': {
      'fr': 'politique de \nconfidentialité',
      'en': '',
    },
    '6xfxz6vk': {
      'fr': ' ainsi que ',
      'en': '',
    },
    '44jggosg': {
      'fr': 'les cookies',
      'en': '',
    },
    '3zjg6mdw': {
      'fr': ' à des fins statistiques.',
      'en': '',
    },
    '2fk0kgou': {
      'fr': 'Créer mon compte',
      'en': '',
    },
    'e25a72ba': {
      'fr': 'Home',
      'en': '',
    },
  },
  // account
  {
    'tb6v7mfz': {
      'fr': 'Pseudo',
      'en': '',
    },
    'vza6ubrf': {
      'fr': 'Saisissez votre pseudo',
      'en': '',
    },
    'rsyz8oqf': {
      'fr': 'Nom',
      'en': '',
    },
    'ccdjgmav': {
      'fr': 'Saisissez votre nom',
      'en': '',
    },
    'q6q692kf': {
      'fr': 'Prénom',
      'en': '',
    },
    'nqplpl3r': {
      'fr': 'Saisissez votre prénom',
      'en': '',
    },
    'tt14atwt': {
      'fr': 'Email',
      'en': '',
    },
    'gacncs4r': {
      'fr': 'Saisissez votre email',
      'en': '',
    },
    '92seybgy': {
      'fr': 'Code parrain',
      'en': '',
    },
    'q154mc15': {
      'fr': 'Saisissez le code de votre parrain',
      'en': '',
    },
    'm04o2cmx': {
      'fr': 'Parrainez vos amis avec le code ',
      'en': '',
    },
    'b1bvr30t': {
      'fr': 'Enregistrer',
      'en': '',
    },
    'ij994pmp': {
      'fr': 'Home',
      'en': '',
    },
  },
  // journal
  {
    'n27kq7m2': {
      'fr': 'Déclarer',
      'en': '',
    },
  },
  // success
  {
    '6pql7wtd': {
      'fr': 'Score \n',
      'en': '',
    },
    'kgei9jen': {
      'fr': ' / ',
      'en': '',
    },
    '54jjnnlo': {
      'fr': 'Validé',
      'en': '',
    },
    'ks8w1o9m': {
      'fr': 'Pas encore',
      'en': '',
    },
    's4ikgs7s': {
      'fr': 'Non applicable',
      'en': '',
    },
    '3qcb0plf': {
      'fr': 'Logement ',
      'en': '',
    },
    'l6gs89ed': {
      'fr': ' / ',
      'en': '',
    },
    'kqus3mem': {
      'fr': 'Led the sunshine\n',
      'en': '',
    },
    'y7fkbvpp': {
      'fr': 'J’utilise uniquement des lampes LED dans mon logement.',
      'en': '',
    },
    'idif43kc': {
      'fr': 'Non merci !\n',
      'en': '',
    },
    'o4uj1wmj': {
      'fr':
          'J’ai indiqué sur ma boîte au lettre refuser la publicité par courrier.',
      'en': '',
    },
    '8tyijt6a': {
      'fr': 'Je choisis la solution offensive\n',
      'en': '',
    },
    '31x51lvh': {
      'fr':
          'J’ai choisi ca y est. J’activé l’option verte sur mes contrats d’énergie.',
      'en': '',
    },
    'v0p6pl0i': {
      'fr': 'Bain voyons\n',
      'en': '',
    },
    'ipf6tpnd': {
      'fr': 'Je ne prends plus de bain, du tout. Uniquement des douches.',
      'en': '',
    },
    'b90i6mp1': {
      'fr': 'L’été sera chaud\n',
      'en': '',
    },
    '6xg11k2i': {
      'fr': 'Mon logement est équipe d\'un thermostat.',
      'en': '',
    },
    'fewzltem': {
      'fr': '20h plus 7h… hhumm\n',
      'en': '',
    },
    'br3eale2': {
      'fr': 'Je démarre mes équipements pilotables en heures creuses.',
      'en': '',
    },
    'v7nug5il': {
      'fr': 'C’est pas Versailles ici !\n',
      'en': '',
    },
    '2bv6eish': {
      'fr': 'Je veille à bien éteindre toutes les lampes inutilement allumées.',
      'en': '',
    },
    'xhn5t0q9': {
      'fr': 'Habits ',
      'en': '',
    },
    '0j9k9sr6': {
      'fr': ' / ',
      'en': '',
    },
    'mtkfixhz': {
      'fr': 'Elle est belle ta déco\n',
      'en': '',
    },
    'sbw2ve56': {
      'fr':
          'Je sèche en majorité mes vêtements sur un étendoir, sans utiliser de sèche linge.',
      'en': '',
    },
    'zcjbhgzc': {
      'fr': 'C’est une tâche de propre\n',
      'en': '',
    },
    'ixevomm9': {
      'fr': 'Je lave uniquement mes vêtements à froid (30°).',
      'en': '',
    },
    't470aret': {
      'fr': '“Etat presque quasiment neuf”\n',
      'en': '',
    },
    'z3e6qkbi': {
      'fr': 'J’achète majoritairement des vêtements de seconde main.',
      'en': '',
    },
    't3yr2ili': {
      'fr': 'Neuf d\'occasion\n',
      'en': '',
    },
    'mogtoxc5': {
      'fr':
          'Je dépose mes vêtements inutilisés dans des bacs de don, ou les revends en seconde main.',
      'en': '',
    },
    'teiwpcq7': {
      'fr': 'Electroménager ',
      'en': '',
    },
    'bo36e2uo': {
      'fr': ' / ',
      'en': '',
    },
    'arlu92wq': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    'iuyrbklh': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    '3h0ygbh1': {
      'fr': 'Mobilier ',
      'en': '',
    },
    'zdqgp09w': {
      'fr': ' / ',
      'en': '',
    },
    '5re7cxe5': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    '0nskongh': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'klzvcvym': {
      'fr': 'Numérique ',
      'en': '',
    },
    '152boczw': {
      'fr': ' / ',
      'en': '',
    },
    'ty1hcxvx': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    '3ghhlf77': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    '1p6kory6': {
      'fr': 'Objets ',
      'en': '',
    },
    'cfhqpfe9': {
      'fr': ' / ',
      'en': '',
    },
    '75gdby7w': {
      'fr': 'Travaux en cours\n',
      'en': '',
    },
    'y1dbmsy8': {
      'fr': 'Les succes seront bientôt implémentés',
      'en': '',
    },
    'kggy1uov': {
      'fr': 'Succès',
      'en': '',
    },
  },
  // badges
  {
    'jqwvyl6f': {
      'fr': 'Badge actif',
      'en': '',
    },
    'rx6kcbv9': {
      'fr': 'Paré !',
      'en': '',
    },
    'a9r2qfuo': {
      'fr': 'Badges de score',
      'en': '',
    },
    'b1i2qi3w': {
      'fr': 'Niveau 2',
      'en': '',
    },
    'eb3ak82i': {
      'fr': 'Points',
      'en': '',
    },
    'a954d1c9': {
      'fr': '1225 / 2500',
      'en': '',
    },
    '8k0qnkae': {
      'fr': 'Niveau 3',
      'en': '',
    },
    '8b7p6xzw': {
      'fr': 'Badges défis',
      'en': '',
    },
    'fxz6cq76': {
      'fr': 'Prêt ?',
      'en': '',
    },
    's45nv8t0': {
      'fr': 'Paré !',
      'en': '',
    },
    '3sucebib': {
      'fr': 'Défis',
      'en': '',
    },
  },
  // emptyList
  {
    'tbss86b8': {
      'fr': 'C\'est tout vide !',
      'en': '',
    },
    'pms16trg': {
      'fr': 'Ajoutez votre première action de la journée !',
      'en': '',
    },
  },
  // head
  {
    'en1kkzn7': {
      'fr': 'Recrue',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '8t1o20bj': {
      'fr': 'Email',
      'en': '',
    },
    'y4w1d1td': {
      'fr': 'Saisissez votre email',
      'en': '',
    },
    '03imexxk': {
      'fr': 'Button',
      'en': '',
    },
    'c6t1i2ti': {
      'fr': 'Page title',
      'en': '',
    },
    'b15o9o2h': {
      'fr': '',
      'en': '',
    },
    'adwgz3xd': {
      'fr': '',
      'en': '',
    },
    'w5oxekh3': {
      'fr': '',
      'en': '',
    },
    'thinjqmm': {
      'fr': '',
      'en': '',
    },
    'nlrfjk51': {
      'fr': '',
      'en': '',
    },
    'nveleltv': {
      'fr': '',
      'en': '',
    },
    'asqnuh2m': {
      'fr': '',
      'en': '',
    },
    '8h1wza1h': {
      'fr': '',
      'en': '',
    },
    'r83xj76x': {
      'fr': '',
      'en': '',
    },
    '6bseqrny': {
      'fr': '',
      'en': '',
    },
    'rg31ok73': {
      'fr': '',
      'en': '',
    },
    'ffxe7tq1': {
      'fr': '',
      'en': '',
    },
    'l66cp9y9': {
      'fr': '',
      'en': '',
    },
    '0ueqp521': {
      'fr': '',
      'en': '',
    },
    '4x2i1uis': {
      'fr': '',
      'en': '',
    },
    '3tku2jdm': {
      'fr': '',
      'en': '',
    },
    'y8y8dv0a': {
      'fr': '',
      'en': '',
    },
    'tmkhwpql': {
      'fr': '',
      'en': '',
    },
    'ky0eerit': {
      'fr': '',
      'en': '',
    },
    'i6j7nv0g': {
      'fr': '',
      'en': '',
    },
    'qdoe0w3m': {
      'fr': '',
      'en': '',
    },
    'avsxe01g': {
      'fr': '',
      'en': '',
    },
    'kd3tkikf': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
