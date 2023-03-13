class DropdownValues {
  static List<String> getDataKota() {
    List<String> kota;

    String dataMentah = "KABUPATEN SIMEULUE\n" +
        "KABUPATEN ACEH SINGKIL\n" +
        "KABUPATEN ACEH SELATAN\n" +
        "KABUPATEN ACEH TENGGARA\n" +
        "KABUPATEN ACEH TIMUR\n" +
        "KABUPATEN ACEH TENGAH\n" +
        "KABUPATEN ACEH BARAT\n" +
        "KABUPATEN ACEH BESAR\n" +
        "KABUPATEN PIDIE\n" +
        "KABUPATEN BIREUEN\n" +
        "KABUPATEN ACEH UTARA\n" +
        "KABUPATEN ACEH BARAT DAYA\n" +
        "KABUPATEN GAYO LUES\n" +
        "KABUPATEN ACEH TAMIANG\n" +
        "KABUPATEN NAGAN RAYA\n" +
        "KABUPATEN ACEH JAYA\n" +
        "KABUPATEN BENER MERIAH\n" +
        "KABUPATEN PIDIE JAYA\n" +
        "KOTA BANDA ACEH\n" +
        "KOTA SABANG\n" +
        "KOTA LANGSA\n" +
        "KOTA LHOKSEUMAWE\n" +
        "KOTA SUBULUSSALAM\n" +
        "KABUPATEN NIAS\n" +
        "KABUPATEN MANDAILING NATAL\n" +
        "KABUPATEN TAPANULI SELATAN\n" +
        "KABUPATEN TAPANULI TENGAH\n" +
        "KABUPATEN TAPANULI UTARA\n" +
        "KABUPATEN TOBA SAMOSIR\n" +
        "KABUPATEN LABUHAN BATU\n" +
        "KABUPATEN ASAHAN\n" +
        "KABUPATEN SIMALUNGUN\n" +
        "KABUPATEN DAIRI\n" +
        "KABUPATEN KARO\n" +
        "KABUPATEN DELI SERDANG\n" +
        "KABUPATEN LANGKAT\n" +
        "KABUPATEN NIAS SELATAN\n" +
        "KABUPATEN HUMBANG HASUNDUTAN\n" +
        "KABUPATEN PAKPAK BHARAT\n" +
        "KABUPATEN SAMOSIR\n" +
        "KABUPATEN SERDANG BEDAGAI\n" +
        "KABUPATEN BATU BARA\n" +
        "KABUPATEN PADANG LAWAS UTARA\n" +
        "KABUPATEN PADANG LAWAS\n" +
        "KABUPATEN LABUHAN BATU SELATAN\n" +
        "KABUPATEN LABUHAN BATU UTARA\n" +
        "KABUPATEN NIAS UTARA\n" +
        "KABUPATEN NIAS BARAT\n" +
        "KOTA SIBOLGA\n" +
        "KOTA TANJUNG BALAI\n" +
        "KOTA PEMATANG SIANTAR\n" +
        "KOTA TEBING TINGGI\n" +
        "KOTA MEDAN\n" +
        "KOTA BINJAI\n" +
        "KOTA PADANGSIDIMPUAN\n" +
        "KOTA GUNUNGSITOLI\n" +
        "KABUPATEN KEPULAUAN MENTAWAI\n" +
        "KABUPATEN PESISIR SELATAN\n" +
        "KABUPATEN SOLOK\n" +
        "KABUPATEN SIJUNJUNG\n" +
        "KABUPATEN TANAH DATAR\n" +
        "KABUPATEN PADANG PARIAMAN\n" +
        "KABUPATEN AGAM\n" +
        "KABUPATEN LIMA PULUH KOTA\n" +
        "KABUPATEN PASAMAN\n" +
        "KABUPATEN SOLOK SELATAN\n" +
        "KABUPATEN DHARMASRAYA\n" +
        "KABUPATEN PASAMAN BARAT\n" +
        "KOTA PADANG\n" +
        "KOTA SOLOK\n" +
        "KOTA SAWAH LUNTO\n" +
        "KOTA PADANG PANJANG\n" +
        "KOTA BUKITTINGGI\n" +
        "KOTA PAYAKUMBUH\n" +
        "KOTA PARIAMAN\n" +
        "KABUPATEN KUANTAN SINGINGI\n" +
        "KABUPATEN INDRAGIRI HULU\n" +
        "KABUPATEN INDRAGIRI HILIR\n" +
        "KABUPATEN PELALAWAN\n" +
        "KABUPATEN S I A K\n" +
        "KABUPATEN KAMPAR\n" +
        "KABUPATEN ROKAN HULU\n" +
        "KABUPATEN BENGKALIS\n" +
        "KABUPATEN ROKAN HILIR\n" +
        "KABUPATEN KEPULAUAN MERANTI\n" +
        "KOTA PEKANBARU\n" +
        "KOTA D U M A I\n" +
        "KABUPATEN KERINCI\n" +
        "KABUPATEN MERANGIN\n" +
        "KABUPATEN SAROLANGUN\n" +
        "KABUPATEN BATANG HARI\n" +
        "KABUPATEN MUARO JAMBI\n" +
        "KABUPATEN TANJUNG JABUNG TIMUR\n" +
        "KABUPATEN TANJUNG JABUNG BARAT\n" +
        "KABUPATEN TEBO\n" +
        "KABUPATEN BUNGO\n" +
        "KOTA JAMBI\n" +
        "KOTA SUNGAI PENUH\n" +
        "KABUPATEN OGAN KOMERING ULU\n" +
        "KABUPATEN OGAN KOMERING ILIR\n" +
        "KABUPATEN MUARA ENIM\n" +
        "KABUPATEN LAHAT\n" +
        "KABUPATEN MUSI RAWAS\n" +
        "KABUPATEN MUSI BANYUASIN\n" +
        "KABUPATEN BANYU ASIN\n" +
        "KABUPATEN OGAN KOMERING ULU SELATAN\n" +
        "KABUPATEN OGAN KOMERING ULU TIMUR\n" +
        "KABUPATEN OGAN ILIR\n" +
        "KABUPATEN EMPAT LAWANG\n" +
        "KABUPATEN PENUKAL ABAB LEMATANG ILIR\n" +
        "KABUPATEN MUSI RAWAS UTARA\n" +
        "KOTA PALEMBANG\n" +
        "KOTA PRABUMULIH\n" +
        "KOTA PAGAR ALAM\n" +
        "KOTA LUBUKLINGGAU\n" +
        "KABUPATEN BENGKULU SELATAN\n" +
        "KABUPATEN REJANG LEBONG\n" +
        "KABUPATEN BENGKULU UTARA\n" +
        "KABUPATEN KAUR\n" +
        "KABUPATEN SELUMA\n" +
        "KABUPATEN MUKOMUKO\n" +
        "KABUPATEN LEBONG\n" +
        "KABUPATEN KEPAHIANG\n" +
        "KABUPATEN BENGKULU TENGAH\n" +
        "KOTA BENGKULU\n" +
        "KABUPATEN LAMPUNG BARAT\n" +
        "KABUPATEN TANGGAMUS\n" +
        "KABUPATEN LAMPUNG SELATAN\n" +
        "KABUPATEN LAMPUNG TIMUR\n" +
        "KABUPATEN LAMPUNG TENGAH\n" +
        "KABUPATEN LAMPUNG UTARA\n" +
        "KABUPATEN WAY KANAN\n" +
        "KABUPATEN TULANGBAWANG\n" +
        "KABUPATEN PESAWARAN\n" +
        "KABUPATEN PRINGSEWU\n" +
        "KABUPATEN MESUJI\n" +
        "KABUPATEN TULANG BAWANG BARAT\n" +
        "KABUPATEN PESISIR BARAT\n" +
        "KOTA BANDAR LAMPUNG\n" +
        "KOTA METRO\n" +
        "KABUPATEN BANGKA\n" +
        "KABUPATEN BELITUNG\n" +
        "KABUPATEN BANGKA BARAT\n" +
        "KABUPATEN BANGKA TENGAH\n" +
        "KABUPATEN BANGKA SELATAN\n" +
        "KABUPATEN BELITUNG TIMUR\n" +
        "KOTA PANGKAL PINANG\n" +
        "KABUPATEN KARIMUN\n" +
        "KABUPATEN BINTAN\n" +
        "KABUPATEN NATUNA\n" +
        "KABUPATEN LINGGA\n" +
        "KABUPATEN KEPULAUAN ANAMBAS\n" +
        "KOTA B A T A M\n" +
        "KOTA TANJUNG PINANG\n" +
        "KABUPATEN KEPULAUAN SERIBU\n" +
        "KOTA JAKARTA SELATAN\n" +
        "KOTA JAKARTA TIMUR\n" +
        "KOTA JAKARTA PUSAT\n" +
        "KOTA JAKARTA BARAT\n" +
        "KOTA JAKARTA UTARA\n" +
        "KABUPATEN BOGOR\n" +
        "KABUPATEN SUKABUMI\n" +
        "KABUPATEN CIANJUR\n" +
        "KABUPATEN BANDUNG\n" +
        "KABUPATEN GARUT\n" +
        "KABUPATEN TASIKMALAYA\n" +
        "KABUPATEN CIAMIS\n" +
        "KABUPATEN KUNINGAN\n" +
        "KABUPATEN CIREBON\n" +
        "KABUPATEN MAJALENGKA\n" +
        "KABUPATEN SUMEDANG\n" +
        "KABUPATEN INDRAMAYU\n" +
        "KABUPATEN SUBANG\n" +
        "KABUPATEN PURWAKARTA\n" +
        "KABUPATEN KARAWANG\n" +
        "KABUPATEN BEKASI\n" +
        "KABUPATEN BANDUNG BARAT\n" +
        "KABUPATEN PANGANDARAN\n" +
        "KOTA BOGOR\n" +
        "KOTA SUKABUMI\n" +
        "KOTA BANDUNG\n" +
        "KOTA CIREBON\n" +
        "KOTA BEKASI\n" +
        "KOTA DEPOK\n" +
        "KOTA CIMAHI\n" +
        "KOTA TASIKMALAYA\n" +
        "KOTA BANJAR\n" +
        "KABUPATEN CILACAP\n" +
        "KABUPATEN BANYUMAS\n" +
        "KABUPATEN PURBALINGGA\n" +
        "KABUPATEN BANJARNEGARA\n" +
        "KABUPATEN KEBUMEN\n" +
        "KABUPATEN PURWOREJO\n" +
        "KABUPATEN WONOSOBO\n" +
        "KABUPATEN MAGELANG\n" +
        "KABUPATEN BOYOLALI\n" +
        "KABUPATEN KLATEN\n" +
        "KABUPATEN SUKOHARJO\n" +
        "KABUPATEN WONOGIRI\n" +
        "KABUPATEN KARANGANYAR\n" +
        "KABUPATEN SRAGEN\n" +
        "KABUPATEN GROBOGAN\n" +
        "KABUPATEN BLORA\n" +
        "KABUPATEN REMBANG\n" +
        "KABUPATEN PATI\n" +
        "KABUPATEN KUDUS\n" +
        "KABUPATEN JEPARA\n" +
        "KABUPATEN DEMAK\n" +
        "KABUPATEN SEMARANG\n" +
        "KABUPATEN TEMANGGUNG\n" +
        "KABUPATEN KENDAL\n" +
        "KABUPATEN BATANG\n" +
        "KABUPATEN PEKALONGAN\n" +
        "KABUPATEN PEMALANG\n" +
        "KABUPATEN TEGAL\n" +
        "KABUPATEN BREBES\n" +
        "KOTA MAGELANG\n" +
        "KOTA SURAKARTA\n" +
        "KOTA SALATIGA\n" +
        "KOTA SEMARANG\n" +
        "KOTA PEKALONGAN\n" +
        "KOTA TEGAL\n" +
        "KABUPATEN KULON PROGO\n" +
        "KABUPATEN BANTUL\n" +
        "KABUPATEN GUNUNG KIDUL\n" +
        "KABUPATEN SLEMAN\n" +
        "KOTA YOGYAKARTA\n" +
        "KABUPATEN PACITAN\n" +
        "KABUPATEN PONOROGO\n" +
        "KABUPATEN TRENGGALEK\n" +
        "KABUPATEN TULUNGAGUNG\n" +
        "KABUPATEN BLITAR\n" +
        "KABUPATEN KEDIRI\n" +
        "KABUPATEN MALANG\n" +
        "KABUPATEN LUMAJANG\n" +
        "KABUPATEN JEMBER\n" +
        "KABUPATEN BANYUWANGI\n" +
        "KABUPATEN BONDOWOSO\n" +
        "KABUPATEN SITUBONDO\n" +
        "KABUPATEN PROBOLINGGO\n" +
        "KABUPATEN PASURUAN\n" +
        "KABUPATEN SIDOARJO\n" +
        "KABUPATEN MOJOKERTO\n" +
        "KABUPATEN JOMBANG\n" +
        "KABUPATEN NGANJUK\n" +
        "KABUPATEN MADIUN\n" +
        "KABUPATEN MAGETAN\n" +
        "KABUPATEN NGAWI\n" +
        "KABUPATEN BOJONEGORO\n" +
        "KABUPATEN TUBAN\n" +
        "KABUPATEN LAMONGAN\n" +
        "KABUPATEN GRESIK\n" +
        "KABUPATEN BANGKALAN\n" +
        "KABUPATEN SAMPANG\n" +
        "KABUPATEN PAMEKASAN\n" +
        "KABUPATEN SUMENEP\n" +
        "KOTA KEDIRI\n" +
        "KOTA BLITAR\n" +
        "KOTA MALANG\n" +
        "KOTA PROBOLINGGO\n" +
        "KOTA PASURUAN\n" +
        "KOTA MOJOKERTO\n" +
        "KOTA MADIUN\n" +
        "KOTA SURABAYA\n" +
        "KOTA BATU\n" +
        "KABUPATEN PANDEGLANG\n" +
        "KABUPATEN LEBAK\n" +
        "KABUPATEN TANGERANG\n" +
        "KABUPATEN SERANG\n" +
        "KOTA TANGERANG\n" +
        "KOTA CILEGON\n" +
        "KOTA SERANG\n" +
        "KOTA TANGERANG SELATAN\n" +
        "KABUPATEN JEMBRANA\n" +
        "KABUPATEN TABANAN\n" +
        "KABUPATEN BADUNG\n" +
        "KABUPATEN GIANYAR\n" +
        "KABUPATEN KLUNGKUNG\n" +
        "KABUPATEN BANGLI\n" +
        "KABUPATEN KARANG ASEM\n" +
        "KABUPATEN BULELENG\n" +
        "KOTA DENPASAR\n" +
        "KABUPATEN LOMBOK BARAT\n" +
        "KABUPATEN LOMBOK TENGAH\n" +
        "KABUPATEN LOMBOK TIMUR\n" +
        "KABUPATEN SUMBAWA\n" +
        "KABUPATEN DOMPU\n" +
        "KABUPATEN BIMA\n" +
        "KABUPATEN SUMBAWA BARAT\n" +
        "KABUPATEN LOMBOK UTARA\n" +
        "KOTA MATARAM\n" +
        "KOTA BIMA\n" +
        "KABUPATEN SUMBA BARAT\n" +
        "KABUPATEN SUMBA TIMUR\n" +
        "KABUPATEN KUPANG\n" +
        "KABUPATEN TIMOR TENGAH SELATAN\n" +
        "KABUPATEN TIMOR TENGAH UTARA\n" +
        "KABUPATEN BELU\n" +
        "KABUPATEN ALOR\n" +
        "KABUPATEN LEMBATA\n" +
        "KABUPATEN FLORES TIMUR\n" +
        "KABUPATEN SIKKA\n" +
        "KABUPATEN ENDE\n" +
        "KABUPATEN NGADA\n" +
        "KABUPATEN MANGGARAI\n" +
        "KABUPATEN ROTE NDAO\n" +
        "KABUPATEN MANGGARAI BARAT\n" +
        "KABUPATEN SUMBA TENGAH\n" +
        "KABUPATEN SUMBA BARAT DAYA\n" +
        "KABUPATEN NAGEKEO\n" +
        "KABUPATEN MANGGARAI TIMUR\n" +
        "KABUPATEN SABU RAIJUA\n" +
        "KABUPATEN MALAKA\n" +
        "KOTA KUPANG\n" +
        "KABUPATEN SAMBAS\n" +
        "KABUPATEN BENGKAYANG\n" +
        "KABUPATEN LANDAK\n" +
        "KABUPATEN MEMPAWAH\n" +
        "KABUPATEN SANGGAU\n" +
        "KABUPATEN KETAPANG\n" +
        "KABUPATEN SINTANG\n" +
        "KABUPATEN KAPUAS HULU\n" +
        "KABUPATEN SEKADAU\n" +
        "KABUPATEN MELAWI\n" +
        "KABUPATEN KAYONG UTARA\n" +
        "KABUPATEN KUBU RAYA\n" +
        "KOTA PONTIANAK\n" +
        "KOTA SINGKAWANG\n" +
        "KABUPATEN KOTAWARINGIN BARAT\n" +
        "KABUPATEN KOTAWARINGIN TIMUR\n" +
        "KABUPATEN KAPUAS\n" +
        "KABUPATEN BARITO SELATAN\n" +
        "KABUPATEN BARITO UTARA\n" +
        "KABUPATEN SUKAMARA\n" +
        "KABUPATEN LAMANDAU\n" +
        "KABUPATEN SERUYAN\n" +
        "KABUPATEN KATINGAN\n" +
        "KABUPATEN PULANG PISAU\n" +
        "KABUPATEN GUNUNG MAS\n" +
        "KABUPATEN BARITO TIMUR\n" +
        "KABUPATEN MURUNG RAYA\n" +
        "KOTA PALANGKA RAYA\n" +
        "KABUPATEN TANAH LAUT\n" +
        "KABUPATEN KOTA BARU\n" +
        "KABUPATEN BANJAR\n" +
        "KABUPATEN BARITO KUALA\n" +
        "KABUPATEN TAPIN\n" +
        "KABUPATEN HULU SUNGAI SELATAN\n" +
        "KABUPATEN HULU SUNGAI TENGAH\n" +
        "KABUPATEN HULU SUNGAI UTARA\n" +
        "KABUPATEN TABALONG\n" +
        "KABUPATEN TANAH BUMBU\n" +
        "KABUPATEN BALANGAN\n" +
        "KOTA BANJARMASIN\n" +
        "KOTA BANJAR BARU\n" +
        "KABUPATEN PASER\n" +
        "KABUPATEN KUTAI BARAT\n" +
        "KABUPATEN KUTAI KARTANEGARA\n" +
        "KABUPATEN KUTAI TIMUR\n" +
        "KABUPATEN BERAU\n" +
        "KABUPATEN PENAJAM PASER UTARA\n" +
        "KABUPATEN MAHAKAM HULU\n" +
        "KOTA BALIKPAPAN\n" +
        "KOTA SAMARINDA\n" +
        "KOTA BONTANG\n" +
        "KABUPATEN MALINAU\n" +
        "KABUPATEN BULUNGAN\n" +
        "KABUPATEN TANA TIDUNG\n" +
        "KABUPATEN NUNUKAN\n" +
        "KOTA TARAKAN\n" +
        "KABUPATEN BOLAANG MONGONDOW\n" +
        "KABUPATEN MINAHASA\n" +
        "KABUPATEN KEPULAUAN SANGIHE\n" +
        "KABUPATEN KEPULAUAN TALAUD\n" +
        "KABUPATEN MINAHASA SELATAN\n" +
        "KABUPATEN MINAHASA UTARA\n" +
        "KABUPATEN BOLAANG MONGONDOW UTARA\n" +
        "KABUPATEN SIAU TAGULANDANG BIARO\n" +
        "KABUPATEN MINAHASA TENGGARA\n" +
        "KABUPATEN BOLAANG MONGONDOW SELATAN\n" +
        "KABUPATEN BOLAANG MONGONDOW TIMUR\n" +
        "KOTA MANADO\n" +
        "KOTA BITUNG\n" +
        "KOTA TOMOHON\n" +
        "KOTA KOTAMOBAGU\n" +
        "KABUPATEN BANGGAI KEPULAUAN\n" +
        "KABUPATEN BANGGAI\n" +
        "KABUPATEN MOROWALI\n" +
        "KABUPATEN POSO\n" +
        "KABUPATEN DONGGALA\n" +
        "KABUPATEN TOLI-TOLI\n" +
        "KABUPATEN BUOL\n" +
        "KABUPATEN PARIGI MOUTONG\n" +
        "KABUPATEN TOJO UNA-UNA\n" +
        "KABUPATEN SIGI\n" +
        "KABUPATEN BANGGAI LAUT\n" +
        "KABUPATEN MOROWALI UTARA\n" +
        "KOTA PALU\n" +
        "KABUPATEN KEPULAUAN SELAYAR\n" +
        "KABUPATEN BULUKUMBA\n" +
        "KABUPATEN BANTAENG\n" +
        "KABUPATEN JENEPONTO\n" +
        "KABUPATEN TAKALAR\n" +
        "KABUPATEN GOWA\n" +
        "KABUPATEN SINJAI\n" +
        "KABUPATEN MAROS\n" +
        "KABUPATEN PANGKAJENE DAN KEPULAUAN\n" +
        "KABUPATEN BARRU\n" +
        "KABUPATEN BONE\n" +
        "KABUPATEN SOPPENG\n" +
        "KABUPATEN WAJO\n" +
        "KABUPATEN SIDENRENG RAPPANG\n" +
        "KABUPATEN PINRANG\n" +
        "KABUPATEN ENREKANG\n" +
        "KABUPATEN LUWU\n" +
        "KABUPATEN TANA TORAJA\n" +
        "KABUPATEN LUWU UTARA\n" +
        "KABUPATEN LUWU TIMUR\n" +
        "KABUPATEN TORAJA UTARA\n" +
        "KOTA MAKASSAR\n" +
        "KOTA PAREPARE\n" +
        "KOTA PALOPO\n" +
        "KABUPATEN BUTON\n" +
        "KABUPATEN MUNA\n" +
        "KABUPATEN KONAWE\n" +
        "KABUPATEN KOLAKA\n" +
        "KABUPATEN KONAWE SELATAN\n" +
        "KABUPATEN BOMBANA\n" +
        "KABUPATEN WAKATOBI\n" +
        "KABUPATEN KOLAKA UTARA\n" +
        "KABUPATEN BUTON UTARA\n" +
        "KABUPATEN KONAWE UTARA\n" +
        "KABUPATEN KOLAKA TIMUR\n" +
        "KABUPATEN KONAWE KEPULAUAN\n" +
        "KABUPATEN MUNA BARAT\n" +
        "KABUPATEN BUTON TENGAH\n" +
        "KABUPATEN BUTON SELATAN\n" +
        "KOTA KENDARI\n" +
        "KOTA BAUBAU\n" +
        "KABUPATEN BOALEMO\n" +
        "KABUPATEN GORONTALO\n" +
        "KABUPATEN POHUWATO\n" +
        "KABUPATEN BONE BOLANGO\n" +
        "KABUPATEN GORONTALO UTARA\n" +
        "KOTA GORONTALO\n" +
        "KABUPATEN MAJENE\n" +
        "KABUPATEN POLEWALI MANDAR\n" +
        "KABUPATEN MAMASA\n" +
        "KABUPATEN MAMUJU\n" +
        "KABUPATEN MAMUJU UTARA\n" +
        "KABUPATEN MAMUJU TENGAH\n" +
        "KABUPATEN MALUKU TENGGARA BARAT\n" +
        "KABUPATEN MALUKU TENGGARA\n" +
        "KABUPATEN MALUKU TENGAH\n" +
        "KABUPATEN BURU\n" +
        "KABUPATEN KEPULAUAN ARU\n" +
        "KABUPATEN SERAM BAGIAN BARAT\n" +
        "KABUPATEN SERAM BAGIAN TIMUR\n" +
        "KABUPATEN MALUKU BARAT DAYA\n" +
        "KABUPATEN BURU SELATAN\n" +
        "KOTA AMBON\n" +
        "KOTA TUAL\n" +
        "KABUPATEN HALMAHERA BARAT\n" +
        "KABUPATEN HALMAHERA TENGAH\n" +
        "KABUPATEN KEPULAUAN SULA\n" +
        "KABUPATEN HALMAHERA SELATAN\n" +
        "KABUPATEN HALMAHERA UTARA\n" +
        "KABUPATEN HALMAHERA TIMUR\n" +
        "KABUPATEN PULAU MOROTAI\n" +
        "KABUPATEN PULAU TALIABU\n" +
        "KOTA TERNATE\n" +
        "KOTA TIDORE KEPULAUAN\n" +
        "KABUPATEN FAKFAK\n" +
        "KABUPATEN KAIMANA\n" +
        "KABUPATEN TELUK WONDAMA\n" +
        "KABUPATEN TELUK BINTUNI\n" +
        "KABUPATEN MANOKWARI\n" +
        "KABUPATEN SORONG SELATAN\n" +
        "KABUPATEN SORONG\n" +
        "KABUPATEN RAJA AMPAT\n" +
        "KABUPATEN TAMBRAUW\n" +
        "KABUPATEN MAYBRAT\n" +
        "KABUPATEN MANOKWARI SELATAN\n" +
        "KABUPATEN PEGUNUNGAN ARFAK\n" +
        "KOTA SORONG\n" +
        "KABUPATEN MERAUKE\n" +
        "KABUPATEN JAYAWIJAYA\n" +
        "KABUPATEN JAYAPURA\n" +
        "KABUPATEN NABIRE\n" +
        "KABUPATEN KEPULAUAN YAPEN\n" +
        "KABUPATEN BIAK NUMFOR\n" +
        "KABUPATEN PANIAI\n" +
        "KABUPATEN PUNCAK JAYA\n" +
        "KABUPATEN MIMIKA\n" +
        "KABUPATEN BOVEN DIGOEL\n" +
        "KABUPATEN MAPPI\n" +
        "KABUPATEN ASMAT\n" +
        "KABUPATEN YAHUKIMO\n" +
        "KABUPATEN PEGUNUNGAN BINTANG\n" +
        "KABUPATEN TOLIKARA\n" +
        "KABUPATEN SARMI\n" +
        "KABUPATEN KEEROM\n" +
        "KABUPATEN WAROPEN\n" +
        "KABUPATEN SUPIORI\n" +
        "KABUPATEN MAMBERAMO RAYA\n" +
        "KABUPATEN NDUGA\n" +
        "KABUPATEN LANNY JAYA\n" +
        "KABUPATEN MAMBERAMO TENGAH\n" +
        "KABUPATEN YALIMO\n" +
        "KABUPATEN PUNCAK\n" +
        "KABUPATEN DOGIYAI\n" +
        "KABUPATEN INTAN JAYA\n" +
        "KABUPATEN DEIYAI\n" +
        "KOTA JAYAPURA";

    kota = dataMentah.split("\n");

    return kota;
  }

  static List<String> getDataKamar() {
    List<String> kamar = [];

    kamar.add("Tahfidh");
    kamar.add("Pandai");
    kamar.add("Terpuji");
    kamar.add("Cerdas");
    kamar.add("Penyayang");
    kamar.add("Kaya");
    kamar.add("Perkasa");
    kamar.add("Pelindung");
    kamar.add("Pemberi");
    kamar.add("Beriman");
    kamar.add("Bijaksana");

    kamar.add("201");
    kamar.add("202");
    kamar.add("203");
    kamar.add("204");
    kamar.add("205");
    kamar.add("206");
    kamar.add("207");
    kamar.add("208");
    kamar.add("209");
    kamar.add("210");
    kamar.add("211");
    kamar.add("212");
    kamar.add("213");

    kamar.add("301");
    kamar.add("302");
    kamar.add("303");
    kamar.add("304");
    kamar.add("305");
    kamar.add("306");
    kamar.add("307");
    kamar.add("308");
    kamar.add("309");

    kamar.sort();

    return kamar;
  }

  static List<String> getUnitPendidikan() {
    List<String> unitPendidikan = [];

    unitPendidikan.add("MIN 4 Jombang");
    unitPendidikan.add("MTs Plus DU");
    unitPendidikan.add("MTsN 2 Jombang");
    unitPendidikan.add("SMP DU 1");
    unitPendidikan.add("SMPN 3 Peterongan");
    unitPendidikan.add("MA Unggulan");
    unitPendidikan.add("MAN 2 Jombang");
    unitPendidikan.add("SMA DU 1");
    unitPendidikan.add("SMA DU 2");
    unitPendidikan.add("SMA DU 3");
    unitPendidikan.add("SMK DU 1");
    unitPendidikan.add("SMK Telkom");

    return unitPendidikan;
  }

  static List<String> getKelasMengaji() {
    List<String> kelasMengaji = [];

    kelasMengaji.add("VII A");
    kelasMengaji.add("VII B");
    kelasMengaji.add("VII C");
    kelasMengaji.add("VII Setoran");

    kelasMengaji.add("VIII A");
    kelasMengaji.add("VIII B");
    kelasMengaji.add("VIII C");
    kelasMengaji.add("VIII Setoran");

    kelasMengaji.add("X A");
    kelasMengaji.add("X B");
    kelasMengaji.add("X C");
    kelasMengaji.add("X Setoran");

    kelasMengaji.add("XI A");
    kelasMengaji.add("XI B");
    kelasMengaji.add("XI C");
    kelasMengaji.add("XI Setoran");

    return kelasMengaji;
  }
}
