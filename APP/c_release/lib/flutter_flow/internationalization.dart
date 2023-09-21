import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'eu', 'en'];

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
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? euText = '',
    String? enText = '',
  }) =>
      [esText, euText, enText][languageIndex] ?? '';
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
  // Inicio
  {
    'gr0b9br8': {
      'es': 'Bilbability',
      'en': 'Bilbability',
      'eu': 'Bilbability',
    },
    'xmb2qd15': {
      'es': 'Bilbao sin limites',
      'en': 'Bilbao for you',
      'eu': 'Bilbo zuretzat',
    },
    'kv1woswd': {
      'es': 'Rutas Accesibles',
      'en': 'Accessible Routes',
      'eu': 'Ibilbide irisgarriak',
    },
    '4j1tkjgp': {
      'es': 'Disponibilidad de rutas optimizadas para todo el mundo',
      'en': 'Availability of optimized routes for all people',
      'eu': 'Pertsona guztientzat optimizatutako ibilbideen erabilgarritasuna',
    },
    '62b1x792': {
      'es': 'Mejorando Bilbao',
      'en': 'Improving Bilbao',
      'eu': 'Bilbo hobetzen',
    },
    'c048umyh': {
      'es': 'Cualquiera puede aportar su granito de arena',
      'en': 'Anyone can contribute their grain of sand',
      'eu': 'Edonork eman dezake bere hondar alea',
    },
    'f8nsebem': {
      'es': 'Continuar',
      'en': 'Continue',
      'eu': 'Jarraitu',
    },
  },
  // SplashScreen
  {
    'yrbixgap': {
      'es': 'Registrarse',
      'en': 'Register',
      'eu': 'Eman izena',
    },
    '1sn4y4kp': {
      'es': 'Iniciar Sesión',
      'en': 'Log in',
      'eu': 'Saioa hasi',
    },
    '3dumroqk': {
      'es': 'Home',
      'en': 'home',
      'eu': 'Home',
    },
  },
  // loging
  {
    'jieic3ay': {
      'es': 'Inicio',
      'en': 'Start',
      'eu': 'Hasi',
    },
    'stvhmy2c': {
      'es': 'Correo Electronico',
      'en': 'Email',
      'eu': 'Posta elektronikoa',
    },
    'n4o45c1i': {
      'es': 'Contraseña',
      'en': 'Password',
      'eu': 'Pasahitza',
    },
    '5s85ilnk': {
      'es': 'Iniciar Sesion',
      'en': 'Log in',
      'eu': 'Saioa hasi',
    },
    '0zt08yk8': {
      'es': '¿Olvido su contraseña?',
      'en': 'Forgot your password?',
      'eu': 'Zure pasahitza ahaztu duzu?',
    },
    'k8tri9ck': {
      'es': 'Otras maneras de iniciar sesión.',
      'en': 'Other ways to log in.',
      'eu': 'Saioa hasteko beste modu batzuk.',
    },
    '43yys0fz': {
      'es': '¿No tiene una cuenta creada?',
      'en': 'Don\'t have an account created?',
      'eu': 'Ez al duzu konturik sortu?',
    },
    'qlvmyqfo': {
      'es': 'Registrarse',
      'en': 'Register',
      'eu': 'Izena eman',
    },
  },
  // olvidocontra
  {
    'tbnucuim': {
      'es': 'Recuperar contraseña',
      'en': 'Recover password',
      'eu': 'Berreskuratu pasahitza',
    },
    'gb38x516': {
      'es': 'Te mandaremos un gmail para que recuperes tu contraseña.',
      'en': 'We will send you a gmail to recover your password.',
      'eu': 'Gmail bat bidaliko dizugu zure pasahitza berreskuratzeko.',
    },
    'slae2565': {
      'es': 'Correo',
      'en': 'Mail',
      'eu': 'Posta',
    },
    'rt9lac3t': {
      'es': 'Introduce tu correo eletronico',
      'en': 'Enter your email',
      'eu': 'Sartu zure helbide elektronikoa',
    },
    '4a4pzp1w': {
      'es': 'Enviar link',
      'en': 'Send link',
      'eu': 'Bidali esteka',
    },
    'zk5xj77r': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Home',
    },
  },
  // register1
  {
    'mw3r8p2k': {
      'es': 'Atras',
      'en': 'Back',
      'eu': 'Itzuli',
    },
    '8b88cz77': {
      'es': 'Antes de comenzar;',
      'en': 'Before starting;',
      'eu': 'Hasi baino lehen;',
    },
    'xhjk0la3': {
      'es': 'Correo',
      'en': 'Mail',
      'eu': 'Posta',
    },
    'ea840ex6': {
      'es': 'Introduce tu correo.',
      'en': 'Enter your email.',
      'eu': 'Sartu zure helbide elektronikoa.',
    },
    'qh4kpyty': {
      'es': 'Contraseña',
      'en': 'Password',
      'eu': 'Pasahitza',
    },
    '4pozoocf': {
      'es': 'Porfavor introduzca su contraseña. ',
      'en': 'Please enter your password.',
      'eu': 'Mesedez, sartu zure pasahitza.',
    },
    'sf8pwrpn': {
      'es': 'Comfirmar contraseña.',
      'en': 'Confirm password.',
      'eu': 'Pasahitza baieztatu.',
    },
    'lbosrwzv': {
      'es': 'Porfavor repita su contraseña.',
      'en': 'Please repeat your password.',
      'eu': 'Mesedez, errepikatu pasahitza.',
    },
    'jbeys71n': {
      'es': 'Crear cuenta',
      'en': 'Create Account',
      'eu': 'Kontua sortu',
    },
    '2qckltcu': {
      'es': 'Home',
      'en': 'home',
      'eu': 'etxera',
    },
  },
  // IDSSS
  {
    'l3twpl6k': {
      'es': 'Ultimos pasos;',
      'en': 'Last steps;',
      'eu': 'Azken urratsak;',
    },
    'vku5rces': {
      'es': 'Nombre de usuario',
      'en': 'Username',
      'eu': 'Erabiltzaile izena',
    },
    '1mvu0jh6': {
      'es': 'Número de telefono',
      'en': 'Phone number',
      'eu': 'Telefono zenbakia',
    },
    'q3tymwkw': {
      'es': 'Biografia',
      'en': 'Biography',
      'eu': 'Biografia',
    },
    'd1fhb8ws': {
      'es': 'Siguiente Paso',
      'en': 'Next step',
      'eu': 'Hurrengo urratsa',
    },
    '4r3nsmt5': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    'fl2turi1': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    '4n0yhgpk': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    '51yhta17': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
  },
  // homepage1
  {
    'jmv7da8e': {
      'es': 'Desarrollo en proceso',
      'en': '',
      'eu': '',
    },
  },
  // profiletheme
  {
    '6k46emiv': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
      'eu': 'Saioa itxi',
    },
    'k5qxsqvd': {
      'es': 'Bilbao, Bizkaia.',
      'en': 'Bilbao, Bizkaia.',
      'eu': 'Bilbo, Bizkaia.',
    },
    'vmshtxt1': {
      'es': '           ',
      'en': '',
      'eu': '',
    },
    'w9gmycxs': {
      'es': 'Rutas',
      'en': 'Routes',
      'eu': 'Ibilbideak',
    },
    'rk2yhfie': {
      'es': 'Dic 16, 8:00am',
      'en': 'Dec 16, 8:00am',
      'eu': 'Abenduak 16, 8:00etan',
    },
    '2xr8j18k': {
      'es': 'Uni Deusto - Plaza Ensanche',
      'en': 'Uni Deusto - Plaza Ensanche',
      'eu': 'Uni Deusto - Plaza Zabalgunea',
    },
    'b13dqd0j': {
      'es': 'Viaje realizado con EtxeTIC.',
      'en': 'Trip made with EtxeTIC.',
      'eu': 'EtxeTICekin egindako bidaia.',
    },
    '5zhp0wf5': {
      'es': 'Dic 5, 13:00pm',
      'en': 'Dec 5, 1:00 p.m.',
      'eu': 'Abenduak 5, 13:00etan.',
    },
    'x44b74lf': {
      'es': 'Isozaki - Artxanda',
      'en': 'Isozaki - Artxanda',
      'eu': 'Isozaki - Artxanda',
    },
    'vz8qjp23': {
      'es': 'Viaje realizado con EtxeTIC.',
      'en': 'Trip made with EtxeTIC.',
      'eu': 'EtxeTICekin egindako bidaia.',
    },
    'tlijcrdm': {
      'es': 'Nov 30, 16:00pm',
      'en': 'Nov 30, 4:00 p.m.',
      'eu': 'Azaroak 30, 16:00etan.',
    },
    'jfcginb7': {
      'es': 'Moyua - Ayuntamiento',
      'en': 'Moyua - Circular Plaza',
      'eu': 'Moyua - Plaza Biribila',
    },
    'ely7z457': {
      'es': 'Viaje realizado sin acompañamiento. ',
      'en': 'Trip carried out without accompaniment.',
      'eu': 'Akonpainamendurik gabe egindako bidaia.',
    },
    '65frv8l1': {
      'es': 'Nov 29, 17:00pm',
      'en': 'Nov 29, 17:00pm',
      'eu': 'Azaroak 29, 17:00etan',
    },
    'ak06tlnb': {
      'es': 'Ayuntamiento - Plaza Euskadi',
      'en': 'Town Hall - Euskadi Square',
      'eu': 'Udaletxea - Euskadi plaza',
    },
    'q789dla2': {
      'es': 'Viaje realizado con EtxeTIC.',
      'en': 'Trip made with EtxeTIC.',
      'eu': 'EtxeTICekin egindako bidaia.',
    },
    '2111ujup': {
      'es': 'Nov 29, 9:00am',
      'en': 'Nov 29, 9:00am',
      'eu': 'Azaroak 29, 9:00etan',
    },
    'wrltinq9': {
      'es': 'Arriaga - Ayuntamiento',
      'en': 'Arriaga - Town Hall',
      'eu': 'Arriaga - Udala',
    },
    'kf1x65gj': {
      'es': 'Viaje realizado sin acompañamiento.',
      'en': 'Trip carried out without accompaniment.',
      'eu': 'Akonpainamendurik gabe egindako bidaia.',
    },
    'hl82nydg': {
      'es': 'Incidencias',
      'en': 'Incidents',
      'eu': 'Gorabeherak',
    },
    'bdl83q08': {
      'es': 'Incidencia',
      'en': 'Add incident',
      'eu': 'Gehitu gorabehera',
    },
    'd8l1keze': {
      'es': 'Opinión',
      'en': '',
      'eu': '',
    },
    'rahekumh': {
      'es':
          'Pulse el boton si desea reportar una incidencia u opinar sobre la accesibilidad de un lugar.',
      'en': 'Press the button if you want to report an incident.',
      'eu': 'Sakatu botoia gorabeheraren bat salatu nahi baduzu.',
    },
    '3pwcgvlc': {
      'es': 'Otros',
      'en': 'Others',
      'eu': 'Beste batzuk',
    },
    '6lgp42jv': {
      'es': 'Home',
      'en': 'home',
      'eu': 'etxera',
    },
  },
  // editarperfil
  {
    'eik1uw6c': {
      'es': '',
      'en': '',
      'eu': 'Gorde aldaketak',
    },
    'wv3oujow': {
      'es': 'Cambiar Foto',
      'en': 'Change photo',
      'eu': 'Aldatu argazkia',
    },
    'eaezbbf2': {
      'es': 'Nombre de usuario',
      'en': 'Username',
      'eu': 'Erabiltzaile izena',
    },
    'c8wr4zre': {
      'es': 'Correo electronico',
      'en': 'Email',
      'eu': 'Posta elektronikoa',
    },
    'otbzj5v8': {
      'es': 'Biografia',
      'en': 'Biography',
      'eu': 'Biografia',
    },
  },
  // incidencia
  {
    'zf07bqr3': {
      'es': 'Reportar incidencia',
      'en': 'report incident',
      'eu': 'intzidentziaren berri',
    },
    'ds9juf2v': {
      'es': 'Titulo incidencia',
      'en': 'incident title',
      'eu': 'gertakariaren izenburua',
    },
    'zkphr8vf': {
      'es': 'Describa el problema que desea reportar.',
      'en': 'Describe the problem you want to report.',
      'eu': 'Deskribatu jakinarazi nahi duzun arazoa.',
    },
    'ptbdqyjg': {
      'es': 'Ubicacion',
      'en': 'Location',
      'eu': 'Kokapena',
    },
    '1rk66hf8': {
      'es': 'Reportar',
      'en': 'report',
      'eu': 'txostena',
    },
    'yqvm7id6': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    '7g5roudk': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    'n6teyr8i': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    'xwjhb5k1': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
  },
  // Reviews
  {
    'x5mu5673': {
      'es': 'Describir lugar',
      'en': 'report incident',
      'eu': 'intzidentziaren berri',
    },
    'ag62q0ys': {
      'es': 'Titulo ',
      'en': 'incident title',
      'eu': 'gertakariaren izenburua',
    },
    'bhe3k9cw': {
      'es': 'Describa el lugar del que desee hablar.',
      'en': 'Describe the problem you want to report.',
      'eu': 'Deskribatu jakinarazi nahi duzun arazoa.',
    },
    'e1l9qoyu': {
      'es': 'Ubicacion',
      'en': 'Location',
      'eu': 'Kokapena',
    },
    '2qxjzdsb': {
      'es': 'Reportar',
      'en': 'report',
      'eu': 'txostena',
    },
    'klpod50s': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    'uhor7qqo': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    'dkdyx2fq': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
    '81jr5las': {
      'es': 'Field is required',
      'en': 'Field is required',
      'eu': 'Eremua beharrezkoa da',
    },
  },
  // felicidades
  {
    'bzfdqrel': {
      'es': '¡Gracias!',
      'en': 'Thank you!',
      'eu': 'Eskerrik asko!',
    },
    '7jy5o1ac': {
      'es': 'Hemos recibido tu incidencia correctamente.',
      'en': 'We have received your incident correctly.',
      'eu': 'Zure gertakaria behar bezala jaso dugu.',
    },
    'z1wqdks3': {
      'es': 'Volver al inicio',
      'en': 'Back to top',
      'eu': 'Itzuli ',
    },
    '7auybt38': {
      'es': 'Home',
      'en': 'home',
      'eu': 'etxera',
    },
  },
  // felicidadesCopy
  {
    '3adlcmzm': {
      'es': '¡Gracias!',
      'en': 'Thank you!',
      'eu': 'Eskerrik asko!',
    },
    'to9ocp94': {
      'es': 'Hemos recibido tu opinión.',
      'en': 'We have received your incident correctly.',
      'eu': 'Zure gertakaria behar bezala jaso dugu.',
    },
    'y6e8dvhy': {
      'es': 'Volver al inicio',
      'en': 'Back to top',
      'eu': 'Itzuli ',
    },
    'pjjm0en7': {
      'es': 'Home',
      'en': 'home',
      'eu': 'etxera',
    },
  },
  // resumenincidencias
  {
    'uvojnyhi': {
      'es': 'Mis Incidencias',
      'en': 'My Incidents',
      'eu': 'Nire Gorabeherak',
    },
    'kpyfkogc': {
      'es': 'Aqui puedes ver tus incidencias',
      'en': 'Here you can see your incidents',
      'eu': 'Hemen zure gorabeherak ikus ditzakezu',
    },
    'nk5ka6g6': {
      'es': '1',
      'en': '1',
      'eu': '1',
    },
    'sxfeph40': {
      'es': 'Cruce poco accesible',
      'en': 'IInaccessible crossing',
      'eu': 'Iristezina den zeharkaldia',
    },
    'nnmchszn': {
      'es': 'En la plaza de Pio Baroja estan haciendo obras y...',
      'en': 'In the Plaza de Pio Baroja they are doing works and...',
      'eu': 'Pio Baroja plazan obrak egiten ari dira eta...',
    },
    'yg8osfh2': {
      'es': '2',
      'en': 'two',
      'eu': 'bi',
    },
    '6lhoohw2': {
      'es': 'Obras en Pio Baroja',
      'en': 'Works in Pio Baroja',
      'eu': 'Pio Barojan egiten du lan',
    },
    'yh66wgc3': {
      'es': 'Las obras que se estan llevando a cabo en...',
      'en': 'The works that are being carried out in...',
      'eu': 'Urtean egiten ari diren lanak...',
    },
    '7qinumvr': {
      'es': 'Borrar Incidencias',
      'en': 'Delete Incidents',
      'eu': 'Ezabatu Gorabeherak',
    },
    '3xdaui9o': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Etxera',
    },
  },
  // incidencia1
  {
    'ru23myxh': {
      'es': 'Incidencia 1',
      'en': 'Incident 1',
      'eu': 'Gertaera 1',
    },
    'r0uchv3v': {
      'es': 'Cruce poco accesible',
      'en': 'Inaccessible crossing',
      'eu': 'Iristezina den zeharkaldia',
    },
    'z98000rs': {
      'es':
          'Se esta llevando a cabo una obra en Pio Baroja y esta incapacita el paso de peatones. No esta reflejado en la app.',
      'en':
          'A work is being carried out in Pio Baroja and it disables the pedestrian crossing. It is not reflected in the app.',
      'eu':
          'Pio Barojan obra bat egiten ari dira eta oinezkoentzako pasabidea desgaitzen du. Ez da aplikazioan islatzen.',
    },
    'laq956te': {
      'es': 'Home',
      'en': 'Home',
      'eu': 'Etxera',
    },
  },
  // emptyList_tasks
  {
    'zcdjb9ar': {
      'es': 'You don\'t have any tasks',
      'en': '',
      'eu': '',
    },
    '6o6rgfgo': {
      'es': 'Create tasks by tapping the button below.',
      'en': '',
      'eu': '',
    },
    '0chs0vvn': {
      'es': 'Create Task',
      'en': '',
      'eu': '',
    },
  },
  // CreateTask_new
  {
    'yg09m4oy': {
      'es': 'Add Task',
      'en': '',
      'eu': '',
    },
    '91c2jdwb': {
      'es': 'Fill out the details below to add a new task.',
      'en': '',
      'eu': '',
    },
    'n9g4q995': {
      'es': 'Task Name',
      'en': '',
      'eu': '',
    },
    '8sr45hlj': {
      'es': 'Enter your task here....',
      'en': '',
      'eu': '',
    },
    'vjzmcmla': {
      'es': 'Details',
      'en': '',
      'eu': '',
    },
    'hm188si1': {
      'es': 'Enter a description here...',
      'en': '',
      'eu': '',
    },
    'r3t1cyne': {
      'es': 'Cancel',
      'en': '',
      'eu': '',
    },
    'kzzcwfdc': {
      'es': 'Create Task',
      'en': '',
      'eu': '',
    },
  },
  // CreateTask_Edit
  {
    'stnm87dy': {
      'es': 'Add Task',
      'en': '',
      'eu': '',
    },
    'fuid1vzq': {
      'es': 'Fill out the details below to add a new task.',
      'en': '',
      'eu': '',
    },
    'ov4abzza': {
      'es': 'Task Name',
      'en': '',
      'eu': '',
    },
    '3xrvbsmt': {
      'es': 'Enter your task here....',
      'en': '',
      'eu': '',
    },
    'gn7sj1o5': {
      'es': 'Details',
      'en': '',
      'eu': '',
    },
    'z0ft7cae': {
      'es': 'Enter a description here...',
      'en': '',
      'eu': '',
    },
    '29ddx0t8': {
      'es': 'Current Due Date',
      'en': '',
      'eu': '',
    },
    'gi79yecx': {
      'es': 'Cancel',
      'en': '',
      'eu': '',
    },
    'la3aigrx': {
      'es': 'Update Task',
      'en': '',
      'eu': '',
    },
  },
  // Miscellaneous
  {
    'ktf1ietl': {
      'es': 'Para usar tu camara necesitamos que nos des permiso.',
      'en': 'To use your camera we need you to give us permission.',
      'eu': 'Zure kamera erabiltzeko baimena eman behar diguzu.',
    },
    '8joyungj': {
      'es':
          'In order to upload media, this app requires permission to access the photo library.',
      'en':
          'In order to upload media, this app requires permission to access the photo library.',
      'eu':
          'Multimedia kargatzeko, aplikazio honek argazki liburutegira sartzeko baimena behar du.',
    },
    '688yxq25': {
      'es':
          'In order to search nearby, this app requires access to your current location.',
      'en':
          'In order to search nearby, this app requires access to your current location.',
      'eu':
          'Inguruan bilatzeko, aplikazio honek zure uneko kokapenerako sarbidea behar du.',
    },
    'jxcdr4i1': {
      'es': 'Habilita tu ubicacion para poder mejorar tus rutas.',
      'en': 'Enable your location to improve your routes.',
      'eu': 'Gaitu kokapena zure ibilbideak hobetzeko.',
    },
    '2pikm15v': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'ctiphznh': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'thcna587': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'd4zr18sm': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '0jgte8rm': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '4km258n4': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '5c88yak4': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'a464b34k': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'ofn6uan7': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'lp8r35ko': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'mpmrlhox': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'qbjjsbh9': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'p8i0s8vc': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'sevr21yh': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '06wgka6z': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'nn2bhnr7': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '7ua5c9bb': {
      'es': '',
      'en': '',
      'eu': '',
    },
    '60r752bd': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'j9xik524': {
      'es': '',
      'en': '',
      'eu': '',
    },
    'sce5prwo': {
      'es': '',
      'en': '',
      'eu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
