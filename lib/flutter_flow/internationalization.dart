import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['fr', 'en'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String frText = '',
    String enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '2aaa29zc': {
      'fr': 'Actions',
      'en': '',
    },
    'nzr1pbod': {
      'fr': 'Statistiques',
      'en': '',
    },
    'ftqit7d1': {
      'fr': 'Vos émissions : ',
      'en': '',
    },
    'mf5eson5': {
      'fr': 'Aujourd\'hui',
      'en': '',
    },
    'johcl6y7': {
      'fr': '71%',
      'en': '',
    },
    'z22thcqv': {
      'fr': 'You\'re on track to decrease emissions by',
      'en': '',
    },
    'ky83wqrw': {
      'fr': 'This Month',
      'en': '',
    },
    'bcs04iw2': {
      'fr': '71%',
      'en': '',
    },
    'wet0nwuu': {
      'fr': 'You\'re on track to decrease emissions by',
      'en': '',
    },
    'tvje0xfv': {
      'fr': 'This Month',
      'en': '',
    },
    'thud6glx': {
      'fr': 'Transport',
      'en': '',
    },
    'okljfrzf': {
      'fr': 'Repas',
      'en': '',
    },
    'sut70hhp': {
      'fr': 'Energies',
      'en': '',
    },
    'ggeke3m4': {
      'fr': 'Les actions du jour',
      'en': '',
    },
    '4cxhbife': {
      'fr': 'Profile',
      'en': '',
    },
  },
  // Signup
  {
    'lq908mnj': {
      'fr': 'Name',
      'en': '',
    },
    '55gwrowl': {
      'fr': 'Email Address',
      'en': '',
    },
    'v4bol2c6': {
      'fr': 'Password',
      'en': '',
    },
    'say6ghq2': {
      'fr': 'Retype Password',
      'en': '',
    },
    '7q55jp5z': {
      'fr': 'Or Use Social Signup',
      'en': '',
    },
    '96yy2ulj': {
      'fr': 'Have an account?',
      'en': '',
    },
    'nqaxryoo': {
      'fr': 'Login',
      'en': '',
    },
    '25g7nfbp': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'agtsd4a4': {
      'fr': 'Email Address',
      'en': '',
    },
    'l6e78onj': {
      'fr': 'Password',
      'en': '',
    },
    'bvbpxghp': {
      'fr': 'Forgot Password ?',
      'en': '',
    },
    'jq7dkcmx': {
      'fr': 'Or Use Social Login',
      'en': '',
    },
    '6iqjwn33': {
      'fr': 'Don\'t have an account ?',
      'en': '',
    },
    'yf3iogt3': {
      'fr': 'Register',
      'en': '',
    },
    'b0pwcar5': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Splash
  {
    'b697wemi': {
      'fr': 'BIENVENUE',
      'en': '',
    },
    '9u2zip1i': {
      'fr':
          'Merci d\'avoir téléchargé la toute première version de CarbonFight. ',
      'en': '',
    },
    'd1vo1jb4': {
      'fr': 'MESUREZ ',
      'en': '',
    },
    'mw7m3td6': {
      'fr':
          'Ajoutez vos activités émetrices de CO2, et mesurez votre impact réel sur la planète.',
      'en': '',
    },
    'gzncsdp7': {
      'fr': 'AGISSEZ',
      'en': '',
    },
    'ugmd7bxh': {
      'fr':
          'Identifiez et réduisez vos actions émetrices de CO2, afin d\'améliorer votre score.',
      'en': '',
    },
    'g0wunkr0': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Drawer
  {
    'sbre4wqv': {
      'fr': 'Change Password',
      'en': '',
    },
    'wtd2lzjb': {
      'fr': 'Contacter l\'équipe',
      'en': '',
    },
    'zbqet7oz': {
      'fr': 'Help',
      'en': '',
    },
    'pg93sftm': {
      'fr': 'FAQ',
      'en': '',
    },
    '1n0m17tp': {
      'fr': 'Terms',
      'en': '',
    },
    'y7jl9opj': {
      'fr': 'Carbonfight Copyright 2022',
      'en': '',
    },
    'ckga369c': {
      'fr': 'Version 1.0.2 Build 34',
      'en': '',
    },
    'hhxdgq7j': {
      'fr': 'Home',
      'en': '',
    },
  },
  // HomeV0
  {
    'vbhaq7zo': {
      'fr': 'Actions',
      'en': '',
    },
    'hsuy6qhf': {
      'fr': 'Statistiques',
      'en': '',
    },
    'm5qlt1e1': {
      'fr': 'CO2e',
      'en': '',
    },
    '76erv5vm': {
      'fr': '38%',
      'en': '',
    },
    '3nj2syzc': {
      'fr': 'Transport',
      'en': '',
    },
    'r3p9fm3m': {
      'fr': 'Repas',
      'en': '',
    },
    '6iuvp3of': {
      'fr': 'Energies',
      'en': '',
    },
    'r2hbn5dq': {
      'fr': 'Profile',
      'en': '',
    },
  },
  // Statistiques
  {
    'vxrri8bs': {
      'fr': '1',
      'en': '',
    },
    'hmit84j7': {
      'fr': 'Niveau: ',
      'en': '',
    },
    '7cta44gw': {
      'fr': 'Mythique',
      'en': '',
    },
    '6o4g9xfj': {
      'fr': 'Classment: ',
      'en': '',
    },
    'me8tqv2t': {
      'fr': '#1 / 1',
      'en': '',
    },
    'pfo25ymo': {
      'fr': 'Vos émissions du jour : ',
      'en': '',
    },
    '67ks844v': {
      'fr': 'Vos émissions des 30 derniers jours : ',
      'en': '',
    },
    '59rd8f26': {
      'fr': 'Vos émissions des 7 derniers jours : ',
      'en': '',
    },
    'sxffyts8': {
      'fr': '2.67 KG',
      'en': '',
    },
    '01w6g2hc': {
      'fr': '72%',
      'en': '',
    },
    '43l3zjzm': {
      'fr': '975 KG',
      'en': '',
    },
    'skpu0g15': {
      'fr': '26%',
      'en': '',
    },
    '1byib7gg': {
      'fr': '37 KG',
      'en': '',
    },
    '381pwcrr': {
      'fr': '1%',
      'en': '',
    },
    'd59etq79': {
      'fr': 'Actions',
      'en': '',
    },
    'i79uxkzr': {
      'fr': 'Statistiques',
      'en': '',
    },
    '07kunma0': {
      'fr': 'Profile',
      'en': '',
    },
  },
  // FAQ
  {
    'i061w019': {
      'fr': 'Faut-il compter les enfants dans le foyer ?',
      'en': '',
    },
    '2g711uvo': {
      'fr':
          'Oui. Vous pouvez compter vos enfants dans le nombre de personnes du foyer pour certaines actions comme l\'énergie. \nIl est toutefois inutile d\'ajouter leurs émissions en CO2. CarbonFight calcule vos émissions de CO2 personnelles, et non ceux du foyer.\n',
      'en': '',
    },
    '8cwvw6sn': {
      'fr': 'Comment supprimer mes données ?',
      'en': '',
    },
    '3im0yba2': {
      'fr':
          'Pour supprimer toutes vos données, écrivez simplement un e-mail à l\'adresse : dpo@carbonfight.app, avec comme sujet \"Supprimer mes données\".',
      'en': '',
    },
    '3nyn3yqa': {
      'fr': 'Comment contribuer ?',
      'en': '',
    },
    'lv282p00': {
      'fr':
          'Si vous cherchez une information, vous pouvez rejoindre notre discord : https://discord.gg/e7weuGA4UW',
      'en': '',
    },
    'tks8gviw': {
      'fr': 'FAQ',
      'en': '',
    },
    'rmmkjp89': {
      'fr': 'Help',
      'en': '',
    },
  },
  // Feedback
  {
    'nwbq4phz': {
      'fr': 'Vos commentaires comptent.',
      'en': '',
    },
    'kau282i5': {
      'fr': 'Une remarque, un bug, une fonctionnalité manquante ?',
      'en': '',
    },
    'ryktisa6': {
      'fr': 'Message',
      'en': '',
    },
    'b8mqa92w': {
      'fr': 'Contactez-nous',
      'en': '',
    },
    'lkaqno5v': {
      'fr': 'Help',
      'en': '',
    },
  },
  // HomeCopy
  {
    'kwegriu7': {
      'fr': 'Actions',
      'en': '',
    },
    'p9kojgwy': {
      'fr': 'Statistiques',
      'en': '',
    },
    'rpvkl5uk': {
      'fr': 'Vos émissions : ',
      'en': '',
    },
    'qx9ce8ed': {
      'fr': 'Aujourd\'hui',
      'en': '',
    },
    '8moxnzth': {
      'fr': '71%',
      'en': '',
    },
    '4omhto4v': {
      'fr': 'You\'re on track to decrease emissions by',
      'en': '',
    },
    'vuzgrcno': {
      'fr': 'This Month',
      'en': '',
    },
    'dbr151uk': {
      'fr': '71%',
      'en': '',
    },
    'vfozqtpg': {
      'fr': 'You\'re on track to decrease emissions by',
      'en': '',
    },
    'hzpnjyvy': {
      'fr': 'This Month',
      'en': '',
    },
    'jf8th9g3': {
      'fr': 'CO2e',
      'en': '',
    },
    '77s7833s': {
      'fr': 'Les actions du jour : ',
      'en': '',
    },
    '86icisbq': {
      'fr': '38%',
      'en': '',
    },
    'vgkc5gef': {
      'fr': 'Transport',
      'en': '',
    },
    'epq13808': {
      'fr': 'Repas',
      'en': '',
    },
    '549f54dy': {
      'fr': 'Energies',
      'en': '',
    },
    'cg7vyoaj': {
      'fr': 'Profile',
      'en': '',
    },
  },
  // addAction
  {
    'vys8qoyc': {
      'fr': 'Trajet en voiture',
      'en': '',
    },
    'rmo7s4wk': {
      'fr': 'Autobus',
      'en': '',
    },
    'c07qzd7p': {
      'fr': 'Scooter et moto légère',
      'en': '',
    },
    'ipinnfus': {
      'fr': 'Trajet en TGV',
      'en': '',
    },
    's66exbnx': {
      'fr': 'Train régional',
      'en': '',
    },
    'bnonnah0': {
      'fr': 'Trajet en Métro',
      'en': '',
    },
  },
  // addActionForm
  {
    '6lo8d8h3': {
      'fr': 'Distance Parcourue (en km )',
      'en': '',
    },
    '40yz93vs': {
      'fr': 'Distance Parcourue (en km )',
      'en': '',
    },
    'adxea3ud': {
      'fr': 'More Options',
      'en': '',
    },
    'cdpfiikf': {
      'fr': '1',
      'en': '',
    },
    'a2l56pwj': {
      'fr': '2',
      'en': '',
    },
    '6cb7z5jk': {
      'fr': '3',
      'en': '',
    },
    'kujyfgw9': {
      'fr': '4',
      'en': '',
    },
    'cn09p173': {
      'fr': '5',
      'en': '',
    },
    '50kkt56t': {
      'fr': '6',
      'en': '',
    },
    '8n0r08az': {
      'fr': '7',
      'en': '',
    },
    'ai0f1rbu': {
      'fr': '8',
      'en': '',
    },
    'y8br6d90': {
      'fr': '9',
      'en': '',
    },
    'v4wtf97t': {
      'fr': 'Nombre de passagers',
      'en': '',
    },
    'nig8hali': {
      'fr': 'Owner',
      'en': '',
    },
    'cyve5fzh': {
      'fr': 'Short rent',
      'en': '',
    },
    '8ufgtacr': {
      'fr': 'Long rent',
      'en': '',
    },
    'eisc92u4': {
      'fr': 'Taxi',
      'en': '',
    },
    '0p2pexrg': {
      'fr': 'Type d\'utilisation',
      'en': '',
    },
    'z0v14eq6': {
      'fr': 'Option 1',
      'en': '',
    },
    'im24654c': {
      'fr': 'Option 2',
      'en': '',
    },
    'i1fd3kvi': {
      'fr': 'Energie',
      'en': '',
    },
  },
  // forgotPassword
  {
    'hp42a316': {
      'fr': 'Forgot Password',
      'en': '',
    },
    'g101i68r': {
      'fr':
          'Enter your email address and we will send a reset password link for you, you can follow the link and set your new password.',
      'en': '',
    },
    'nloe7roo': {
      'fr': 'Your Email',
      'en': '',
    },
    'zwxa1so0': {
      'fr': 'Your Email',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'or83tuht': {
      'fr': '',
      'en': '',
    },
    'wjt7z1rq': {
      'fr': '',
      'en': '',
    },
    'ou64pb9b': {
      'fr': '',
      'en': '',
    },
    'ib2z2gt8': {
      'fr': '',
      'en': '',
    },
    'ab5ywlxr': {
      'fr': '',
      'en': '',
    },
    'gmralf3y': {
      'fr': '',
      'en': '',
    },
    'r5zucxvj': {
      'fr': '',
      'en': '',
    },
    '0mvcx8uq': {
      'fr': '',
      'en': '',
    },
    'a3qd3bk8': {
      'fr': '',
      'en': '',
    },
    'joawp683': {
      'fr': '',
      'en': '',
    },
    'oxfacg86': {
      'fr': '',
      'en': '',
    },
    '8gj72j6q': {
      'fr': '',
      'en': '',
    },
    'jqkkl6ar': {
      'fr': '',
      'en': '',
    },
    'mkbhzg7n': {
      'fr': '',
      'en': '',
    },
    'xtu2e35m': {
      'fr': '',
      'en': '',
    },
    'ztqwfh1k': {
      'fr': '',
      'en': '',
    },
    'ofr79dsk': {
      'fr': '',
      'en': '',
    },
    'iev1s3mn': {
      'fr': '',
      'en': '',
    },
    'wqfdcway': {
      'fr': '',
      'en': '',
    },
    'yswj6k5d': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
