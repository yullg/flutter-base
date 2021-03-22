// Data from android.webkit.MimeTypeMap
import 'dart:io';

import 'package:path/path.dart' as p;

class MimeTypeHelper {
  static bool _initialized = false;
  static Map<String, String> _mimeTypeToExtensionMap = {};
  static Map<String, String> _extensionToMimeTypeMap = {};

  static bool hasExtension(String? extension) {
    _initialize();
    if (extension != null && extension.length > 0) {
      return _extensionToMimeTypeMap.containsKey(extension);
    }
    return false;
  }

  static bool hasMimeType(String? mimeType) {
    _initialize();
    if (mimeType != null && mimeType.length > 0) {
      return _mimeTypeToExtensionMap.containsKey(mimeType);
    }
    return false;
  }

  static String? extensionToMimeType(String? extension) {
    _initialize();
    if (extension != null && extension.length > 0) {
      return _extensionToMimeTypeMap[extension];
    }
    return null;
  }

  static String? mimeTypeToExtension(String? mimeType) {
    _initialize();
    if (mimeType != null && mimeType.length > 0) {
      return _mimeTypeToExtensionMap[mimeType];
    }
    return null;
  }

  static String? getMimeTypeFromFile(File file) {
    var extension = p.extension(file.path).replaceFirst('.', '').toLowerCase();
    return extensionToMimeType(extension);
  }

  static String? getMimeTypeFromUrl(String url) {
    int query = url.lastIndexOf('?');
    if (query > 0) {
      url = url.substring(0, query);
    }
    int filenamePos = url.lastIndexOf('/');
    String filename = filenamePos >= 0 ? url.substring(filenamePos + 1) : url;
    if (filename.length > 0) {
      int dotPos = filename.lastIndexOf('.');
      if (dotPos >= 0) {
        String extension = filename.substring(dotPos + 1);
        return extensionToMimeType(extension);
      }
    }
    return null;
  }

  static void _loadEntry(String mimeType, String extension) {
    if (!_mimeTypeToExtensionMap.containsKey(mimeType)) {
      _mimeTypeToExtensionMap[mimeType] = extension;
    }
    _extensionToMimeTypeMap[extension] = mimeType;
  }

