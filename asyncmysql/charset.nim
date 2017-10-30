#    AsyncMysql - Asynchronous MySQL connector written in pure Nim
#        (c) Copyright 2017 Wang Tong
#
#    See the file "LICENSE", included in this distribution, for
#    details about the copyright.

## This module provides charset which are used by MySQL Client/Server Protocol. 
## This is called "collation" in the SQL-level of MySQL. If a SQL-level charset is 
## specified (like ``CHARSET_UTF8_GENERAL_CI``) then the default collation for that 
## charset is used.    

import mysqlparser

when defined(asyncmysqldoc):
  const 
    CHARSET_BIG5_CHINESE_CI* = CHARSET_BIG5_CHINESE_CI
    CHARSET_LATIN2_CZECH_CS* = CHARSET_LATIN2_CZECH_CS
    CHARSET_DEC8_SWEDISH_CI* = CHARSET_DEC8_SWEDISH_CI
    CHARSET_CP850_GENERAL_CI* = CHARSET_CP850_GENERAL_CI
    CHARSET_LATIN1_GERMAN1_CI* = CHARSET_LATIN1_GERMAN1_CI
    CHARSET_HP8_ENGLISH_CI* = CHARSET_HP8_ENGLISH_CI
    CHARSET_KOI8R_GENERAL_CI* = CHARSET_KOI8R_GENERAL_CI
    CHARSET_LATIN1_SWEDISH_CI* = CHARSET_LATIN1_SWEDISH_CI
    CHARSET_LATIN2_GENERAL_CI* = CHARSET_LATIN2_GENERAL_CI
    CHARSET_SWE7_SWEDISH_CI* = CHARSET_SWE7_SWEDISH_CI
    CHARSET_ASCII_GENERAL_CI* = CHARSET_ASCII_GENERAL_CI
    CHARSET_UJIS_JAPANESE_CI* = CHARSET_UJIS_JAPANESE_CI
    CHARSET_SJIS_JAPANESE_CI* = CHARSET_SJIS_JAPANESE_CI
    CHARSET_CP1251_BULGARIAN_CI* = CHARSET_CP1251_BULGARIAN_CI
    CHARSET_LATIN1_DANISH_CI* = CHARSET_LATIN1_DANISH_CI
    CHARSET_HEBREW_GENERAL_CI* = CHARSET_HEBREW_GENERAL_CI
    CHARSET_TIS620_THAI_CI* = CHARSET_TIS620_THAI_CI
    CHARSET_EUCKR_KOREAN_CI* = CHARSET_EUCKR_KOREAN_CI
    CHARSET_LATIN7_ESTONIAN_CS* = CHARSET_LATIN7_ESTONIAN_CS
    CHARSET_LATIN2_HUNGARIAN_CI* = CHARSET_LATIN2_HUNGARIAN_CI
    CHARSET_KOI8U_GENERAL_CI* = CHARSET_KOI8U_GENERAL_CI
    CHARSET_CP1251_UKRAINIAN_CI* = CHARSET_CP1251_UKRAINIAN_CI
    CHARSET_GB2312_CHINESE_CI* = CHARSET_GB2312_CHINESE_CI
    CHARSET_GREEK_GENERAL_CI* = CHARSET_GREEK_GENERAL_CI
    CHARSET_CP1250_GENERAL_CI* = CHARSET_CP1250_GENERAL_CI
    CHARSET_LATIN2_CROATIAN_CI* = CHARSET_LATIN2_CROATIAN_CI
    CHARSET_GBK_CHINESE_CI* = CHARSET_GBK_CHINESE_CI
    CHARSET_CP1257_LITHUANIAN_CI* = CHARSET_CP1257_LITHUANIAN_CI
    CHARSET_LATIN5_TURKISH_CI* = CHARSET_LATIN5_TURKISH_CI
    CHARSET_LATIN1_GERMAN2_CI* = CHARSET_LATIN1_GERMAN2_CI
    CHARSET_ARMSCII8_GENERAL_CI* = CHARSET_ARMSCII8_GENERAL_CI
    CHARSET_UTF8_GENERAL_CI* = CHARSET_UTF8_GENERAL_CI
    CHARSET_CP1250_CZECH_CS* = CHARSET_CP1250_CZECH_CS
    CHARSET_UCS2_GENERAL_CI* = CHARSET_UCS2_GENERAL_CI
    CHARSET_CP866_GENERAL_CI* = CHARSET_CP866_GENERAL_CI
    CHARSET_KEYBCS2_GENERAL_CI* = CHARSET_KEYBCS2_GENERAL_CI
    CHARSET_MACCE_GENERAL_CI* = CHARSET_MACCE_GENERAL_CI
    CHARSET_MACROMAN_GENERAL_CI* = CHARSET_MACROMAN_GENERAL_CI
    CHARSET_CP852_GENERAL_CI* = CHARSET_CP852_GENERAL_CI
    CHARSET_LATIN7_GENERAL_CI* = CHARSET_LATIN7_GENERAL_CI
    CHARSET_LATIN7_GENERAL_CS* = CHARSET_LATIN7_GENERAL_CS
    CHARSET_MACCE_BIN* = CHARSET_MACCE_BIN
    CHARSET_CP1250_CROATIAN_CI* = CHARSET_CP1250_CROATIAN_CI
    CHARSET_UTF8MB4_GENERAL_CI* = CHARSET_UTF8MB4_GENERAL_CI
    CHARSET_UTF8MB4_BIN* = CHARSET_UTF8MB4_BIN
    CHARSET_LATIN1_BIN* = CHARSET_LATIN1_BIN
    CHARSET_LATIN1_GENERAL_CI* = CHARSET_LATIN1_GENERAL_CI
    CHARSET_LATIN1_GENERAL_CS* = CHARSET_LATIN1_GENERAL_CS
    CHARSET_CP1251_BIN* = CHARSET_CP1251_BIN
    CHARSET_CP1251_GENERAL_CI* = CHARSET_CP1251_GENERAL_CI
    CHARSET_CP1251_GENERAL_CS* = CHARSET_CP1251_GENERAL_CS
    CHARSET_MACROMAN_BIN* = CHARSET_MACROMAN_BIN
    CHARSET_UTF16_GENERAL_CI* = CHARSET_UTF16_GENERAL_CI
    CHARSET_UTF16_BIN* = CHARSET_UTF16_BIN
    CHARSET_UTF16LE_GENERAL_CI* = CHARSET_UTF16LE_GENERAL_CI
    CHARSET_CP1256_GENERAL_CI* = CHARSET_CP1256_GENERAL_CI
    CHARSET_CP1257_BIN* = CHARSET_CP1257_BIN
    CHARSET_CP1257_GENERAL_CI* = CHARSET_CP1257_GENERAL_CI
    CHARSET_UTF32_GENERAL_CI* = CHARSET_UTF32_GENERAL_CI
    CHARSET_UTF32_BIN* = CHARSET_UTF32_BIN
    CHARSET_UTF16LE_BIN* = CHARSET_UTF16LE_BIN
    CHARSET_BINARY* = CHARSET_BINARY
    CHARSET_ARMSCII8_BIN* = CHARSET_ARMSCII8_BIN
    CHARSET_ASCII_BIN* = CHARSET_ASCII_BIN
    CHARSET_CP1250_BIN* = CHARSET_CP1250_BIN
    CHARSET_CP1256_BIN* = CHARSET_CP1256_BIN
    CHARSET_CP866_BIN* = CHARSET_CP866_BIN
    CHARSET_DEC8_BIN* = CHARSET_DEC8_BIN
    CHARSET_GREEK_BIN* = CHARSET_GREEK_BIN
    CHARSET_HEBREW_BIN* = CHARSET_HEBREW_BIN
    CHARSET_HP8_BIN* = CHARSET_HP8_BIN
    CHARSET_KEYBCS2_BIN* = CHARSET_KEYBCS2_BIN
    CHARSET_KOI8R_BIN* = CHARSET_KOI8R_BIN
    CHARSET_KOI8U_BIN* = CHARSET_KOI8U_BIN
    CHARSET_LATIN2_BIN* = CHARSET_LATIN2_BIN
    CHARSET_LATIN5_BIN* = CHARSET_LATIN5_BIN
    CHARSET_LATIN7_BIN* = CHARSET_LATIN7_BIN
    CHARSET_CP850_BIN* = CHARSET_CP850_BIN
    CHARSET_CP852_BIN* = CHARSET_CP852_BIN
    CHARSET_SWE7_BIN* = CHARSET_SWE7_BIN
    CHARSET_UTF8_BIN* = CHARSET_UTF8_BIN
    CHARSET_BIG5_BIN* = CHARSET_BIG5_BIN
    CHARSET_EUCKR_BIN* = CHARSET_EUCKR_BIN
    CHARSET_GB2312_BIN* = CHARSET_GB2312_BIN
    CHARSET_GBK_BIN* = CHARSET_GBK_BIN
    CHARSET_SJIS_BIN* = CHARSET_SJIS_BIN
    CHARSET_TIS620_BIN* = CHARSET_TIS620_BIN
    CHARSET_UCS2_BIN* = CHARSET_UCS2_BIN
    CHARSET_UJIS_BIN* = CHARSET_UJIS_BIN
    CHARSET_GEOSTD8_GENERAL_CI* = CHARSET_GEOSTD8_GENERAL_CI
    CHARSET_GEOSTD8_BIN* = CHARSET_GEOSTD8_BIN
    CHARSET_LATIN1_SPANISH_CI* = CHARSET_LATIN1_SPANISH_CI
    CHARSET_CP932_JAPANESE_CI* = CHARSET_CP932_JAPANESE_CI
    CHARSET_CP932_BIN* = CHARSET_CP932_BIN
    CHARSET_EUCJPMS_JAPANESE_CI* = CHARSET_EUCJPMS_JAPANESE_CI
    CHARSET_EUCJPMS_BIN* = CHARSET_EUCJPMS_BIN
    CHARSET_CP1250_POLISH_CI* = CHARSET_CP1250_POLISH_CI
    CHARSET_UTF16_UNICODE_CI* = CHARSET_UTF16_UNICODE_CI
    CHARSET_UTF16_ICELANDIC_CI* = CHARSET_UTF16_ICELANDIC_CI
    CHARSET_UTF16_LATVIAN_CI* = CHARSET_UTF16_LATVIAN_CI
    CHARSET_UTF16_ROMANIAN_CI* = CHARSET_UTF16_ROMANIAN_CI
    CHARSET_UTF16_SLOVENIAN_CI* = CHARSET_UTF16_SLOVENIAN_CI
    CHARSET_UTF16_POLISH_CI* = CHARSET_UTF16_POLISH_CI
    CHARSET_UTF16_ESTONIAN_CI* = CHARSET_UTF16_ESTONIAN_CI
    CHARSET_UTF16_SPANISH_CI* = CHARSET_UTF16_SPANISH_CI
    CHARSET_UTF16_SWEDISH_CI* = CHARSET_UTF16_SWEDISH_CI
    CHARSET_UTF16_TURKISH_CI* = CHARSET_UTF16_TURKISH_CI
    CHARSET_UTF16_CZECH_CI* = CHARSET_UTF16_CZECH_CI
    CHARSET_UTF16_DANISH_CI* = CHARSET_UTF16_DANISH_CI
    CHARSET_UTF16_LITHUANIAN_CI* = CHARSET_UTF16_LITHUANIAN_CI
    CHARSET_UTF16_SLOVAK_CI* = CHARSET_UTF16_SLOVAK_CI
    CHARSET_UTF16_SPANISH2_CI* = CHARSET_UTF16_SPANISH2_CI
    CHARSET_UTF16_ROMAN_CI* = CHARSET_UTF16_ROMAN_CI
    CHARSET_UTF16_PERSIAN_CI* = CHARSET_UTF16_PERSIAN_CI
    CHARSET_UTF16_ESPERANTO_CI* = CHARSET_UTF16_ESPERANTO_CI
    CHARSET_UTF16_HUNGARIAN_CI* = CHARSET_UTF16_HUNGARIAN_CI
    CHARSET_UTF16_SINHALA_CI* = CHARSET_UTF16_SINHALA_CI
    CHARSET_UTF16_GERMAN2_CI* = CHARSET_UTF16_GERMAN2_CI
    CHARSET_UTF16_CROATIAN_MYSQL561_CI* = CHARSET_UTF16_CROATIAN_MYSQL561_CI
    CHARSET_UTF16_UNICODE_520_CI* = CHARSET_UTF16_UNICODE_520_CI
    CHARSET_UTF16_VIETNAMESE_CI* = CHARSET_UTF16_VIETNAMESE_CI
    CHARSET_UCS2_UNICODE_CI* = CHARSET_UCS2_UNICODE_CI
    CHARSET_UCS2_ICELANDIC_CI* = CHARSET_UCS2_ICELANDIC_CI
    CHARSET_UCS2_LATVIAN_CI* = CHARSET_UCS2_LATVIAN_CI
    CHARSET_UCS2_ROMANIAN_CI* = CHARSET_UCS2_ROMANIAN_CI
    CHARSET_UCS2_SLOVENIAN_CI* = CHARSET_UCS2_SLOVENIAN_CI
    CHARSET_UCS2_POLISH_CI* = CHARSET_UCS2_POLISH_CI
    CHARSET_UCS2_ESTONIAN_CI* = CHARSET_UCS2_ESTONIAN_CI
    CHARSET_UCS2_SPANISH_CI* = CHARSET_UCS2_SPANISH_CI
    CHARSET_UCS2_SWEDISH_CI* = CHARSET_UCS2_SWEDISH_CI
    CHARSET_UCS2_TURKISH_CI* = CHARSET_UCS2_TURKISH_CI
    CHARSET_UCS2_CZECH_CI* = CHARSET_UCS2_CZECH_CI
    CHARSET_UCS2_DANISH_CI* = CHARSET_UCS2_DANISH_CI
    CHARSET_UCS2_LITHUANIAN_CI* = CHARSET_UCS2_LITHUANIAN_CI
    CHARSET_UCS2_SLOVAK_CI* = CHARSET_UCS2_SLOVAK_CI
    CHARSET_UCS2_SPANISH2_CI* = CHARSET_UCS2_SPANISH2_CI
    CHARSET_UCS2_ROMAN_CI* = CHARSET_UCS2_ROMAN_CI
    CHARSET_UCS2_PERSIAN_CI* = CHARSET_UCS2_PERSIAN_CI
    CHARSET_UCS2_ESPERANTO_CI* = CHARSET_UCS2_ESPERANTO_CI
    CHARSET_UCS2_HUNGARIAN_CI* = CHARSET_UCS2_HUNGARIAN_CI
    CHARSET_UCS2_SINHALA_CI* = CHARSET_UCS2_SINHALA_CI
    CHARSET_UCS2_GERMAN2_CI* = CHARSET_UCS2_GERMAN2_CI
    CHARSET_UCS2_CROATIAN_MYSQL561_CI* = CHARSET_UCS2_CROATIAN_MYSQL561_CI
    CHARSET_UCS2_UNICODE_520_CI* = CHARSET_UCS2_UNICODE_520_CI
    CHARSET_UCS2_VIETNAMESE_CI* = CHARSET_UCS2_VIETNAMESE_CI
    CHARSET_UCS2_GENERAL_MYSQL500_CI* = CHARSET_UCS2_GENERAL_MYSQL500_CI
    CHARSET_UTF32_UNICODE_CI* = CHARSET_UTF32_UNICODE_CI
    CHARSET_UTF32_ICELANDIC_CI* = CHARSET_UTF32_ICELANDIC_CI
    CHARSET_UTF32_LATVIAN_CI* = CHARSET_UTF32_LATVIAN_CI
    CHARSET_UTF32_ROMANIAN_CI* = CHARSET_UTF32_ROMANIAN_CI
    CHARSET_UTF32_SLOVENIAN_CI* = CHARSET_UTF32_SLOVENIAN_CI
    CHARSET_UTF32_POLISH_CI* = CHARSET_UTF32_POLISH_CI
    CHARSET_UTF32_ESTONIAN_CI* = CHARSET_UTF32_ESTONIAN_CI
    CHARSET_UTF32_SPANISH_CI* = CHARSET_UTF32_SPANISH_CI
    CHARSET_UTF32_SWEDISH_CI* = CHARSET_UTF32_SWEDISH_CI
    CHARSET_UTF32_TURKISH_CI* = CHARSET_UTF32_TURKISH_CI
    CHARSET_UTF32_CZECH_CI* = CHARSET_UTF32_CZECH_CI
    CHARSET_UTF32_DANISH_CI* = CHARSET_UTF32_DANISH_CI
    CHARSET_UTF32_LITHUANIAN_CI* = CHARSET_UTF32_LITHUANIAN_CI
    CHARSET_UTF32_SLOVAK_CI* = CHARSET_UTF32_SLOVAK_CI
    CHARSET_UTF32_SPANISH2_CI* = CHARSET_UTF32_SPANISH2_CI
    CHARSET_UTF32_ROMAN_CI* = CHARSET_UTF32_ROMAN_CI
    CHARSET_UTF32_PERSIAN_CI* = CHARSET_UTF32_PERSIAN_CI
    CHARSET_UTF32_ESPERANTO_CI* = CHARSET_UTF32_ESPERANTO_CI
    CHARSET_UTF32_HUNGARIAN_CI* = CHARSET_UTF32_HUNGARIAN_CI
    CHARSET_UTF32_SINHALA_CI* = CHARSET_UTF32_SINHALA_CI
    CHARSET_UTF32_GERMAN2_CI* = CHARSET_UTF32_GERMAN2_CI
    CHARSET_UTF32_CROATIAN_MYSQL561_CI* = CHARSET_UTF32_CROATIAN_MYSQL561_CI
    CHARSET_UTF32_UNICODE_520_CI* = CHARSET_UTF32_UNICODE_520_CI
    CHARSET_UTF32_VIETNAMESE_CI* = CHARSET_UTF32_VIETNAMESE_CI
    CHARSET_UTF8_UNICODE_CI* = CHARSET_UTF8_UNICODE_CI
    CHARSET_UTF8_ICELANDIC_CI* = CHARSET_UTF8_ICELANDIC_CI
    CHARSET_UTF8_LATVIAN_CI* = CHARSET_UTF8_LATVIAN_CI
    CHARSET_UTF8_ROMANIAN_CI* = CHARSET_UTF8_ROMANIAN_CI
    CHARSET_UTF8_SLOVENIAN_CI* = CHARSET_UTF8_SLOVENIAN_CI
    CHARSET_UTF8_POLISH_CI* = CHARSET_UTF8_POLISH_CI
    CHARSET_UTF8_ESTONIAN_CI* = CHARSET_UTF8_ESTONIAN_CI
    CHARSET_UTF8_SPANISH_CI* = CHARSET_UTF8_SPANISH_CI
    CHARSET_UTF8_SWEDISH_CI* = CHARSET_UTF8_SWEDISH_CI
    CHARSET_UTF8_TURKISH_CI* = CHARSET_UTF8_TURKISH_CI
    CHARSET_UTF8_CZECH_CI* = CHARSET_UTF8_CZECH_CI
    CHARSET_UTF8_DANISH_CI* = CHARSET_UTF8_DANISH_CI
    CHARSET_UTF8_LITHUANIAN_CI* = CHARSET_UTF8_LITHUANIAN_CI
    CHARSET_UTF8_SLOVAK_CI* = CHARSET_UTF8_SLOVAK_CI
    CHARSET_UTF8_SPANISH2_CI* = CHARSET_UTF8_SPANISH2_CI
    CHARSET_UTF8_ROMAN_CI* = CHARSET_UTF8_ROMAN_CI
    CHARSET_UTF8_PERSIAN_CI* = CHARSET_UTF8_PERSIAN_CI
    CHARSET_UTF8_ESPERANTO_CI* = CHARSET_UTF8_ESPERANTO_CI
    CHARSET_UTF8_HUNGARIAN_CI* = CHARSET_UTF8_HUNGARIAN_CI
    CHARSET_UTF8_SINHALA_CI* = CHARSET_UTF8_SINHALA_CI
    CHARSET_UTF8_GERMAN2_CI* = CHARSET_UTF8_GERMAN2_CI
    CHARSET_UTF8_CROATIAN_MYSQL561_CI* = CHARSET_UTF8_CROATIAN_MYSQL561_CI
    CHARSET_UTF8_UNICODE_520_CI* = CHARSET_UTF8_UNICODE_520_CI
    CHARSET_UTF8_VIETNAMESE_CI* = CHARSET_UTF8_VIETNAMESE_CI
    CHARSET_UTF8_GENERAL_MYSQL500_CI* = CHARSET_UTF8_GENERAL_MYSQL500_CI
    CHARSET_UTF8MB4_UNICODE_CI* = CHARSET_UTF8MB4_UNICODE_CI
    CHARSET_UTF8MB4_ICELANDIC_CI* = CHARSET_UTF8MB4_ICELANDIC_CI
    CHARSET_UTF8MB4_LATVIAN_CI* = CHARSET_UTF8MB4_LATVIAN_CI
    CHARSET_UTF8MB4_ROMANIAN_CI* = CHARSET_UTF8MB4_ROMANIAN_CI
    CHARSET_UTF8MB4_SLOVENIAN_CI* = CHARSET_UTF8MB4_SLOVENIAN_CI
    CHARSET_UTF8MB4_POLISH_CI* = CHARSET_UTF8MB4_POLISH_CI
    CHARSET_UTF8MB4_ESTONIAN_CI* = CHARSET_UTF8MB4_ESTONIAN_CI
    CHARSET_UTF8MB4_SPANISH_CI* = CHARSET_UTF8MB4_SPANISH_CI
    CHARSET_UTF8MB4_SWEDISH_CI* = CHARSET_UTF8MB4_SWEDISH_CI
    CHARSET_UTF8MB4_TURKISH_CI* = CHARSET_UTF8MB4_TURKISH_CI
    CHARSET_UTF8MB4_CZECH_CI* = CHARSET_UTF8MB4_CZECH_CI
    CHARSET_UTF8MB4_DANISH_CI* = CHARSET_UTF8MB4_DANISH_CI
    CHARSET_UTF8MB4_LITHUANIAN_CI* = CHARSET_UTF8MB4_LITHUANIAN_CI
    CHARSET_UTF8MB4_SLOVAK_CI* = CHARSET_UTF8MB4_SLOVAK_CI
    CHARSET_UTF8MB4_SPANISH2_CI* = CHARSET_UTF8MB4_SPANISH2_CI
    CHARSET_UTF8MB4_ROMAN_CI* = CHARSET_UTF8MB4_ROMAN_CI
    CHARSET_UTF8MB4_PERSIAN_CI* = CHARSET_UTF8MB4_PERSIAN_CI
    CHARSET_UTF8MB4_ESPERANTO_CI* = CHARSET_UTF8MB4_ESPERANTO_CI
    CHARSET_UTF8MB4_HUNGARIAN_CI* = CHARSET_UTF8MB4_HUNGARIAN_CI
    CHARSET_UTF8MB4_SINHALA_CI* = CHARSET_UTF8MB4_SINHALA_CI
    CHARSET_UTF8MB4_GERMAN2_CI* = CHARSET_UTF8MB4_GERMAN2_CI
    CHARSET_UTF8MB4_CROATIAN_MYSQL561_CI* = CHARSET_UTF8MB4_CROATIAN_MYSQL561_CI
    CHARSET_UTF8MB4_UNICODE_520_CI* = CHARSET_UTF8MB4_UNICODE_520_CI
    CHARSET_UTF8MB4_VIETNAMESE_CI* = CHARSET_UTF8MB4_VIETNAMESE_CI
    CHARSET_UTF8_GENERAL50_CI* = CHARSET_UTF8_GENERAL50_CI