  static void _initialize() {
    if (_initialized) return;
    _loadEntry("application/andrew-inset", "ez");
    _loadEntry("application/dsptype", "tsp");
    _loadEntry("application/futuresplash", "spl");
    _loadEntry("application/hta", "hta");
    _loadEntry("application/mac-binhex40", "hqx");
    _loadEntry("application/mac-compactpro", "cpt");
    _loadEntry("application/mathematica", "nb");
    _loadEntry("application/msaccess", "mdb");
    _loadEntry("application/oda", "oda");
    _loadEntry("application/ogg", "ogg");
    _loadEntry("application/pdf", "pdf");
    _loadEntry("application/pgp-keys", "key");
    _loadEntry("application/pgp-signature", "pgp");
    _loadEntry("application/pics-rules", "prf");
    _loadEntry("application/rar", "rar");
    _loadEntry("application/rdf+xml", "rdf");
    _loadEntry("application/rss+xml", "rss");
    _loadEntry("application/zip", "zip");
    _loadEntry("application/vnd.android.package-archive", "apk");
    _loadEntry("application/vnd.cinderella", "cdy");
    _loadEntry("application/vnd.ms-pki.stl", "stl");
    _loadEntry("application/vnd.oasis.opendocument.database", "odb");
    _loadEntry("application/vnd.oasis.opendocument.formula", "odf");
    _loadEntry("application/vnd.oasis.opendocument.graphics", "odg");
    _loadEntry("application/vnd.oasis.opendocument.graphics-template", "otg");
    _loadEntry("application/vnd.oasis.opendocument.image", "odi");
    _loadEntry("application/vnd.oasis.opendocument.spreadsheet", "ods");
    _loadEntry("application/vnd.oasis.opendocument.spreadsheet-template", "ots");
    _loadEntry("application/vnd.oasis.opendocument.text", "odt");
    _loadEntry("application/vnd.oasis.opendocument.text-master", "odm");
    _loadEntry("application/vnd.oasis.opendocument.text-template", "ott");
    _loadEntry("application/vnd.oasis.opendocument.text-web", "oth");
    _loadEntry("application/msword", "doc");
    _loadEntry("application/msword", "dot");
    _loadEntry("application/vnd.openxmlformats-officedocument.wordprocessingml.document", "docx");
    _loadEntry("application/vnd.openxmlformats-officedocument.wordprocessingml.template", "dotx");
    _loadEntry("application/vnd.ms-excel", "xls");
    _loadEntry("application/vnd.ms-excel", "xlt");
    _loadEntry("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "xlsx");
    _loadEntry("application/vnd.openxmlformats-officedocument.spreadsheetml.template", "xltx");
    _loadEntry("application/vnd.ms-powerpoint", "ppt");
    _loadEntry("application/vnd.ms-powerpoint", "pot");
    _loadEntry("application/vnd.ms-powerpoint", "pps");
    _loadEntry("application/vnd.openxmlformats-officedocument.presentationml.presentation", "pptx");
    _loadEntry("application/vnd.openxmlformats-officedocument.presentationml.template", "potx");
    _loadEntry("application/vnd.openxmlformats-officedocument.presentationml.slideshow", "ppsx");
    _loadEntry("application/vnd.rim.cod", "cod");
    _loadEntry("application/vnd.smaf", "mmf");
    _loadEntry("application/vnd.stardivision.calc", "sdc");
    _loadEntry("application/vnd.stardivision.draw", "sda");
    _loadEntry("application/vnd.stardivision.impress", "sdd");
    _loadEntry("application/vnd.stardivision.impress", "sdp");
    _loadEntry("application/vnd.stardivision.math", "smf");
    _loadEntry("application/vnd.stardivision.writer", "sdw");
    _loadEntry("application/vnd.stardivision.writer", "vor");
    _loadEntry("application/vnd.stardivision.writer-global", "sgl");
    _loadEntry("application/vnd.sun.xml.calc", "sxc");
    _loadEntry("application/vnd.sun.xml.calc.template", "stc");
    _loadEntry("application/vnd.sun.xml.draw", "sxd");
    _loadEntry("application/vnd.sun.xml.draw.template", "std");
    _loadEntry("application/vnd.sun.xml.impress", "sxi");
    _loadEntry("application/vnd.sun.xml.impress.template", "sti");
    _loadEntry("application/vnd.sun.xml.math", "sxm");
    _loadEntry("application/vnd.sun.xml.writer", "sxw");
    _loadEntry("application/vnd.sun.xml.writer.global", "sxg");
    _loadEntry("application/vnd.sun.xml.writer.template", "stw");
    _loadEntry("application/vnd.visio", "vsd");
    _loadEntry("application/x-abiword", "abw");
    _loadEntry("application/x-apple-diskimage", "dmg");
    _loadEntry("application/x-bcpio", "bcpio");
    _loadEntry("application/x-bittorrent", "torrent");
    _loadEntry("application/x-cdf", "cdf");
    _loadEntry("application/x-cdlink", "vcd");
    _loadEntry("application/x-chess-pgn", "pgn");
    _loadEntry("application/x-cpio", "cpio");
    _loadEntry("application/x-debian-package", "deb");
    _loadEntry("application/x-debian-package", "udeb");
    _loadEntry("application/x-director", "dcr");
    _loadEntry("application/x-director", "dir");
    _loadEntry("application/x-director", "dxr");
    _loadEntry("application/x-dms", "dms");
    _loadEntry("application/x-doom", "wad");
    _loadEntry("application/x-dvi", "dvi");
    _loadEntry("application/x-flac", "flac");
    _loadEntry("application/x-font", "pfa");
    _loadEntry("application/x-font", "pfb");
    _loadEntry("application/x-font", "gsf");
    _loadEntry("application/x-font", "pcf");
    _loadEntry("application/x-font", "pcf.Z");
    _loadEntry("application/x-freemind", "mm");
    _loadEntry("application/x-futuresplash", "spl");
    _loadEntry("application/x-gnumeric", "gnumeric");
    _loadEntry("application/x-go-sgf", "sgf");
    _loadEntry("application/x-graphing-calculator", "gcf");
    _loadEntry("application/x-gtar", "gtar");
    _loadEntry("application/x-gtar", "tgz");
    _loadEntry("application/x-gtar", "taz");
    _loadEntry("application/x-hdf", "hdf");
    _loadEntry("application/x-ica", "ica");
    _loadEntry("application/x-internet-signup", "ins");
    _loadEntry("application/x-internet-signup", "isp");
    _loadEntry("application/x-iphone", "iii");
    _loadEntry("application/x-iso9660-image", "iso");
    _loadEntry("application/x-jmol", "jmz");
    _loadEntry("application/x-kchart", "chrt");
    _loadEntry("application/x-killustrator", "kil");
    _loadEntry("application/x-koan", "skp");
    _loadEntry("application/x-koan", "skd");
    _loadEntry("application/x-koan", "skt");
    _loadEntry("application/x-koan", "skm");
    _loadEntry("application/x-kpresenter", "kpr");
    _loadEntry("application/x-kpresenter", "kpt");
    _loadEntry("application/x-kspread", "ksp");
    _loadEntry("application/x-kword", "kwd");
    _loadEntry("application/x-kword", "kwt");
    _loadEntry("application/x-latex", "latex");
    _loadEntry("application/x-lha", "lha");
    _loadEntry("application/x-lzh", "lzh");
    _loadEntry("application/x-lzx", "lzx");
    _loadEntry("application/x-maker", "frm");
    _loadEntry("application/x-maker", "maker");
    _loadEntry("application/x-maker", "frame");
    _loadEntry("application/x-maker", "fb");
    _loadEntry("application/x-maker", "book");
    _loadEntry("application/x-maker", "fbdoc");
    _loadEntry("application/x-mif", "mif");
    _loadEntry("application/x-ms-wmd", "wmd");
    _loadEntry("application/x-ms-wmz", "wmz");
    _loadEntry("application/x-msi", "msi");
    _loadEntry("application/x-ns-proxy-autoconfig", "pac");
    _loadEntry("application/x-nwc", "nwc");
    _loadEntry("application/x-object", "o");
    _loadEntry("application/x-oz-application", "oza");
    _loadEntry("application/x-pkcs12", "p12");
    _loadEntry("application/x-pkcs7-certreqresp", "p7r");
    _loadEntry("application/x-pkcs7-crl", "crl");
    _loadEntry("application/x-quicktimeplayer", "qtl");
    _loadEntry("application/x-shar", "shar");
    _loadEntry("application/x-shockwave-flash", "swf");
    _loadEntry("application/x-stuffit", "sit");
    _loadEntry("application/x-sv4cpio", "sv4cpio");
    _loadEntry("application/x-sv4crc", "sv4crc");
    _loadEntry("application/x-tar", "tar");
    _loadEntry("application/x-texinfo", "texinfo");
    _loadEntry("application/x-texinfo", "texi");
    _loadEntry("application/x-troff", "t");
    _loadEntry("application/x-troff", "roff");
    _loadEntry("application/x-troff-man", "man");
    _loadEntry("application/x-ustar", "ustar");
    _loadEntry("application/x-wais-source", "src");
    _loadEntry("application/x-wingz", "wz");
    _loadEntry("application/x-webarchive", "webarchive");
    _loadEntry("application/x-x509-ca-cert", "crt");
    _loadEntry("application/x-x509-user-cert", "crt");
    _loadEntry("application/x-xcf", "xcf");
    _loadEntry("application/x-xfig", "fig");
    _loadEntry("application/xhtml+xml", "xhtml");
    _loadEntry("audio/3gpp", "3gpp");
    _loadEntry("audio/basic", "snd");
    _loadEntry("audio/midi", "mid");
    _loadEntry("audio/midi", "midi");
    _loadEntry("audio/midi", "kar");
    _loadEntry("audio/mpeg", "mpga");
    _loadEntry("audio/mpeg", "mpega");
    _loadEntry("audio/mpeg", "mp2");
    _loadEntry("audio/mpeg", "mp3");
    _loadEntry("audio/mpeg", "m4a");
    _loadEntry("audio/mpegurl", "m3u");
    _loadEntry("audio/prs.sid", "sid");
    _loadEntry("audio/x-aiff", "aif");
    _loadEntry("audio/x-aiff", "aiff");
    _loadEntry("audio/x-aiff", "aifc");
    _loadEntry("audio/x-gsm", "gsm");
    _loadEntry("audio/x-mpegurl", "m3u");
    _loadEntry("audio/x-ms-wma", "wma");
    _loadEntry("audio/x-ms-wax", "wax");
    _loadEntry("audio/x-pn-realaudio", "ra");
    _loadEntry("audio/x-pn-realaudio", "rm");
    _loadEntry("audio/x-pn-realaudio", "ram");
    _loadEntry("audio/x-realaudio", "ra");
    _loadEntry("audio/x-scpls", "pls");
    _loadEntry("audio/x-sd2", "sd2");
    _loadEntry("audio/x-wav", "wav");
    _loadEntry("image/bmp", "bmp");
    _loadEntry("image/gif", "gif");
    _loadEntry("image/ico", "cur");
    _loadEntry("image/ico", "ico");
    _loadEntry("image/ief", "ief");
    _loadEntry("image/jpeg", "jpeg");
    _loadEntry("image/jpeg", "jpg");
    _loadEntry("image/jpeg", "jpe");
    _loadEntry("image/pcx", "pcx");
    _loadEntry("image/png", "png");
    _loadEntry("image/svg+xml", "svg");
    _loadEntry("image/svg+xml", "svgz");
    _loadEntry("image/tiff", "tiff");
    _loadEntry("image/tiff", "tif");
    _loadEntry("image/vnd.djvu", "djvu");
    _loadEntry("image/vnd.djvu", "djv");
    _loadEntry("image/vnd.wap.wbmp", "wbmp");
    _loadEntry("image/x-cmu-raster", "ras");
    _loadEntry("image/x-coreldraw", "cdr");
    _loadEntry("image/x-coreldrawpattern", "pat");
    _loadEntry("image/x-coreldrawtemplate", "cdt");
    _loadEntry("image/x-corelphotopaint", "cpt");
    _loadEntry("image/x-icon", "ico");
    _loadEntry("image/x-jg", "art");
    _loadEntry("image/x-jng", "jng");
    _loadEntry("image/x-ms-bmp", "bmp");
    _loadEntry("image/x-photoshop", "psd");
    _loadEntry("image/x-portable-anymap", "pnm");
    _loadEntry("image/x-portable-bitmap", "pbm");
    _loadEntry("image/x-portable-graymap", "pgm");
    _loadEntry("image/x-portable-pixmap", "ppm");
    _loadEntry("image/x-rgb", "rgb");
    _loadEntry("image/x-xbitmap", "xbm");
    _loadEntry("image/x-xpixmap", "xpm");
    _loadEntry("image/x-xwindowdump", "xwd");
    _loadEntry("model/iges", "igs");
    _loadEntry("model/iges", "iges");
    _loadEntry("model/mesh", "msh");
    _loadEntry("model/mesh", "mesh");
    _loadEntry("model/mesh", "silo");
    _loadEntry("text/calendar", "ics");
    _loadEntry("text/calendar", "icz");
    _loadEntry("text/comma-separated-values", "csv");
    _loadEntry("text/css", "css");
    _loadEntry("text/html", "htm");
    _loadEntry("text/html", "html");
    _loadEntry("text/h323", "323");
    _loadEntry("text/iuls", "uls");
    _loadEntry("text/mathml", "mml");
    _loadEntry("text/plain", "txt");
    _loadEntry("text/plain", "asc");
    _loadEntry("text/plain", "text");
    _loadEntry("text/plain", "diff");
    _loadEntry("text/plain", "po");
    _loadEntry("text/richtext", "rtx");
    _loadEntry("text/rtf", "rtf");
    _loadEntry("text/texmacs", "ts");
    _loadEntry("text/text", "phps");
    _loadEntry("text/tab-separated-values", "tsv");
    _loadEntry("text/xml", "xml");
    _loadEntry("text/x-bibtex", "bib");
    _loadEntry("text/x-boo", "boo");
    _loadEntry("text/x-c++hdr", "h++");
    _loadEntry("text/x-c++hdr", "hpp");
    _loadEntry("text/x-c++hdr", "hxx");
    _loadEntry("text/x-c++hdr", "hh");
    _loadEntry("text/x-c++src", "c++");
    _loadEntry("text/x-c++src", "cpp");
    _loadEntry("text/x-c++src", "cxx");
    _loadEntry("text/x-chdr", "h");
    _loadEntry("text/x-component", "htc");
    _loadEntry("text/x-csh", "csh");
    _loadEntry("text/x-csrc", "c");
    _loadEntry("text/x-dsrc", "d");
    _loadEntry("text/x-haskell", "hs");
    _loadEntry("text/x-java", "java");
    _loadEntry("text/x-literate-haskell", "lhs");
    _loadEntry("text/x-moc", "moc");
    _loadEntry("text/x-pascal", "p");
    _loadEntry("text/x-pascal", "pas");
    _loadEntry("text/x-pcs-gcd", "gcd");
    _loadEntry("text/x-setext", "etx");
    _loadEntry("text/x-tcl", "tcl");
    _loadEntry("text/x-tex", "tex");
    _loadEntry("text/x-tex", "ltx");
    _loadEntry("text/x-tex", "sty");
    _loadEntry("text/x-tex", "cls");
    _loadEntry("text/x-vcalendar", "vcs");
    _loadEntry("text/x-vcard", "vcf");
    _loadEntry("video/3gpp", "3gpp");
    _loadEntry("video/3gpp", "3gp");
    _loadEntry("video/3gpp", "3g2");
    _loadEntry("video/dl", "dl");
    _loadEntry("video/dv", "dif");
    _loadEntry("video/dv", "dv");
    _loadEntry("video/fli", "fli");
    _loadEntry("video/m4v", "m4v");
    _loadEntry("video/mpeg", "mpeg");
    _loadEntry("video/mpeg", "mpg");
    _loadEntry("video/mpeg", "mpe");
    _loadEntry("video/mp4", "mp4");
    _loadEntry("video/mpeg", "vob");
    _loadEntry("video/quicktime", "qt");
    _loadEntry("video/quicktime", "mov");
    _loadEntry("video/vnd.mpegurl", "mxu");
    _loadEntry("video/x-la-asf", "lsf");
    _loadEntry("video/x-la-asf", "lsx");
    _loadEntry("video/x-mng", "mng");
    _loadEntry("video/x-ms-asf", "asf");
    _loadEntry("video/x-ms-asf", "asx");
    _loadEntry("video/x-ms-wm", "wm");
    _loadEntry("video/x-ms-wmv", "wmv");
    _loadEntry("video/x-ms-wmx", "wmx");
    _loadEntry("video/x-ms-wvx", "wvx");
    _loadEntry("video/x-msvideo", "avi");
    _loadEntry("video/x-sgi-movie", "movie");
    _loadEntry("x-conference/x-cooltalk", "ice");
    _loadEntry("x-epoc/x-sisx-app", "sisx");
    _initialized = true;
  }

  MimeTypeHelper._();
}