else:
  export
    CHARSET_BIG5_CHINESE_CI,
    CHARSET_LATIN2_CZECH_CS,
    CHARSET_DEC8_SWEDISH_CI,
    CHARSET_CP850_GENERAL_CI,
    CHARSET_LATIN1_GERMAN1_CI,
    CHARSET_HP8_ENGLISH_CI,
    CHARSET_KOI8R_GENERAL_CI,
    CHARSET_LATIN1_SWEDISH_CI,
    CHARSET_LATIN2_GENERAL_CI,
    CHARSET_SWE7_SWEDISH_CI,
    CHARSET_ASCII_GENERAL_CI,
    CHARSET_UJIS_JAPANESE_CI,
    CHARSET_SJIS_JAPANESE_CI,
    CHARSET_CP1251_BULGARIAN_CI,
    CHARSET_LATIN1_DANISH_CI,
    CHARSET_HEBREW_GENERAL_CI,
    CHARSET_TIS620_THAI_CI,
    CHARSET_EUCKR_KOREAN_CI,
    CHARSET_LATIN7_ESTONIAN_CS,
    CHARSET_LATIN2_HUNGARIAN_CI,
    CHARSET_KOI8U_GENERAL_CI,
    CHARSET_CP1251_UKRAINIAN_CI,
    CHARSET_GB2312_CHINESE_CI,
    CHARSET_GREEK_GENERAL_CI,
    CHARSET_CP1250_GENERAL_CI,
    CHARSET_LATIN2_CROATIAN_CI,
    CHARSET_GBK_CHINESE_CI,
    CHARSET_CP1257_LITHUANIAN_CI,
    CHARSET_LATIN5_TURKISH_CI,
    CHARSET_LATIN1_GERMAN2_CI,
    CHARSET_ARMSCII8_GENERAL_CI,
    CHARSET_UTF8_GENERAL_CI,
    CHARSET_CP1250_CZECH_CS,
    CHARSET_UCS2_GENERAL_CI,
    CHARSET_CP866_GENERAL_CI,
    CHARSET_KEYBCS2_GENERAL_CI,
    CHARSET_MACCE_GENERAL_CI,
    CHARSET_MACROMAN_GENERAL_CI,
    CHARSET_CP852_GENERAL_CI,
    CHARSET_LATIN7_GENERAL_CI,
    CHARSET_LATIN7_GENERAL_CS,
    CHARSET_MACCE_BIN,
    CHARSET_CP1250_CROATIAN_CI,
    CHARSET_UTF8MB4_GENERAL_CI,
    CHARSET_UTF8MB4_BIN,
    CHARSET_LATIN1_BIN,
    CHARSET_LATIN1_GENERAL_CI,
    CHARSET_LATIN1_GENERAL_CS,
    CHARSET_CP1251_BIN,
    CHARSET_CP1251_GENERAL_CI,
    CHARSET_CP1251_GENERAL_CS,
    CHARSET_MACROMAN_BIN,
    CHARSET_UTF16_GENERAL_CI,
    CHARSET_UTF16_BIN,
    CHARSET_UTF16LE_GENERAL_CI,
    CHARSET_CP1256_GENERAL_CI,
    CHARSET_CP1257_BIN,
    CHARSET_CP1257_GENERAL_CI,
    CHARSET_UTF32_GENERAL_CI,
    CHARSET_UTF32_BIN,
    CHARSET_UTF16LE_BIN,
    CHARSET_BINARY,
    CHARSET_ARMSCII8_BIN,
    CHARSET_ASCII_BIN,
    CHARSET_CP1250_BIN,
    CHARSET_CP1256_BIN,
    CHARSET_CP866_BIN,
    CHARSET_DEC8_BIN,
    CHARSET_GREEK_BIN,
    CHARSET_HEBREW_BIN,
    CHARSET_HP8_BIN,
    CHARSET_KEYBCS2_BIN,
    CHARSET_KOI8R_BIN,
    CHARSET_KOI8U_BIN,
    CHARSET_LATIN2_BIN,
    CHARSET_LATIN5_BIN,
    CHARSET_LATIN7_BIN,
    CHARSET_CP850_BIN,
    CHARSET_CP852_BIN,
    CHARSET_SWE7_BIN,
    CHARSET_UTF8_BIN,
    CHARSET_BIG5_BIN,
    CHARSET_EUCKR_BIN,
    CHARSET_GB2312_BIN,
    CHARSET_GBK_BIN,
    CHARSET_SJIS_BIN,
    CHARSET_TIS620_BIN,
    CHARSET_UCS2_BIN,
    CHARSET_UJIS_BIN,
    CHARSET_GEOSTD8_GENERAL_CI,
    CHARSET_GEOSTD8_BIN,
    CHARSET_LATIN1_SPANISH_CI,
    CHARSET_CP932_JAPANESE_CI,
    CHARSET_CP932_BIN,
    CHARSET_EUCJPMS_JAPANESE_CI,
    CHARSET_EUCJPMS_BIN,
    CHARSET_CP1250_POLISH_CI,
    CHARSET_UTF16_UNICODE_CI,
    CHARSET_UTF16_ICELANDIC_CI,
    CHARSET_UTF16_LATVIAN_CI,
    CHARSET_UTF16_ROMANIAN_CI,
    CHARSET_UTF16_SLOVENIAN_CI,
    CHARSET_UTF16_POLISH_CI,
    CHARSET_UTF16_ESTONIAN_CI,
    CHARSET_UTF16_SPANISH_CI,
    CHARSET_UTF16_SWEDISH_CI,
    CHARSET_UTF16_TURKISH_CI,
    CHARSET_UTF16_CZECH_CI,
    CHARSET_UTF16_DANISH_CI,
    CHARSET_UTF16_LITHUANIAN_CI,
    CHARSET_UTF16_SLOVAK_CI,
    CHARSET_UTF16_SPANISH2_CI,
    CHARSET_UTF16_ROMAN_CI,
    CHARSET_UTF16_PERSIAN_CI,
    CHARSET_UTF16_ESPERANTO_CI,
    CHARSET_UTF16_HUNGARIAN_CI,
    CHARSET_UTF16_SINHALA_CI,
    CHARSET_UTF16_GERMAN2_CI,
    CHARSET_UTF16_CROATIAN_MYSQL561_CI,
    CHARSET_UTF16_UNICODE_520_CI,
    CHARSET_UTF16_VIETNAMESE_CI,
    CHARSET_UCS2_UNICODE_CI,
    CHARSET_UCS2_ICELANDIC_CI,
    CHARSET_UCS2_LATVIAN_CI,
    CHARSET_UCS2_ROMANIAN_CI,
    CHARSET_UCS2_SLOVENIAN_CI,
    CHARSET_UCS2_POLISH_CI,
    CHARSET_UCS2_ESTONIAN_CI,
    CHARSET_UCS2_SPANISH_CI,
    CHARSET_UCS2_SWEDISH_CI,
    CHARSET_UCS2_TURKISH_CI,
    CHARSET_UCS2_CZECH_CI,
    CHARSET_UCS2_DANISH_CI,
    CHARSET_UCS2_LITHUANIAN_CI,
    CHARSET_UCS2_SLOVAK_CI,
    CHARSET_UCS2_SPANISH2_CI,
    CHARSET_UCS2_ROMAN_CI,
    CHARSET_UCS2_PERSIAN_CI,
    CHARSET_UCS2_ESPERANTO_CI,
    CHARSET_UCS2_HUNGARIAN_CI,
    CHARSET_UCS2_SINHALA_CI,
    CHARSET_UCS2_GERMAN2_CI,
    CHARSET_UCS2_CROATIAN_MYSQL561_CI,
    CHARSET_UCS2_UNICODE_520_CI,
    CHARSET_UCS2_VIETNAMESE_CI,
    CHARSET_UCS2_GENERAL_MYSQL500_CI,
    CHARSET_UTF32_UNICODE_CI,
    CHARSET_UTF32_ICELANDIC_CI,
    CHARSET_UTF32_LATVIAN_CI,
    CHARSET_UTF32_ROMANIAN_CI,
    CHARSET_UTF32_SLOVENIAN_CI,
    CHARSET_UTF32_POLISH_CI,
    CHARSET_UTF32_ESTONIAN_CI,
    CHARSET_UTF32_SPANISH_CI,
    CHARSET_UTF32_SWEDISH_CI,
    CHARSET_UTF32_TURKISH_CI,
    CHARSET_UTF32_CZECH_CI,
    CHARSET_UTF32_DANISH_CI,
    CHARSET_UTF32_LITHUANIAN_CI,
    CHARSET_UTF32_SLOVAK_CI,
    CHARSET_UTF32_SPANISH2_CI,
    CHARSET_UTF32_ROMAN_CI,
    CHARSET_UTF32_PERSIAN_CI,
    CHARSET_UTF32_ESPERANTO_CI,
    CHARSET_UTF32_HUNGARIAN_CI,
    CHARSET_UTF32_SINHALA_CI,
    CHARSET_UTF32_GERMAN2_CI,
    CHARSET_UTF32_CROATIAN_MYSQL561_CI,
    CHARSET_UTF32_UNICODE_520_CI,
    CHARSET_UTF32_VIETNAMESE_CI,
    CHARSET_UTF8_UNICODE_CI,
    CHARSET_UTF8_ICELANDIC_CI,
    CHARSET_UTF8_LATVIAN_CI,
    CHARSET_UTF8_ROMANIAN_CI,
    CHARSET_UTF8_SLOVENIAN_CI,
    CHARSET_UTF8_POLISH_CI,
    CHARSET_UTF8_ESTONIAN_CI,
    CHARSET_UTF8_SPANISH_CI,
    CHARSET_UTF8_SWEDISH_CI,
    CHARSET_UTF8_TURKISH_CI,
    CHARSET_UTF8_CZECH_CI,
    CHARSET_UTF8_DANISH_CI,
    CHARSET_UTF8_LITHUANIAN_CI,
    CHARSET_UTF8_SLOVAK_CI,
    CHARSET_UTF8_SPANISH2_CI,
    CHARSET_UTF8_ROMAN_CI,
    CHARSET_UTF8_PERSIAN_CI,
    CHARSET_UTF8_ESPERANTO_CI,
    CHARSET_UTF8_HUNGARIAN_CI,
    CHARSET_UTF8_SINHALA_CI,
    CHARSET_UTF8_GERMAN2_CI,
    CHARSET_UTF8_CROATIAN_MYSQL561_CI,
    CHARSET_UTF8_UNICODE_520_CI,
    CHARSET_UTF8_VIETNAMESE_CI,
    CHARSET_UTF8_GENERAL_MYSQL500_CI,
    CHARSET_UTF8MB4_UNICODE_CI,
    CHARSET_UTF8MB4_ICELANDIC_CI,
    CHARSET_UTF8MB4_LATVIAN_CI,
    CHARSET_UTF8MB4_ROMANIAN_CI,
    CHARSET_UTF8MB4_SLOVENIAN_CI,
    CHARSET_UTF8MB4_POLISH_CI,
    CHARSET_UTF8MB4_ESTONIAN_CI,
    CHARSET_UTF8MB4_SPANISH_CI,
    CHARSET_UTF8MB4_SWEDISH_CI,
    CHARSET_UTF8MB4_TURKISH_CI,
    CHARSET_UTF8MB4_CZECH_CI,
    CHARSET_UTF8MB4_DANISH_CI,
    CHARSET_UTF8MB4_LITHUANIAN_CI,
    CHARSET_UTF8MB4_SLOVAK_CI,
    CHARSET_UTF8MB4_SPANISH2_CI,
    CHARSET_UTF8MB4_ROMAN_CI,
    CHARSET_UTF8MB4_PERSIAN_CI,
    CHARSET_UTF8MB4_ESPERANTO_CI,
    CHARSET_UTF8MB4_HUNGARIAN_CI,
    CHARSET_UTF8MB4_SINHALA_CI,
    CHARSET_UTF8MB4_GERMAN2_CI,
    CHARSET_UTF8MB4_CROATIAN_MYSQL561_CI,
    CHARSET_UTF8MB4_UNICODE_520_CI,
    CHARSET_UTF8MB4_VIETNAMESE_CI,
    CHARSET_UTF8_GENERAL50_CI

