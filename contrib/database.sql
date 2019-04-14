DROP TABLE IF EXISTS `bom`;
CREATE TABLE `bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `revision` int(11) NOT NULL,
  `csv` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `shortname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value1` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value2` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value3` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

INSERT INTO `categories` VALUES("1", "0", "Passives", "Passive components", "", "", "", "Passive components like resistors, capacitors, thermistors, potentiometers etc.");
INSERT INTO `categories` VALUES("2", "0", "Discretes", "Discrete components", "", "", "", "Discrete components like diodes, transistors, thyristors...");
INSERT INTO `categories` VALUES("3", "0", "ICs", "Integrated Circuits", "", "", "", "Integrated Circuits like microcontrolers, memories, logic, amplifiers etc.");
INSERT INTO `categories` VALUES("4", "0", "Connectors", "Connectors and sockets", "Pins", "Rows", "Current", "Connectors, sockets, card holders etc.");
INSERT INTO `categories` VALUES("5", "0", "Switches", "Switches", "", "", "", "Switches including DIP switches, power switches etc.");
INSERT INTO `categories` VALUES("6", "0", "Magnetics", "Magnetic components", "", "", "", "Transformers, coils, ferrite cores, relays");
INSERT INTO `categories` VALUES("7", "0", "Wires and cables", "Wires and cables", "", "", "", "Wires and cables for data, audio, video, RF.");
INSERT INTO `categories` VALUES("8", "0", "Mechanical", "Mechanical components", "", "", "", "Mechanical components like bolts, nuts, spacers, holders, isolators.");
INSERT INTO `categories` VALUES("9", "0", "Other", "Other componets", "", "", "", "Other componets like batteries, fans etc.");
INSERT INTO `categories` VALUES("20", "1", "Resistors", "Resistors", "", "", "", "Resistors fixed and variable");
INSERT INTO `categories` VALUES("21", "20", "Fixed", "Fixed resistors", "Value [Ohm]", "Tolerance [%]", "Power [W]", "Fixed resistors");
INSERT INTO `categories` VALUES("22", "20", "Variable", "Variable resistors", "", "", "", "Variable resistors like trimmers and potentiometers");
INSERT INTO `categories` VALUES("30", "1", "Capacitors", "Capacitors", "", "", "", "Capacitors");
INSERT INTO `categories` VALUES("31", "30", "Ceramic", "Ceramic capacitors", "Value [F]", "Tolerance [%]", "Voltage [V]", "Ceramic capacitors");
INSERT INTO `categories` VALUES("32", "30", "Electrolytic", "Electrolytic capacitors", "Voltage [V]", "Temperature [T]", "ESR [mohm]", "Electrolytic capacitors offer very high capacitance but suffer from poor tolerances, high instability, gradual loss of capacitance especially when subjected to heat, and high leakage current.");
INSERT INTO `categories` VALUES("34", "30", "Tantalum", "Tantalum capacitors", "", "", "", "Tantalum capacitors");
INSERT INTO `categories` VALUES("36", "1", "Inductors", "Inductors", "Current [A]", "Tol [%]", "Q", "Inductors");
INSERT INTO `categories` VALUES("37", "2", "Transistors", "Transistors", "", "", "", "All transistors including MOSFETs, JFETs, bipolar etc.");
INSERT INTO `categories` VALUES("38", "37", "Bipolar", "Bipolar transistors", "", "", "", "Bipolar transistors");
INSERT INTO `categories` VALUES("39", "38", "NPN", "Bipolar NPN transistors", "Power [W]", "Voltage [V]", "Current [A]", "Bipolar NPN transistors");
INSERT INTO `categories` VALUES("40", "38", "PNP", "Bipolar PNP transistors", "Power [W]", "Voltage [V]", "Current [A]", "Bipolar PNP transistors");
INSERT INTO `categories` VALUES("41", "38", "Complementary", "Bipolar complementary transistors", "", "", "", "Bipolar complementary transistors");
INSERT INTO `categories` VALUES("42", "38", "Darlington", "Darlington bipolar transistors", "", "", "", "Darlington bipolar transistors");
INSERT INTO `categories` VALUES("43", "37", "Unipolar", "Unipolar transistors", "", "", "", "Unipolar transistors - MOSFET, JFET etc.");
INSERT INTO `categories` VALUES("44", "43", "N-channel", "N-channel MOSFET transistors", "Power [W]", "Voltage [V]", "Current [A]", "N-channel MOSFET transistors");
INSERT INTO `categories` VALUES("45", "43", "P-channel", "P-channel MOSFET transistors", "", "", "", "P-channel MOSFET transistors");
INSERT INTO `categories` VALUES("46", "43", "Multi-channel", "Multi-channel MOSFET transistors", "", "", "", "Multi-channel MOSFET transistors");
INSERT INTO `categories` VALUES("50", "2", "Diodes", "All diodes", "", "", "", "All diodes including Shottky, Zener etc.");
INSERT INTO `categories` VALUES("51", "50", "Universal", "Universal diodes", "Power [W]", "Voltage [V]", "Current [A]", "Universal diodes with PN junction");
INSERT INTO `categories` VALUES("52", "50", "Shottky", "Shottky diodes", "Power [W]", "Voltage [V]", "Current [A]", "Shottky diodes");
INSERT INTO `categories` VALUES("53", "50", "Zener", "Zener diodes", "Power [W}", "Voltage [V]", "Current [A]", "Zener diodes");
INSERT INTO `categories` VALUES("54", "50", "Transil", "Transil diodes", "Clamping voltage [V]", "Peak power 8/20us [W]", "Peak current 8/20us [A]", "Transil diodes");
INSERT INTO `categories` VALUES("55", "3", "Microcontrollers", "Microcontrollers", "Pins", "Frequency", "Max voltage", "Microcontrollers");
INSERT INTO `categories` VALUES("56", "3", "AD convertors", "AD convertors", "Channels", "Bits", "Max. voltage [V]", "AD convertors");
INSERT INTO `categories` VALUES("57", "3", "DA convertors", "DA convertors", "Channels", "Bits", "Max. voltage [V]", "DA convertors");
INSERT INTO `categories` VALUES("58", "3", "Peripherals", "Microcontroller peripherals", "Channels", "", "", "Microcontroller peripherals");
INSERT INTO `categories` VALUES("59", "3", "Analog", "Analog", "Power", "Voltage", "", "Analog amplifiers, multiplexers and switches, comparators");
INSERT INTO `categories` VALUES("60", "4", "Headers", "Header connectors", "Pins", "Rows", "Pitch [mm]", "Header connectors");
INSERT INTO `categories` VALUES("61", "50", "LED", "LED diodes", "Wavelength [nm]", "Current [A]", "Luminous intensity [mcd]", "LED diodes");
INSERT INTO `categories` VALUES("62", "4", "Sockets", "Socket connectors", "Pins", "Rows", "Pitch [mm]", "Socket connectors");
INSERT INTO `categories` VALUES("63", "0", "Power", "Power components", "", "", "", "Power components");
INSERT INTO `categories` VALUES("64", "63", "Power sources", "Power sources", "Power [W]", "Output voltage [V]", "Input voltage [V]", "Power sources");
INSERT INTO `categories` VALUES("65", "3", "DC-DC Convertors", "DC-DC Convertors", "Input voltage [V]", "Output voltage [V]", "Output current [A]", "DC-DC Convertors");
INSERT INTO `categories` VALUES("66", "3", "Supervisors", "Supervisor circuits", "Channels", "Voltage", "Outputs", "Supervisor circuits");
INSERT INTO `categories` VALUES("68", "50", "Pin", "Pin Diode", "Voltage [V]", "Current [A]", "Capacitance [pF]", "VHF to UHF Band RF Attenuator Applications. Band Switching");
INSERT INTO `categories` VALUES("69", "3", "EEPROM", "EEPROM memory", "Capacity [bytes]", "Voltage [V]", "Current [A]", "Serial electrically erasable and programmable read only memory");
INSERT INTO `categories` VALUES("70", "3", "Flash", "Flash Memory", "Capacity [Mbytes]", "Voltage [V]", "Pines", "SERIAL FLASH MEMORY WITH
DUAL/QUAD SPI");
INSERT INTO `categories` VALUES("71", "3", "Logic", "Logic Circuits", "Voltage [V]", "Speed [MHz]", "Pines", "CMOS or TTL Logic Circuits. Generic Circuits");
INSERT INTO `categories` VALUES("73", "3", "Regulators", "LDO and Bipolar Regulators", "Power [W]", "Voltage [V]", "Current [A]", "LDO and Conventional Voltage Regulators");


DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `bom` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `partnumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `supplier` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;

INSERT INTO `flow` VALUES("127", "471", "50", "0", "0.0298", "EUR", "", "6", "Aliexpress", "2019-03-07 14:18:45");
INSERT INTO `flow` VALUES("129", "469", "50", "0", "0.0394", "eur", "", "0", "Aliexpress", "2019-03-12 14:20:08");
INSERT INTO `flow` VALUES("131", "467", "100", "0", "0.0072", "EUR", "", "6", "Aliexpress", "2019-03-07 14:21:17");
INSERT INTO `flow` VALUES("134", "468", "100", "0", "0.0108", "EUR", "", "6", "Aliexpress", "2019-03-07 14:22:29");
INSERT INTO `flow` VALUES("135", "472", "50", "0", "0.0304", "EUR", "", "6", "Aliexpress", "2019-03-07 14:29:32");
INSERT INTO `flow` VALUES("136", "473", "100", "0", "0.0072", "EUR", "", "6", "Aliexpress", "2019-03-07 14:32:17");
INSERT INTO `flow` VALUES("137", "474", "50", "0", "0.0574", "EUR", "", "6", "Aliexpress", "2019-03-07 14:35:39");
INSERT INTO `flow` VALUES("138", "480", "9", "0", "0.27", "EUR", "", "0", "prue", "2019-04-12 13:25:07");
INSERT INTO `flow` VALUES("139", "481", "10", "0", "0.023", "EUR", "", "0", "Aliexpress", "2019-04-12 13:31:41");
INSERT INTO `flow` VALUES("140", "482", "49", "0", "0.34", "EUR", "", "0", "Aliexpress", "2019-04-12 13:37:27");
INSERT INTO `flow` VALUES("141", "483", "100", "0", "0.03", "EUR", "", "0", "Aliexpress", "2019-04-12 13:40:07");
INSERT INTO `flow` VALUES("142", "484", "10", "0", "0.34", "EUR", "", "0", "", "2019-04-12 13:41:55");
INSERT INTO `flow` VALUES("143", "485", "11", "0", "1.32", "EUR", "", "0", "", "2019-04-12 13:43:52");
INSERT INTO `flow` VALUES("144", "486", "10", "0", "0.22", "EUR", "", "0", "Aliexpress", "2019-04-13 18:35:27");
INSERT INTO `flow` VALUES("145", "487", "10", "0", "0.34", "EUR", "", "0", "Aliexpress", "2019-04-13 18:37:49");
INSERT INTO `flow` VALUES("146", "488", "10", "0", "0.261", "EUR", "", "0", "Mouser 863-1SMA5.0AT3G", "2019-04-13 18:44:16");
INSERT INTO `flow` VALUES("147", "489", "15", "0", "0.3", "EUR", "", "4", "UTSOURCE order UT6EJHXJ4152", "2016-01-28 18:50:04");
INSERT INTO `flow` VALUES("148", "490", "20", "0", "0.097", "EUR", "", "0", "Ebay order to crodan85@aol.com", "2019-04-13 18:58:11");
INSERT INTO `flow` VALUES("149", "491", "4", "0", "0.85", "EUR", "", "0", "Aliexpress Gotone IC Store", "2019-04-13 19:02:44");
INSERT INTO `flow` VALUES("150", "492", "10", "0", "0.3", "EUR", "", "0", "", "2019-04-13 19:05:17");
INSERT INTO `flow` VALUES("151", "493", "5", "0", "1.16", "EUR", "", "0", "Aliexpress CHIPLIJIAYUE Official Store", "2019-04-13 19:12:40");
INSERT INTO `flow` VALUES("152", "494", "8", "0", "0.5", "EUR", "", "0", "Aliexpress BXV computer chipset Store", "2019-04-13 19:17:15");
INSERT INTO `flow` VALUES("153", "495", "10", "0", "0.044", "EUR", "", "0", "Ebay thaishopetc", "2019-04-13 19:20:27");
INSERT INTO `flow` VALUES("154", "496", "100", "0", "0.057", "EUR", "", "0", "Pedido Mouser 40719578", "2019-04-13 19:23:56");
INSERT INTO `flow` VALUES("155", "497", "10", "0", "0.5", "EUR", "", "4", "UTSOURCE", "2019-04-13 19:26:24");
INSERT INTO `flow` VALUES("156", "498", "11", "0", "0.5", "EUR", "", "0", "", "2019-04-13 19:28:27");
INSERT INTO `flow` VALUES("157", "499", "6", "0", "1.0", "EUR", "", "0", "", "2019-04-13 19:32:32");
INSERT INTO `flow` VALUES("158", "500", "25", "0", "0.056", "EUR", "", "0", "Ebay alw099@hotmail.com", "2019-04-13 19:35:58");
INSERT INTO `flow` VALUES("159", "501", "100", "0", "0.07", "EUR", "40719578", "5", "Pedido Mouser 40719578", "2019-04-13 19:38:17");
INSERT INTO `flow` VALUES("160", "502", "2", "0", "1.0", "EUR", "", "0", "", "2019-04-13 19:40:12");
INSERT INTO `flow` VALUES("161", "503", "2", "0", "1.0", "EUR", "", "0", "", "2019-04-13 19:42:14");
INSERT INTO `flow` VALUES("162", "504", "25", "0", "0.457", "EUR", "40719578", "5", "Pedido Mouser 40719578", "2016-04-25 19:44:45");
INSERT INTO `flow` VALUES("163", "505", "5", "0", "1.65", "EUR", "", "0", "Ebay huayi-components", "2019-04-13 19:48:38");
INSERT INTO `flow` VALUES("164", "506", "10", "0", "0.36", "EUR", "", "0", "Pedido Mouser", "2019-04-13 19:53:46");
INSERT INTO `flow` VALUES("165", "507", "20", "0", "0.0525", "EUR", "", "0", "Aliexpress YUXINYUAN Official Store", "2019-04-13 20:02:46");
INSERT INTO `flow` VALUES("166", "508", "10", "0", "0.353", "EUR", "", "0", "Pedido Mouser 37169124", "2019-04-13 20:05:16");
INSERT INTO `flow` VALUES("167", "509", "5", "0", "0.923", "EUR", "", "0", "Pedido Mouser 37169124", "2019-04-13 20:07:22");
INSERT INTO `flow` VALUES("168", "510", "20", "0", "0.095", "EUR", "", "0", "Ebay Tangyuanjiao", "2019-04-13 20:13:29");


DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `partname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `partlabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `component` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `footprint` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value1` float DEFAULT NULL,
  `value2` float DEFAULT NULL,
  `value3` float DEFAULT NULL,
  `rohs` tinyint(1) NOT NULL,
  `smd` tinyint(1) NOT NULL,
  `generic` tinyint(1) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datasheet` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;

INSERT INTO `parts` VALUES("1", "21", "0 FDF", "0 FDF", "R", "smd_passive:RESC1608X45N", "0.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("2", "21", "1 FDF", "1 FDF", "R", "smd_passive:RESC1608X45N", "1.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("3", "21", "1.1 FDF", "1.1 FDF", "R", "smd_passive:RESC1608X45N", "1.1", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("4", "21", "1.2 FDF", "1.2 FDF", "R", "smd_passive:RESC1608X45N", "1.2", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("5", "21", "1.3 FDF", "1.3 FDF", "R", "smd_passive:RESC1608X45N", "1.3", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("6", "21", "1.5 FDF", "1.5 FDF", "R", "smd_passive:RESC1608X45N", "1.5", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("7", "21", "1.6 FDF", "1.6 FDF", "R", "smd_passive:RESC1608X45N", "1.6", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("8", "21", "1.8 FDF", "1.8 FDF", "R", "smd_passive:RESC1608X45N", "1.8", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("9", "21", "2 FDF", "2 FDF", "R", "smd_passive:RESC1608X45N", "2.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("10", "21", "2.2 FDF", "2.2 FDF", "R", "smd_passive:RESC1608X45N", "2.2", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("11", "21", "2.4 FDF", "2.4 FDF", "R", "smd_passive:RESC1608X45N", "2.4", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("12", "21", "2.7 FDF", "2.7 FDF", "R", "smd_passive:RESC1608X45N", "2.7", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("13", "21", "3 FDF", "3 FDF", "R", "smd_passive:RESC1608X45N", "3.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("14", "21", "3.3 FDF", "3.3 FDF", "R", "smd_passive:RESC1608X45N", "3.3", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("15", "21", "3.6 FDF", "3.6 FDF", "R", "smd_passive:RESC1608X45N", "3.6", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("16", "21", "3.9 FDF", "3.9 FDF", "R", "smd_passive:RESC1608X45N", "3.9", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("17", "21", "4.3 FDF", "4.3 FDF", "R", "smd_passive:RESC1608X45N", "4.3", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("18", "21", "4.7 FDF", "4.7 FDF", "R", "smd_passive:RESC1608X45N", "4.7", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("19", "21", "5.1 FDF", "5.1 FDF", "R", "smd_passive:RESC1608X45N", "5.1", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("20", "21", "5.6 FDF", "5.6 FDF", "R", "smd_passive:RESC1608X45N", "5.6", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("21", "21", "6.2 FDF", "6.2 FDF", "R", "smd_passive:RESC1608X45N", "6.2", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("22", "21", "6.8 FDF", "6.8 FDF", "R", "smd_passive:RESC1608X45N", "6.8", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("23", "21", "7.5 FDF", "7.5 FDF", "R", "smd_passive:RESC1608X45N", "7.5", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("24", "21", "8.2 FDF", "8.2 FDF", "R", "smd_passive:RESC1608X45N", "8.2", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("25", "21", "9.1 FDF", "9.1 FDF", "R", "smd_passive:RESC1608X45N", "9.1", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("26", "21", "10 FDF", "10 FDF", "R", "smd_passive:RESC1608X45N", "10.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("27", "21", "11 FDF", "11 FDF", "R", "smd_passive:RESC1608X45N", "11.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("28", "21", "12 FDF", "12 FDF", "R", "smd_passive:RESC1608X45N", "12.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("29", "21", "13 FDF", "13 FDF", "R", "smd_passive:RESC1608X45N", "13.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("30", "21", "15 FDF", "15 FDF", "R", "smd_passive:RESC1608X45N", "15.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("31", "21", "16 FDF", "16 FDF", "R", "smd_passive:RESC1608X45N", "16.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("32", "21", "18 FDF", "18 FDF", "R", "smd_passive:RESC1608X45N", "18.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("33", "21", "20 FDF", "20 FDF", "R", "smd_passive:RESC1608X45N", "20.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("34", "21", "22 FDF", "22 FDF", "R", "smd_passive:RESC1608X45N", "22.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("35", "21", "24 FDF", "24 FDF", "R", "smd_passive:RESC1608X45N", "24.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("36", "21", "27 FDF", "27 FDF", "R", "smd_passive:RESC1608X45N", "27.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("37", "21", "30 FDF", "30 FDF", "R", "smd_passive:RESC1608X45N", "30.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("38", "21", "33 FDF", "33 FDF", "R", "smd_passive:RESC1608X45N", "33.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("39", "21", "36 FDF", "36 FDF", "R", "smd_passive:RESC1608X45N", "36.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("40", "21", "39 FDF", "39 FDF", "R", "smd_passive:RESC1608X45N", "39.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("41", "21", "43 FDF", "43 FDF", "R", "smd_passive:RESC1608X45N", "43.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("42", "21", "47 FDF", "47 FDF", "R", "smd_passive:RESC1608X45N", "47.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("43", "21", "51 FDF", "51 FDF", "R", "smd_passive:RESC1608X45N", "51.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("44", "21", "56 FDF", "56 FDF", "R", "smd_passive:RESC1608X45N", "56.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("45", "21", "62 FDF", "62 FDF", "R", "smd_passive:RESC1608X45N", "62.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("46", "21", "68 FDF", "68 FDF", "R", "smd_passive:RESC1608X45N", "68.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("47", "21", "75 FDF", "75 FDF", "R", "smd_passive:RESC1608X45N", "75.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("48", "21", "82 FDF", "82 FDF", "R", "smd_passive:RESC1608X45N", "82.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("49", "21", "91 FDF", "91 FDF", "R", "smd_passive:RESC1608X45N", "91.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("50", "21", "100 FDF", "100 FDF", "R", "smd_passive:RESC1608X45N", "100.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("51", "21", "110 FDF", "110 FDF", "R", "smd_passive:RESC1608X45N", "110.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("52", "21", "120 FDF", "120 FDF", "R", "smd_passive:RESC1608X45N", "120.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("53", "21", "130 FDF", "130 FDF", "R", "smd_passive:RESC1608X45N", "130.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("54", "21", "150 FDF", "150 FDF", "R", "smd_passive:RESC1608X45N", "150.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("55", "21", "160 FDF", "160 FDF", "R", "smd_passive:RESC1608X45N", "160.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("56", "21", "180 FDF", "180 FDF", "R", "smd_passive:RESC1608X45N", "180.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("57", "21", "200 FDF", "200 FDF", "R", "smd_passive:RESC1608X45N", "200.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("58", "21", "220 FDF", "220 FDF", "R", "smd_passive:RESC1608X45N", "220.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("59", "21", "240 FDF", "240 FDF", "R", "smd_passive:RESC1608X45N", "240.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("60", "21", "270 FDF", "270 FDF", "R", "smd_passive:RESC1608X45N", "270.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("61", "21", "300 FDF", "300 FDF", "R", "smd_passive:RESC1608X45N", "300.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("62", "21", "330 FDF", "330 FDF", "R", "smd_passive:RESC1608X45N", "330.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("63", "21", "360 FDF", "360 FDF", "R", "smd_passive:RESC1608X45N", "360.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("64", "21", "390 FDF", "390 FDF", "R", "smd_passive:RESC1608X45N", "390.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("65", "21", "430 FDF", "430 FDF", "R", "smd_passive:RESC1608X45N", "430.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("66", "21", "470 FDF", "470 FDF", "R", "smd_passive:RESC1608X45N", "470.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("67", "21", "510 FDF", "510 FDF", "R", "smd_passive:RESC1608X45N", "510.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("68", "21", "560 FDF", "560 FDF", "R", "smd_passive:RESC1608X45N", "560.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("69", "21", "620 FDF", "620 FDF", "R", "smd_passive:RESC1608X45N", "620.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("70", "21", "680 FDF", "680 FDF", "R", "smd_passive:RESC1608X45N", "680.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("71", "21", "750 FDF", "750 FDF", "R", "smd_passive:RESC1608X45N", "750.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("72", "21", "820 FDF", "820 FDF", "R", "smd_passive:RESC1608X45N", "820.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("73", "21", "910 FDF", "910 FDF", "R", "smd_passive:RESC1608X45N", "910.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("74", "21", "1k FDF", "1k FDF", "R", "smd_passive:RESC1608X45N", "1000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("75", "21", "1.1k FDF", "1.1k FDF", "R", "smd_passive:RESC1608X45N", "1100.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("76", "21", "1.2k FDF", "1.2k FDF", "R", "smd_passive:RESC1608X45N", "1200.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("77", "21", "1.3k FDF", "1.3k FDF", "R", "smd_passive:RESC1608X45N", "1300.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("78", "21", "1.5k FDF", "1.5k FDF", "R", "smd_passive:RESC1608X45N", "1500.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("79", "21", "1.6k FDF", "1.6k FDF", "R", "smd_passive:RESC1608X45N", "1600.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("80", "21", "1.8k FDF", "1.8k FDF", "R", "smd_passive:RESC1608X45N", "1800.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("81", "21", "2k FDF", "2k FDF", "R", "smd_passive:RESC1608X45N", "2000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("82", "21", "2.2k FDF", "2.2k FDF", "R", "smd_passive:RESC1608X45N", "2200.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("83", "21", "2.4k FDF", "2.4k FDF", "R", "smd_passive:RESC1608X45N", "2400.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("84", "21", "2.7k FDF", "2.7k FDF", "R", "smd_passive:RESC1608X45N", "2700.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("85", "21", "3k FDF", "3k FDF", "R", "smd_passive:RESC1608X45N", "3000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("86", "21", "3.3k FDF", "3.3k FDF", "R", "smd_passive:RESC1608X45N", "3300.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("87", "21", "3.6k FDF", "3.6k FDF", "R", "smd_passive:RESC1608X45N", "3600.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("88", "21", "3.9k FDF", "3.9k FDF", "R", "smd_passive:RESC1608X45N", "3900.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("89", "21", "4.3k FDF", "4.3k FDF", "R", "smd_passive:RESC1608X45N", "4300.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("90", "21", "4.7k FDF", "4.7k FDF", "R", "smd_passive:RESC1608X45N", "4700.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("91", "21", "5.1k FDF", "5.1k FDF", "R", "smd_passive:RESC1608X45N", "5100.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("92", "21", "5.6k FDF", "5.6k FDF", "R", "smd_passive:RESC1608X45N", "5600.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("93", "21", "6.2k FDF", "6.2k FDF", "R", "smd_passive:RESC1608X45N", "6200.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("94", "21", "6.8k FDF", "6.8k FDF", "R", "smd_passive:RESC1608X45N", "6800.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("95", "21", "7.5k FDF", "7.5k FDF", "R", "smd_passive:RESC1608X45N", "7500.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("96", "21", "8.2k FDF", "8.2k FDF", "R", "smd_passive:RESC1608X45N", "8200.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("97", "21", "9.1k FDF", "9.1k FDF", "R", "smd_passive:RESC1608X45N", "9100.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("98", "21", "10k FDF", "10k FDF", "R", "smd_passive:RESC1608X45N", "10000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("99", "21", "11k FDF", "11k FDF", "R", "smd_passive:RESC1608X45N", "11000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("100", "21", "12k FDF", "12k FDF", "R", "smd_passive:RESC1608X45N", "12000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("101", "21", "13k FDF", "13k FDF", "R", "smd_passive:RESC1608X45N", "13000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("102", "21", "15k FDF", "15k FDF", "R", "smd_passive:RESC1608X45N", "15000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("103", "21", "16k FDF", "16k FDF", "R", "smd_passive:RESC1608X45N", "16000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("104", "21", "18k FDF", "18k FDF", "R", "smd_passive:RESC1608X45N", "18000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("105", "21", "20k FDF", "20k FDF", "R", "smd_passive:RESC1608X45N", "20000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("106", "21", "22k FDF", "22k FDF", "R", "smd_passive:RESC1608X45N", "22000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("107", "21", "24k FDF", "24k FDF", "R", "smd_passive:RESC1608X45N", "24000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("108", "21", "27k FDF", "27k FDF", "R", "smd_passive:RESC1608X45N", "27000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("109", "21", "30k FDF", "30k FDF", "R", "smd_passive:RESC1608X45N", "30000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("110", "21", "33k FDF", "33k FDF", "R", "smd_passive:RESC1608X45N", "33000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("111", "21", "36k FDF", "36k FDF", "R", "smd_passive:RESC1608X45N", "36000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("112", "21", "39k FDF", "39k FDF", "R", "smd_passive:RESC1608X45N", "39000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("113", "21", "43k FDF", "43k FDF", "R", "smd_passive:RESC1608X45N", "43000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("114", "21", "47k FDF", "47k FDF", "R", "smd_passive:RESC1608X45N", "47000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("115", "21", "51k FDF", "51k FDF", "R", "smd_passive:RESC1608X45N", "51000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("116", "21", "56k FDF", "56k FDF", "R", "smd_passive:RESC1608X45N", "56000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("117", "21", "62k FDF", "62k FDF", "R", "smd_passive:RESC1608X45N", "62000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("118", "21", "68k FDF", "68k FDF", "R", "smd_passive:RESC1608X45N", "68000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("119", "21", "75k FDF", "75k FDF", "R", "smd_passive:RESC1608X45N", "75000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("120", "21", "82k FDF", "82k FDF", "R", "smd_passive:RESC1608X45N", "82000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("121", "21", "91k FDF", "91k FDF", "R", "smd_passive:RESC1608X45N", "91000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("122", "21", "100k FDF", "100k FDF", "R", "smd_passive:RESC1608X45N", "100000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("123", "21", "110k FDF", "110k FDF", "R", "smd_passive:RESC1608X45N", "110000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("124", "21", "120k FDF", "120k FDF", "R", "smd_passive:RESC1608X45N", "120000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("125", "21", "130k FDF", "130k FDF", "R", "smd_passive:RESC1608X45N", "130000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("126", "21", "150k FDF", "150k FDF", "R", "smd_passive:RESC1608X45N", "150000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("127", "21", "160k FDF", "160k FDF", "R", "smd_passive:RESC1608X45N", "160000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("128", "21", "180k FDF", "180k FDF", "R", "smd_passive:RESC1608X45N", "180000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("129", "21", "200k FDF", "200k FDF", "R", "smd_passive:RESC1608X45N", "200000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("130", "21", "220k FDF", "220k FDF", "R", "smd_passive:RESC1608X45N", "220000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("131", "21", "240k FDF", "240k FDF", "R", "smd_passive:RESC1608X45N", "240000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("132", "21", "270k FDF", "270k FDF", "R", "smd_passive:RESC1608X45N", "270000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("133", "21", "300k FDF", "300k FDF", "R", "smd_passive:RESC1608X45N", "300000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("134", "21", "330k FDF", "330k FDF", "R", "smd_passive:RESC1608X45N", "330000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("135", "21", "360k FDF", "360k FDF", "R", "smd_passive:RESC1608X45N", "360000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("136", "21", "390k FDF", "390k FDF", "R", "smd_passive:RESC1608X45N", "390000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("137", "21", "430k FDF", "430k FDF", "R", "smd_passive:RESC1608X45N", "430000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("138", "21", "470k FDF", "470k FDF", "R", "smd_passive:RESC1608X45N", "470000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("139", "21", "510k FDF", "510k FDF", "R", "smd_passive:RESC1608X45N", "510000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("140", "21", "560k FDF", "560k FDF", "R", "smd_passive:RESC1608X45N", "560000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("141", "21", "620k FDF", "620k FDF", "R", "smd_passive:RESC1608X45N", "620000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("142", "21", "680k FDF", "680k FDF", "R", "smd_passive:RESC1608X45N", "680000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("143", "21", "750k FDF", "750k FDF", "R", "smd_passive:RESC1608X45N", "750000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("144", "21", "820k FDF", "820k FDF", "R", "smd_passive:RESC1608X45N", "820000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("145", "21", "910k FDF", "910k FDF", "R", "smd_passive:RESC1608X45N", "910000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("146", "21", "1M FDF", "1M FDF", "R", "smd_passive:RESC1608X45N", "1000000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("147", "21", "1.1M FDF", "1.1M FDF", "R", "smd_passive:RESC1608X45N", "1100000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("148", "21", "1.2M FDF", "1.2M FDF", "R", "smd_passive:RESC1608X45N", "1200000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("149", "21", "1.3M FDF", "1.3M FDF", "R", "smd_passive:RESC1608X45N", "1300000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("150", "21", "1.5M FDF", "1.5M FDF", "R", "smd_passive:RESC1608X45N", "1500000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("151", "21", "1.6M FDF", "1.6M FDF", "R", "smd_passive:RESC1608X45N", "1600000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("152", "21", "1.8M FDF", "1.8M FDF", "R", "smd_passive:RESC1608X45N", "1800000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("153", "21", "2M FDF", "2M FDF", "R", "smd_passive:RESC1608X45N", "2000000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("154", "21", "2.2M FDF", "2.2M FDF", "R", "smd_passive:RESC1608X45N", "2200000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("155", "21", "2.4M FDF", "2.4M FDF", "R", "smd_passive:RESC1608X45N", "2400000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("156", "21", "2.7M FDF", "2.7M FDF", "R", "smd_passive:RESC1608X45N", "2700000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("157", "21", "3M FDF", "3M FDF", "R", "smd_passive:RESC1608X45N", "3000000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("158", "21", "3.3M FDF", "3.3M FDF", "R", "smd_passive:RESC1608X45N", "3300000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("159", "21", "3.6M FDF", "3.6M FDF", "R", "smd_passive:RESC1608X45N", "3600000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("160", "21", "3.9M FDF", "3.9M FDF", "R", "smd_passive:RESC1608X45N", "3900000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("161", "21", "4.3M FDF", "4.3M FDF", "R", "smd_passive:RESC1608X45N", "4300000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("162", "21", "4.7M FDF", "4.7M FDF", "R", "smd_passive:RESC1608X45N", "4700000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("163", "21", "5.1M FDF", "5.1M FDF", "R", "smd_passive:RESC1608X45N", "5100000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("164", "21", "5.6M FDF", "5.6M FDF", "R", "smd_passive:RESC1608X45N", "5600000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("165", "21", "6.2M FDF", "6.2M FDF", "R", "smd_passive:RESC1608X45N", "6200000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("166", "21", "6.8M FDF", "6.8M FDF", "R", "smd_passive:RESC1608X45N", "6800000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("167", "21", "7.5M FDF", "7.5M FDF", "R", "smd_passive:RESC1608X45N", "7500000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("168", "21", "8.2M FDF", "8.2M FDF", "R", "smd_passive:RESC1608X45N", "8200000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("169", "21", "9.1M FDF", "9.1M FDF", "R", "smd_passive:RESC1608X45N", "9100000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("170", "21", "10M FDF", "10M FDF", "R", "smd_passive:RESC1608X45N", "10000000.0", "1.0", "0.1", "1", "1", "1", "2", "Thick film resistor; SMD; 0603; 100mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("171", "21", "0 FEF", "0 FEF", "R", "smd_passive:RESC2012X45N", "0.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("172", "21", "1 FEF", "1 FEF", "R", "smd_passive:RESC2012X45N", "1.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("173", "21", "1.1 FEF", "1.1 FEF", "R", "smd_passive:RESC2012X45N", "1.1", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("174", "21", "1.2 FEF", "1.2 FEF", "R", "smd_passive:RESC2012X45N", "1.2", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("175", "21", "1.3 FEF", "1.3 FEF", "R", "smd_passive:RESC2012X45N", "1.3", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("176", "21", "1.5 FEF", "1.5 FEF", "R", "smd_passive:RESC2012X45N", "1.5", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("177", "21", "1.6 FEF", "1.6 FEF", "R", "smd_passive:RESC2012X45N", "1.6", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("178", "21", "1.8 FEF", "1.8 FEF", "R", "smd_passive:RESC2012X45N", "1.8", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("179", "21", "2 FEF", "2 FEF", "R", "smd_passive:RESC2012X45N", "2.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("180", "21", "2.2 FEF", "2.2 FEF", "R", "smd_passive:RESC2012X45N", "2.2", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("181", "21", "2.4 FEF", "2.4 FEF", "R", "smd_passive:RESC2012X45N", "2.4", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("182", "21", "2.7 FEF", "2.7 FEF", "R", "smd_passive:RESC2012X45N", "2.7", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("183", "21", "3 FEF", "3 FEF", "R", "smd_passive:RESC2012X45N", "3.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("184", "21", "3.3 FEF", "3.3 FEF", "R", "smd_passive:RESC2012X45N", "3.3", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("185", "21", "3.6 FEF", "3.6 FEF", "R", "smd_passive:RESC2012X45N", "3.6", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("186", "21", "3.9 FEF", "3.9 FEF", "R", "smd_passive:RESC2012X45N", "3.9", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("187", "21", "4.3 FEF", "4.3 FEF", "R", "smd_passive:RESC2012X45N", "4.3", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("188", "21", "4.7 FEF", "4.7 FEF", "R", "smd_passive:RESC2012X45N", "4.7", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("189", "21", "5.1 FEF", "5.1 FEF", "R", "smd_passive:RESC2012X45N", "5.1", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("190", "21", "5.6 FEF", "5.6 FEF", "R", "smd_passive:RESC2012X45N", "5.6", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("191", "21", "6.2 FEF", "6.2 FEF", "R", "smd_passive:RESC2012X45N", "6.2", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("192", "21", "6.8 FEF", "6.8 FEF", "R", "smd_passive:RESC2012X45N", "6.8", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("193", "21", "7.5 FEF", "7.5 FEF", "R", "smd_passive:RESC2012X45N", "7.5", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("194", "21", "8.2 FEF", "8.2 FEF", "R", "smd_passive:RESC2012X45N", "8.2", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("195", "21", "9.1 FEF", "9.1 FEF", "R", "smd_passive:RESC2012X45N", "9.1", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("196", "21", "10 FEF", "10 FEF", "R", "smd_passive:RESC2012X45N", "10.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("197", "21", "11 FEF", "11 FEF", "R", "smd_passive:RESC2012X45N", "11.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("198", "21", "12 FEF", "12 FEF", "R", "smd_passive:RESC2012X45N", "12.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("199", "21", "13 FEF", "13 FEF", "R", "smd_passive:RESC2012X45N", "13.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("200", "21", "15 FEF", "15 FEF", "R", "smd_passive:RESC2012X45N", "15.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("201", "21", "16 FEF", "16 FEF", "R", "smd_passive:RESC2012X45N", "16.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("202", "21", "18 FEF", "18 FEF", "R", "smd_passive:RESC2012X45N", "18.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("203", "21", "20 FEF", "20 FEF", "R", "smd_passive:RESC2012X45N", "20.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("204", "21", "22 FEF", "22 FEF", "R", "smd_passive:RESC2012X45N", "22.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("205", "21", "24 FEF", "24 FEF", "R", "smd_passive:RESC2012X45N", "24.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("206", "21", "27 FEF", "27 FEF", "R", "smd_passive:RESC2012X45N", "27.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("207", "21", "30 FEF", "30 FEF", "R", "smd_passive:RESC2012X45N", "30.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("208", "21", "33 FEF", "33 FEF", "R", "smd_passive:RESC2012X45N", "33.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("209", "21", "36 FEF", "36 FEF", "R", "smd_passive:RESC2012X45N", "36.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("210", "21", "39 FEF", "39 FEF", "R", "smd_passive:RESC2012X45N", "39.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("211", "21", "43 FEF", "43 FEF", "R", "smd_passive:RESC2012X45N", "43.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("212", "21", "47 FEF", "47 FEF", "R", "smd_passive:RESC2012X45N", "47.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("213", "21", "51 FEF", "51 FEF", "R", "smd_passive:RESC2012X45N", "51.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("214", "21", "56 FEF", "56 FEF", "R", "smd_passive:RESC2012X45N", "56.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("215", "21", "62 FEF", "62 FEF", "R", "smd_passive:RESC2012X45N", "62.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("216", "21", "68 FEF", "68 FEF", "R", "smd_passive:RESC2012X45N", "68.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("217", "21", "75 FEF", "75 FEF", "R", "smd_passive:RESC2012X45N", "75.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("218", "21", "82 FEF", "82 FEF", "R", "smd_passive:RESC2012X45N", "82.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("219", "21", "91 FEF", "91 FEF", "R", "smd_passive:RESC2012X45N", "91.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("220", "21", "100 FEF", "100 FEF", "R", "smd_passive:RESC2012X45N", "100.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("221", "21", "110 FEF", "110 FEF", "R", "smd_passive:RESC2012X45N", "110.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("222", "21", "120 FEF", "120 FEF", "R", "smd_passive:RESC2012X45N", "120.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("223", "21", "130 FEF", "130 FEF", "R", "smd_passive:RESC2012X45N", "130.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("224", "21", "150 FEF", "150 FEF", "R", "smd_passive:RESC2012X45N", "150.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("225", "21", "160 FEF", "160 FEF", "R", "smd_passive:RESC2012X45N", "160.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("226", "21", "180 FEF", "180 FEF", "R", "smd_passive:RESC2012X45N", "180.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("227", "21", "200 FEF", "200 FEF", "R", "smd_passive:RESC2012X45N", "200.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("228", "21", "220 FEF", "220 FEF", "R", "smd_passive:RESC2012X45N", "220.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("229", "21", "240 FEF", "240 FEF", "R", "smd_passive:RESC2012X45N", "240.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("230", "21", "270 FEF", "270 FEF", "R", "smd_passive:RESC2012X45N", "270.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("231", "21", "300 FEF", "300 FEF", "R", "smd_passive:RESC2012X45N", "300.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("232", "21", "330 FEF", "330 FEF", "R", "smd_passive:RESC2012X45N", "330.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("233", "21", "360 FEF", "360 FEF", "R", "smd_passive:RESC2012X45N", "360.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("234", "21", "390 FEF", "390 FEF", "R", "smd_passive:RESC2012X45N", "390.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("235", "21", "430 FEF", "430 FEF", "R", "smd_passive:RESC2012X45N", "430.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("236", "21", "470 FEF", "470 FEF", "R", "smd_passive:RESC2012X45N", "470.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("237", "21", "510 FEF", "510 FEF", "R", "smd_passive:RESC2012X45N", "510.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("238", "21", "560 FEF", "560 FEF", "R", "smd_passive:RESC2012X45N", "560.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("239", "21", "620 FEF", "620 FEF", "R", "smd_passive:RESC2012X45N", "620.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("240", "21", "680 FEF", "680 FEF", "R", "smd_passive:RESC2012X45N", "680.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("241", "21", "750 FEF", "750 FEF", "R", "smd_passive:RESC2012X45N", "750.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("242", "21", "820 FEF", "820 FEF", "R", "smd_passive:RESC2012X45N", "820.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("243", "21", "910 FEF", "910 FEF", "R", "smd_passive:RESC2012X45N", "910.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("244", "21", "1k FEF", "1k FEF", "R", "smd_passive:RESC2012X45N", "1000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("245", "21", "1.1k FEF", "1.1k FEF", "R", "smd_passive:RESC2012X45N", "1100.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("246", "21", "1.2k FEF", "1.2k FEF", "R", "smd_passive:RESC2012X45N", "1200.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("247", "21", "1.3k FEF", "1.3k FEF", "R", "smd_passive:RESC2012X45N", "1300.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("248", "21", "1.5k FEF", "1.5k FEF", "R", "smd_passive:RESC2012X45N", "1500.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("249", "21", "1.6k FEF", "1.6k FEF", "R", "smd_passive:RESC2012X45N", "1600.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("250", "21", "1.8k FEF", "1.8k FEF", "R", "smd_passive:RESC2012X45N", "1800.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("251", "21", "2k FEF", "2k FEF", "R", "smd_passive:RESC2012X45N", "2000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("252", "21", "2.2k FEF", "2.2k FEF", "R", "smd_passive:RESC2012X45N", "2200.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("253", "21", "2.4k FEF", "2.4k FEF", "R", "smd_passive:RESC2012X45N", "2400.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("254", "21", "2.7k FEF", "2.7k FEF", "R", "smd_passive:RESC2012X45N", "2700.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("255", "21", "3k FEF", "3k FEF", "R", "smd_passive:RESC2012X45N", "3000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("256", "21", "3.3k FEF", "3.3k FEF", "R", "smd_passive:RESC2012X45N", "3300.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("257", "21", "3.6k FEF", "3.6k FEF", "R", "smd_passive:RESC2012X45N", "3600.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("258", "21", "3.9k FEF", "3.9k FEF", "R", "smd_passive:RESC2012X45N", "3900.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("259", "21", "4.3k FEF", "4.3k FEF", "R", "smd_passive:RESC2012X45N", "4300.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("260", "21", "4.7k FEF", "4.7k FEF", "R", "smd_passive:RESC2012X45N", "4700.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("261", "21", "5.1k FEF", "5.1k FEF", "R", "smd_passive:RESC2012X45N", "5100.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("262", "21", "5.6k FEF", "5.6k FEF", "R", "smd_passive:RESC2012X45N", "5600.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("263", "21", "6.2k FEF", "6.2k FEF", "R", "smd_passive:RESC2012X45N", "6200.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("264", "21", "6.8k FEF", "6.8k FEF", "R", "smd_passive:RESC2012X45N", "6800.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("265", "21", "7.5k FEF", "7.5k FEF", "R", "smd_passive:RESC2012X45N", "7500.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("266", "21", "8.2k FEF", "8.2k FEF", "R", "smd_passive:RESC2012X45N", "8200.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("267", "21", "9.1k FEF", "9.1k FEF", "R", "smd_passive:RESC2012X45N", "9100.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("268", "21", "10k FEF", "10k FEF", "R", "smd_passive:RESC2012X45N", "10000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("269", "21", "11k FEF", "11k FEF", "R", "smd_passive:RESC2012X45N", "11000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("270", "21", "12k FEF", "12k FEF", "R", "smd_passive:RESC2012X45N", "12000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("271", "21", "13k FEF", "13k FEF", "R", "smd_passive:RESC2012X45N", "13000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("272", "21", "15k FEF", "15k FEF", "R", "smd_passive:RESC2012X45N", "15000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("273", "21", "16k FEF", "16k FEF", "R", "smd_passive:RESC2012X45N", "16000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("274", "21", "18k FEF", "18k FEF", "R", "smd_passive:RESC2012X45N", "18000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("275", "21", "20k FEF", "20k FEF", "R", "smd_passive:RESC2012X45N", "20000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("276", "21", "22k FEF", "22k FEF", "R", "smd_passive:RESC2012X45N", "22000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("277", "21", "24k FEF", "24k FEF", "R", "smd_passive:RESC2012X45N", "24000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("278", "21", "27k FEF", "27k FEF", "R", "smd_passive:RESC2012X45N", "27000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("279", "21", "30k FEF", "30k FEF", "R", "smd_passive:RESC2012X45N", "30000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("280", "21", "33k FEF", "33k FEF", "R", "smd_passive:RESC2012X45N", "33000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("281", "21", "36k FEF", "36k FEF", "R", "smd_passive:RESC2012X45N", "36000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("282", "21", "39k FEF", "39k FEF", "R", "smd_passive:RESC2012X45N", "39000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("283", "21", "43k FEF", "43k FEF", "R", "smd_passive:RESC2012X45N", "43000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("284", "21", "47k FEF", "47k FEF", "R", "smd_passive:RESC2012X45N", "47000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("285", "21", "51k FEF", "51k FEF", "R", "smd_passive:RESC2012X45N", "51000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("286", "21", "56k FEF", "56k FEF", "R", "smd_passive:RESC2012X45N", "56000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("287", "21", "62k FEF", "62k FEF", "R", "smd_passive:RESC2012X45N", "62000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("288", "21", "68k FEF", "68k FEF", "R", "smd_passive:RESC2012X45N", "68000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("289", "21", "75k FEF", "75k FEF", "R", "smd_passive:RESC2012X45N", "75000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("290", "21", "82k FEF", "82k FEF", "R", "smd_passive:RESC2012X45N", "82000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("291", "21", "91k FEF", "91k FEF", "R", "smd_passive:RESC2012X45N", "91000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("292", "21", "100k FEF", "100k FEF", "R", "smd_passive:RESC2012X45N", "100000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("293", "21", "110k FEF", "110k FEF", "R", "smd_passive:RESC2012X45N", "110000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("294", "21", "120k FEF", "120k FEF", "R", "smd_passive:RESC2012X45N", "120000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("295", "21", "130k FEF", "130k FEF", "R", "smd_passive:RESC2012X45N", "130000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("296", "21", "150k FEF", "150k FEF", "R", "smd_passive:RESC2012X45N", "150000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("297", "21", "160k FEF", "160k FEF", "R", "smd_passive:RESC2012X45N", "160000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("298", "21", "180k FEF", "180k FEF", "R", "smd_passive:RESC2012X45N", "180000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("299", "21", "200k FEF", "200k FEF", "R", "smd_passive:RESC2012X45N", "200000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("300", "21", "220k FEF", "220k FEF", "R", "smd_passive:RESC2012X45N", "220000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("301", "21", "240k FEF", "240k FEF", "R", "smd_passive:RESC2012X45N", "240000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("302", "21", "270k FEF", "270k FEF", "R", "smd_passive:RESC2012X45N", "270000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("303", "21", "300k FEF", "300k FEF", "R", "smd_passive:RESC2012X45N", "300000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("304", "21", "330k FEF", "330k FEF", "R", "smd_passive:RESC2012X45N", "330000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("305", "21", "360k FEF", "360k FEF", "R", "smd_passive:RESC2012X45N", "360000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("306", "21", "390k FEF", "390k FEF", "R", "smd_passive:RESC2012X45N", "390000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("307", "21", "430k FEF", "430k FEF", "R", "smd_passive:RESC2012X45N", "430000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("308", "21", "470k FEF", "470k FEF", "R", "smd_passive:RESC2012X45N", "470000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("309", "21", "510k FEF", "510k FEF", "R", "smd_passive:RESC2012X45N", "510000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("310", "21", "560k FEF", "560k FEF", "R", "smd_passive:RESC2012X45N", "560000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("311", "21", "620k FEF", "620k FEF", "R", "smd_passive:RESC2012X45N", "620000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("312", "21", "680k FEF", "680k FEF", "R", "smd_passive:RESC2012X45N", "680000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("313", "21", "750k FEF", "750k FEF", "R", "smd_passive:RESC2012X45N", "750000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("314", "21", "820k FEF", "820k FEF", "R", "smd_passive:RESC2012X45N", "820000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("315", "21", "910k FEF", "910k FEF", "R", "smd_passive:RESC2012X45N", "910000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("316", "21", "1M FEF", "1M FEF", "R", "smd_passive:RESC2012X45N", "1000000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("317", "21", "1.1M FEF", "1.1M FEF", "R", "smd_passive:RESC2012X45N", "1100000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("318", "21", "1.2M FEF", "1.2M FEF", "R", "smd_passive:RESC2012X45N", "1200000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("319", "21", "1.3M FEF", "1.3M FEF", "R", "smd_passive:RESC2012X45N", "1300000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("320", "21", "1.5M FEF", "1.5M FEF", "R", "smd_passive:RESC2012X45N", "1500000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("321", "21", "1.6M FEF", "1.6M FEF", "R", "smd_passive:RESC2012X45N", "1600000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("322", "21", "1.8M FEF", "1.8M FEF", "R", "smd_passive:RESC2012X45N", "1800000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("323", "21", "2M FEF", "2M FEF", "R", "smd_passive:RESC2012X45N", "2000000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("324", "21", "2.2M FEF", "2.2M FEF", "R", "smd_passive:RESC2012X45N", "2200000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("325", "21", "2.4M FEF", "2.4M FEF", "R", "smd_passive:RESC2012X45N", "2400000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("326", "21", "2.7M FEF", "2.7M FEF", "R", "smd_passive:RESC2012X45N", "2700000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("327", "21", "3M FEF", "3M FEF", "R", "smd_passive:RESC2012X45N", "3000000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("328", "21", "3.3M FEF", "3.3M FEF", "R", "smd_passive:RESC2012X45N", "3300000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("329", "21", "3.6M FEF", "3.6M FEF", "R", "smd_passive:RESC2012X45N", "3600000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("330", "21", "3.9M FEF", "3.9M FEF", "R", "smd_passive:RESC2012X45N", "3900000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("331", "21", "4.3M FEF", "4.3M FEF", "R", "smd_passive:RESC2012X45N", "4300000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("332", "21", "4.7M FEF", "4.7M FEF", "R", "smd_passive:RESC2012X45N", "4700000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("333", "21", "5.1M FEF", "5.1M FEF", "R", "smd_passive:RESC2012X45N", "5100000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("334", "21", "5.6M FEF", "5.6M FEF", "R", "smd_passive:RESC2012X45N", "5600000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("335", "21", "6.2M FEF", "6.2M FEF", "R", "smd_passive:RESC2012X45N", "6200000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("336", "21", "6.8M FEF", "6.8M FEF", "R", "smd_passive:RESC2012X45N", "6800000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("337", "21", "7.5M FEF", "7.5M FEF", "R", "smd_passive:RESC2012X45N", "7500000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("338", "21", "8.2M FEF", "8.2M FEF", "R", "smd_passive:RESC2012X45N", "8200000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("339", "21", "9.1M FEF", "9.1M FEF", "R", "smd_passive:RESC2012X45N", "9100000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("340", "21", "10M FEF", "10M FEF", "R", "smd_passive:RESC2012X45N", "10000000.0", "1.0", "0.125", "1", "1", "1", "2", "Thick film resistor; SMD; 0805; 125mW; ±1%; -55÷155°C", "", "", "", "");
INSERT INTO `parts` VALUES("341", "31", "1p CDIA", "1p CDIA", "C", "smd_passive:CAPC1608X90N", "1e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("342", "31", "1.2p CDIA", "1.2p CDIA", "C", "smd_passive:CAPC1608X90N", "1.2e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("343", "31", "1.5p CDIA", "1.5p CDIA", "C", "smd_passive:CAPC1608X90N", "1.5e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("344", "31", "1.8p CDIA", "1.8p CDIA", "C", "smd_passive:CAPC1608X90N", "1.8e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("345", "31", "2.2p CDIA", "2.2p CDIA", "C", "smd_passive:CAPC1608X90N", "2.2e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("346", "31", "2.7p CDIA", "2.7p CDIA", "C", "smd_passive:CAPC1608X90N", "2.7e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("347", "31", "3.3p CDIA", "3.3p CDIA", "C", "smd_passive:CAPC1608X90N", "3.3e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("348", "31", "3.9p CDIA", "3.9p CDIA", "C", "smd_passive:CAPC1608X90N", "3.9e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("349", "31", "4.7p CDIA", "4.7p CDIA", "C", "smd_passive:CAPC1608X90N", "4.7e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("350", "31", "5.6p CDIA", "5.6p CDIA", "C", "smd_passive:CAPC1608X90N", "5.6e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("351", "31", "6.8p CDIA", "6.8p CDIA", "C", "smd_passive:CAPC1608X90N", "6.8e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("352", "31", "8.2p CDIA", "8.2p CDIA", "C", "smd_passive:CAPC1608X90N", "8.2e-12", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("353", "31", "10p CDIA", "10p CDIA", "C", "smd_passive:CAPC1608X90N", "1e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("354", "31", "12p CDIA", "12p CDIA", "C", "smd_passive:CAPC1608X90N", "1.2e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("355", "31", "15p CDIA", "15p CDIA", "C", "smd_passive:CAPC1608X90N", "1.5e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("356", "31", "18p CDIA", "18p CDIA", "C", "smd_passive:CAPC1608X90N", "1.8e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("357", "31", "22p CDIA", "22p CDIA", "C", "smd_passive:CAPC1608X90N", "2.2e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("358", "31", "27p CDIA", "27p CDIA", "C", "smd_passive:CAPC1608X90N", "2.7e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("359", "31", "33p CDIA", "33p CDIA", "C", "smd_passive:CAPC1608X90N", "3.3e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("360", "31", "39p CDIA", "39p CDIA", "C", "smd_passive:CAPC1608X90N", "3.9e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("361", "31", "47p CDIA", "47p CDIA", "C", "smd_passive:CAPC1608X90N", "4.7e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("362", "31", "56p CDIA", "56p CDIA", "C", "smd_passive:CAPC1608X90N", "5.6e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("363", "31", "68p CDIA", "68p CDIA", "C", "smd_passive:CAPC1608X90N", "6.8e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("364", "31", "82p CDIA", "82p CDIA", "C", "smd_passive:CAPC1608X90N", "8.2e-11", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("365", "31", "100p CDIA", "100p CDIA", "C", "smd_passive:CAPC1608X90N", "1e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("366", "31", "120p CDIA", "120p CDIA", "C", "smd_passive:CAPC1608X90N", "1.2e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("367", "31", "150p CDIA", "150p CDIA", "C", "smd_passive:CAPC1608X90N", "1.5e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("368", "31", "180p CDIA", "180p CDIA", "C", "smd_passive:CAPC1608X90N", "1.8e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("369", "31", "220p CDIA", "220p CDIA", "C", "smd_passive:CAPC1608X90N", "2.2e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("370", "31", "270p CDIA", "270p CDIA", "C", "smd_passive:CAPC1608X90N", "2.7e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("371", "31", "330p CDIA", "330p CDIA", "C", "smd_passive:CAPC1608X90N", "3.3e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("372", "31", "390p CDIA", "390p CDIA", "C", "smd_passive:CAPC1608X90N", "3.9e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("373", "31", "470p CDIA", "470p CDIA", "C", "smd_passive:CAPC1608X90N", "4.7e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("374", "31", "560p CDIA", "560p CDIA", "C", "smd_passive:CAPC1608X90N", "5.6e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("375", "31", "680p CDIA", "680p CDIA", "C", "smd_passive:CAPC1608X90N", "6.8e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("376", "31", "820p CDIA", "820p CDIA", "C", "smd_passive:CAPC1608X90N", "8.2e-10", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("377", "31", "1n CDIA", "1n CDIA", "C", "smd_passive:CAPC1608X90N", "1e-09", "5.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("378", "31", "1p CEJA", "1p CEJA", "C", "smd_passive:CAPC2013X90N", "1e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("379", "31", "1.2p CEJA", "1.2p CEJA", "C", "smd_passive:CAPC2013X90N", "1.2e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("380", "31", "1.5p CEJA", "1.5p CEJA", "C", "smd_passive:CAPC2013X90N", "1.5e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("381", "31", "1.8p CEJA", "1.8p CEJA", "C", "smd_passive:CAPC2013X90N", "1.8e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("382", "31", "2.2p CEJA", "2.2p CEJA", "C", "smd_passive:CAPC2013X90N", "2.2e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("383", "31", "2.7p CEJA", "2.7p CEJA", "C", "smd_passive:CAPC2013X90N", "2.7e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("384", "31", "3.3p CEJA", "3.3p CEJA", "C", "smd_passive:CAPC2013X90N", "3.3e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("385", "31", "3.9p CEJA", "3.9p CEJA", "C", "smd_passive:CAPC2013X90N", "3.9e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("386", "31", "4.7p CEJA", "4.7p CEJA", "C", "smd_passive:CAPC2013X90N", "4.7e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("387", "31", "5.6p CEJA", "5.6p CEJA", "C", "smd_passive:CAPC2013X90N", "5.6e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("388", "31", "6.8p CEJA", "6.8p CEJA", "C", "smd_passive:CAPC2013X90N", "6.8e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("389", "31", "8.2p CEJA", "8.2p CEJA", "C", "smd_passive:CAPC2013X90N", "8.2e-12", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("390", "31", "10p CEJA", "10p CEJA", "C", "smd_passive:CAPC2013X90N", "1e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("391", "31", "12p CEJA", "12p CEJA", "C", "smd_passive:CAPC2013X90N", "1.2e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("392", "31", "15p CEJA", "15p CEJA", "C", "smd_passive:CAPC2013X90N", "1.5e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("393", "31", "18p CEJA", "18p CEJA", "C", "smd_passive:CAPC2013X90N", "1.8e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("394", "31", "22p CEJA", "22p CEJA", "C", "smd_passive:CAPC2013X90N", "2.2e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("395", "31", "27p CEJA", "27p CEJA", "C", "smd_passive:CAPC2013X90N", "2.7e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("396", "31", "33p CEJA", "33p CEJA", "C", "smd_passive:CAPC2013X90N", "3.3e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("397", "31", "39p CEJA", "39p CEJA", "C", "smd_passive:CAPC2013X90N", "3.9e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("398", "31", "47p CEJA", "47p CEJA", "C", "smd_passive:CAPC2013X90N", "4.7e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("399", "31", "56p CEJA", "56p CEJA", "C", "smd_passive:CAPC2013X90N", "5.6e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("400", "31", "68p CEJA", "68p CEJA", "C", "smd_passive:CAPC2013X90N", "6.8e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("401", "31", "82p CEJA", "82p CEJA", "C", "smd_passive:CAPC2013X90N", "8.2e-11", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("402", "31", "100p CEJA", "100p CEJA", "C", "smd_passive:CAPC2013X90N", "1e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("403", "31", "120p CEJA", "120p CEJA", "C", "smd_passive:CAPC2013X90N", "1.2e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("404", "31", "150p CEJA", "150p CEJA", "C", "smd_passive:CAPC2013X90N", "1.5e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("405", "31", "180p CEJA", "180p CEJA", "C", "smd_passive:CAPC2013X90N", "1.8e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("406", "31", "220p CEJA", "220p CEJA", "C", "smd_passive:CAPC2013X90N", "2.2e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("407", "31", "270p CEJA", "270p CEJA", "C", "smd_passive:CAPC2013X90N", "2.7e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("408", "31", "330p CEJA", "330p CEJA", "C", "smd_passive:CAPC2013X90N", "3.3e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("409", "31", "390p CEJA", "390p CEJA", "C", "smd_passive:CAPC2013X90N", "3.9e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("410", "31", "470p CEJA", "470p CEJA", "C", "smd_passive:CAPC2013X90N", "4.7e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("411", "31", "560p CEJA", "560p CEJA", "C", "smd_passive:CAPC2013X90N", "5.6e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("412", "31", "680p CEJA", "680p CEJA", "C", "smd_passive:CAPC2013X90N", "6.8e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("413", "31", "820p CEJA", "820p CEJA", "C", "smd_passive:CAPC2013X90N", "8.2e-10", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("414", "31", "1n CEJA", "1n CEJA", "C", "smd_passive:CAPC2013X90N", "1e-09", "5.0", "100.0", "1", "1", "1", "2", "Ceramic capacitor; C0G; 100V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("415", "31", "1n CDIB", "1n CDIB", "C", "smd_passive:CAPC1608X90N", "1e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("416", "31", "1.5n CDIB", "1.5n CDIB", "C", "smd_passive:CAPC1608X90N", "1.5e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("417", "31", "2.2n CDIB", "2.2n CDIB", "C", "smd_passive:CAPC1608X90N", "2.2e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("418", "31", "3.3n CDIB", "3.3n CDIB", "C", "smd_passive:CAPC1608X90N", "3.3e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("419", "31", "4.7n CDIB", "4.7n CDIB", "C", "smd_passive:CAPC1608X90N", "4.7e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("420", "31", "6.8n CDIB", "6.8n CDIB", "C", "smd_passive:CAPC1608X90N", "6.8e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("421", "31", "10n CDIB", "10n CDIB", "C", "smd_passive:CAPC1608X90N", "1e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("422", "31", "15n CDIB", "15n CDIB", "C", "smd_passive:CAPC1608X90N", "1.5e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("423", "31", "22n CDIB", "22n CDIB", "C", "smd_passive:CAPC1608X90N", "2.2e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("424", "31", "33n CDIB", "33n CDIB", "C", "smd_passive:CAPC1608X90N", "3.3e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("425", "31", "47n CDIB", "47n CDIB", "C", "smd_passive:CAPC1608X90N", "4.7e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("426", "31", "68n CDIB", "68n CDIB", "C", "smd_passive:CAPC1608X90N", "6.8e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("427", "31", "100n CDIB", "100n CDIB", "C", "smd_passive:CAPC1608X90N", "1e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0603; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("428", "31", "1n CEIB", "1n CEIB", "C", "smd_passive:CAPC2013X90N", "1e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("429", "31", "1.5n CEIB", "1.5n CEIB", "C", "smd_passive:CAPC2013X90N", "1.5e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("430", "31", "2.2n CEIB", "2.2n CEIB", "C", "smd_passive:CAPC2013X90N", "2.2e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("431", "31", "3.3n CEIB", "3.3n CEIB", "C", "smd_passive:CAPC2013X90N", "3.3e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("432", "31", "4.7n CEIB", "4.7n CEIB", "C", "smd_passive:CAPC2013X90N", "4.7e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("433", "31", "6.8n CEIB", "6.8n CEIB", "C", "smd_passive:CAPC2013X90N", "6.8e-09", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("434", "31", "10n CEIB", "10n CEIB", "C", "smd_passive:CAPC2013X90N", "1e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("435", "31", "15n CEIB", "15n CEIB", "C", "smd_passive:CAPC2013X90N", "1.5e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("436", "31", "22n CEIB", "22n CEIB", "C", "smd_passive:CAPC2013X90N", "2.2e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("437", "31", "33n CEIB", "33n CEIB", "C", "smd_passive:CAPC2013X90N", "3.3e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("438", "31", "47n CEIB", "47n CEIB", "C", "smd_passive:CAPC2013X90N", "4.7e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("439", "31", "68n CEIB", "68n CEIB", "C", "smd_passive:CAPC2013X90N", "6.8e-08", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("440", "31", "100n CEIB", "100n CEIB", "C", "smd_passive:CAPC2013X90N", "1e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("441", "31", "150n CEIB", "150n CEIB", "C", "smd_passive:CAPC2013X90N", "1.5e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("442", "31", "220n CEIB", "220n CEIB", "C", "smd_passive:CAPC2013X90N", "2.2e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("443", "31", "330n CEIB", "330n CEIB", "C", "smd_passive:CAPC2013X90N", "3.3e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("444", "31", "470n CEIB", "470n CEIB", "C", "smd_passive:CAPC2013X90N", "4.7e-07", "10.0", "50.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 50V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("445", "31", "1u CEGB", "1u CEGB", "C", "smd_passive:CAPC2013X90N", "1e-06", "10.0", "25.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 25V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("446", "31", "1u CDFB", "1u CDFB", "C", "smd_passive:CAPC1608X90N", "1e-06", "10.0", "16.0", "1", "1", "1", "2", "Ceramic capacitor; X7R; 16V; SMD; 0805; -55÷125°C", "", "", "", "");
INSERT INTO `parts` VALUES("467", "51", "BAV99LT1G", "BAV99", "BAV99", "SOT-23", "0.3", "100.0", "1.0", "2", "2", "2", "2", "High Speed Switching Diode", "Caja ESP32", "SOT-23", "https://www.vishay.com/docs/85718/bav99.pdf", "APRS");
INSERT INTO `parts` VALUES("468", "52", "BAT54S", "BAT54S", "BAT54S", "SOT-23", "0.2", "30.0", "0.2", "0", "2", "2", "2", "Small Signal Schottky Diodes", "DISMD", "SOT-23", "https://www.vishay.com/docs/85508/bat54.pdf", "ANY");
INSERT INTO `parts` VALUES("469", "39", "CXT5551", "CXT5551CY", "CXT5551", "SOT-89", "0.5", "180.0", "0.6", "1", "1", "1", "2", "Switching and amplification in high voltage Applications such as telephony", "TRSMD", "SOT-89", "http://pdf.dzsc.com/99999/CXT5551.pdf", "ANY");
INSERT INTO `parts` VALUES("471", "40", "BCX53", "BCX53-16", "BCX53", "SOT-89", "0.5", "80.0", "1.0", "1", "1", "1", "2", "PNP medium power transistor series", "TRSMD", "SOT-89", "https://assets.nexperia.com/documents/data-sheet/BCP53_BCX53_BC53PA.pdf", "ANY");
INSERT INTO `parts` VALUES("472", "40", "BCX51", "BCX51-16", "BCX51", "SOT-89", "0.5", "45.0", "1.0", "1", "1", "1", "2", "45 V, 1 A PNP medium power transistors", "TRSMD", "SOT-89", "https://assets.nexperia.com/documents/data-sheet/BCP51_BCX51_BC51PA.pdf", "ANY");
INSERT INTO `parts` VALUES("473", "51", "BAV70LT1G", "BAV70", "BAV70", "SOT-23", "0.2", "100.0", "0.2", "2", "2", "2", "4", "High-speed switching diodes", "Caja ESP32", "SOT23", "https://assets.nexperia.com/documents/data-sheet/BAV70_SER.pdf", "APRS");
INSERT INTO `parts` VALUES("474", "39", "PXT3904", "PXT3904", "PXT3904", "SOT-89", "0.1", "60.0", "0.1", "0", "2", "2", "2", "NPN switching transistor", "TRSMD", "SOT-89", "http://noel.feld.cvut.cz/hw/philips/acrobat/7339.pdf", "ANY");
INSERT INTO `parts` VALUES("478", "60", "adsfa", "adsf", "asdf", "asdf", "12.0", "10.0", "12.0", "0", "2", "2", "2", "asdfasdf", "Caja Excedentes", "asdf", "adsf", "ontech");
INSERT INTO `parts` VALUES("480", "21", "0 ohm", "-", "-", "-", "0.0", "5.0", "0.25", "0", "2", "0", "2", "prueba", "Caja MCHF", "0805", "-", "McHf");
INSERT INTO `parts` VALUES("481", "36", "10uH", "-", "-", "-", "1.0", "10.0", "100.0", "0", "2", "0", "2", "prueba", "Caja Ontech", "0805", "-", "ontech");
INSERT INTO `parts` VALUES("482", "32", "100uF-25V", "-", "-", "-", "25.0", "108.0", "10.0", "0", "2", "0", "2", "", "Caja MCHF", "Aluminium", "", "McHf");
INSERT INTO `parts` VALUES("483", "36", "100uH", "-", "-", "-", "1.0", "10.0", "100.0", "0", "2", "0", "2", "", "Caja FT817", "1210", "-", "FT817");
INSERT INTO `parts` VALUES("484", "32", "10uF-16V", "-", "-", "-", "16.0", "108.0", "32.0", "0", "2", "0", "2", "", "Caja MCHF", "Aluminum", "", "McHf");
INSERT INTO `parts` VALUES("485", "55", "16F76", "-", "-", "-", "28.0", "16.0", "5.0", "0", "2", "0", "4", "", "Caja Excedentes", "", "http://ww1.microchip.com/downloads/en/devicedoc/30325b.pdf", "EXC");
INSERT INTO `parts` VALUES("486", "51", "1N4148W", "-", "-", "SOD123", "0.35", "75.0", "0.5", "0", "2", "0", "2", "", "Caja ESP32", "", "https://www.vishay.com/docs/85748/1n4148w.pdf", "ESP32");
INSERT INTO `parts` VALUES("487", "51", "1N4148WS", "-", "-", "SOD323", "0.2", "75.0", "0.35", "0", "2", "0", "2", "", "Caja ESP32", "SOD323", "https://www.vishay.com/docs/85751/1n4148ws.pdf", "ESP32");
INSERT INTO `parts` VALUES("488", "54", "1SMA5", "-", "-", "SMA", "5.0", "400.0", "40.0", "0", "2", "0", "2", "", "Caja Repetidor", "SMA", "http://www.icbase.com/File/PDF/ONS/ONS14550603.pdf", "REPETIDOR");
INSERT INTO `parts` VALUES("489", "68", "1SV271", "-", "-", "SOD123", "50.0", "0.05", "0.25", "0", "2", "0", "2", "TOSHIBA Diode Silicon Epitaxial Pin Type 
VHF to UHF Band RF Attenuator Applications ", "Caja FT817", "", "https://www.mouser.com/ds/2/408/1SV271_datasheet_en_20140301-907356.pdf", "FT817");
INSERT INTO `parts` VALUES("490", "69", "24C32", "-", "-", "SOP8", "4096.0", "5.0", "0.01", "0", "2", "0", "3", "", "Caja Excedentes", "SOP8", "http://ww1.microchip.com/downloads/en/devicedoc/doc0336.pdf", "EXC");
INSERT INTO `parts` VALUES("491", "69", "24LC1025", "-", "-", "sop8", "128000.0", "5.0", "0.01", "2", "2", "0", "2", "", "Caja MCHF", "sop8", "http://ww1.microchip.com/downloads/en/devicedoc/21941e.pdf", "McHf");
INSERT INTO `parts` VALUES("492", "69", "24LC128", "-", "-", "sop8", "16000.0", "5.0", "0.01", "2", "2", "0", "3", "Tambien 10 unidades en proyecto SI5351", "Caja Radio", "", "https://www.marutsu.co.jp/contents/shop/marutsu/datasheet/AT24C128.pdf", "RADIO-RX");
INSERT INTO `parts` VALUES("493", "70", "W25Q256FVFG", "-", "-", "-", "32.0", "3.3", "16.0", "2", "2", "0", "2", "", "Caja ESP32", "", "http://www.winbond.com/resource-files/w25q256jw%20spi%20revb%2012082017.pdf", "ESP32");
INSERT INTO `parts` VALUES("494", "70", "GD25Q512", "-", "-", "-", "16.0", "5.0", "8.0", "2", "2", "0", "2", "", "Caja ESP32", "", "http://www.concord-at.com/download/datasheets/GD25Q10&512_Rev1.5.pdf", "ESP32");
INSERT INTO `parts` VALUES("495", "44", "2N7002", "-", "-", "SOT-23", "0.3", "60.0", "0.12", "2", "2", "0", "2", "", "Caja Excedentes", "sot23", "https://www.diodes.com/assets/Datasheets/ds11303.pdf", "EXC");
INSERT INTO `parts` VALUES("496", "40", "2SA1586SU", "-", "-", "sot23", "0.1", "50.0", "0.15", "2", "2", "0", "2", "", "Caja FT817", "SOT-23", "https://www.mouser.com/ds/2/408/2SA1586_datasheet_en_20150109-708105.pdf", "FT817");
INSERT INTO `parts` VALUES("497", "39", "2SC1623", "-", "-", "SOT23", "0.2", "50.0", "0.1", "2", "2", "0", "2", "", "Caja Radio", "", "https://www.mouser.com/ds/2/258/2SC1623(SOT-23)-276330.pdf", "RADIO-RX");
INSERT INTO `parts` VALUES("498", "39", "2SC1675K", "-", "-", "TO-92", "0.1", "30.0", "0.03", "0", "0", "0", "4", "", "Caja FT817", "", "", "FT817");
INSERT INTO `parts` VALUES("499", "39", "2SC1957", "-", "-", "TO126", "0.75", "40.0", "1.0", "0", "0", "0", "4", "", "Caja FT817", "", "", "FT817");
INSERT INTO `parts` VALUES("500", "39", "2SC3356", "-", "-", "SOT23", "0.2", "20.0", "0.1", "2", "2", "0", "2", "Designed for low noise amplifier at VHF, UHF and CATV band. ", "Caja FT817", "SOT23", "https://www.danomsk.ru/upload/iblock/f85/187476_8e03c8fd66a6f2b54d01c0519c97fda5.pdf", "FT817");
INSERT INTO `parts` VALUES("501", "39", "2SC4114Y", "-", "-", "SOT23", "0.1", "60.0", "0.15", "2", "2", "0", "2", "", "Caja FT817", "", "http://pdf.datasheetcatalog.com/datasheets/mcc/2SC4116-BL_2SC4116-GR_2SC4116-O_2SC4116-Y.pdf", "FT817");
INSERT INTO `parts` VALUES("502", "39", "2SC458", "-", "-", "TO92", "0.2", "30.0", "0.1", "0", "0", "0", "4", "Low frequency amplifier Complementary pair with 2SA1029 and 2SA1030", "Caja Excedentes", "", "http://rtellason.com/transdata/2sc458.pdf", "EXC");
INSERT INTO `parts` VALUES("503", "39", "2SC535", "-", "-", "TO92", "0.1", "30.0", "0.02", "0", "0", "0", "3", "VHF Amplifier, mixer, local oscillator", "Caja Excedentes", "", "https://www.renesas.com/us/en/doc/products/transistor/003/rej03g0683_2sc535ds.pdf", "EXC");
INSERT INTO `parts` VALUES("504", "39", "2SC5374", "-", "-", "SOT23", "0.1", "20.0", "0.1", "2", "2", "0", "2", "VHF to UHF Band OSC, High-Frequency Amplifiers Applications", "Caja FT817", "", "http://pdf.datasheetcatalog.com/datasheet/sanyo/ds_pdf_e/2SC5374.pdf", "FT817");
INSERT INTO `parts` VALUES("505", "44", "2SK2973", "-", "-", "SOT89", "1.2", "17.0", "1.0", "2", "2", "0", "0", "2SK2973 is a MOS FET type transistor specifically designed for VHF/UHF power amplifiers applications", "Caja FT817", "SOT89", "http://pdf.datasheetcatalog.com/datasheet/MitsubishiElectricCorporation/mXuxvwq.pdf", "FT817");
INSERT INTO `parts` VALUES("506", "71", "74AC74", "-", "-", "SOP14", "5.0", "125.0", "14.0", "2", "2", "2", "2", "Dual D-Type Positive Edge-Triggered Flip-Flop", "Caja MCHF", "", "http://www.mouser.com/ds/2/149/74AC74-17555.pdf", "McHf");
INSERT INTO `parts` VALUES("507", "71", "74HC138", "-", "-", "SOP16", "5.0", "20.0", "16.0", "2", "2", "2", "2", "3 TO 8 LINE DECODER DEMULTIPLEXER ", "Caja ESP32", "SOP16", "https://www.diodes.com/assets/Datasheets/74HC138.pdf", "ESP32");
INSERT INTO `parts` VALUES("508", "71", "74HCT02", "-", "-", "SOP14", "5.0", "20.0", "14.0", "2", "2", "2", "2", "Quad 2-input NOR gate", "Caja MCHF", "SOP14", "https://assets.nexperia.com/documents/data-sheet/74HC_HCT02.pdf", "McHf");
INSERT INTO `parts` VALUES("509", "71", "74LS145", "-", "-", "SOP16", "5.0", "20.0", "16.0", "2", "2", "2", "2", "1-OF-10 DECODER/DRIVER OPEN-COLLECTOR
", "Caja MCHF", "SOP16", "http://www.skot9000.com/ttl/datasheets/145.pdf", "McHf");
INSERT INTO `parts` VALUES("510", "73", "78L05", "-", "-", "SOT89", "1.0", "5.0", "0.14", "2", "2", "2", "2", "3-Terminal Positive Regulators", "Caja Radio", "", "http://users.ece.utexas.edu/~valvano/Datasheets/LM78L05.pdf", "RADIO-RX");


DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `building` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shortname` (`shortname`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `places` VALUES("1", "Caja MCHF", "MCHF caja carton", "Escuela", "");
INSERT INTO `places` VALUES("2", "Caja Ontech", "Ontech Caja", "Escuela", "");
INSERT INTO `places` VALUES("3", "Caja FT817", "FT817 Caja", "Escuela", "");
INSERT INTO `places` VALUES("4", "Caja PLL", "PLL Caja", "Escuela", "");
INSERT INTO `places` VALUES("5", "Caja Radio", "Radio Caja", "Escuela", "");
INSERT INTO `places` VALUES("6", "Caja Excedentes", "Excedentes", "Escuela", "");
INSERT INTO `places` VALUES("7", "Caja Repetidor", "Repetidor Caja", "Escuela", "");
INSERT INTO `places` VALUES("8", "Caja ESP32", "ESP32 Caja", "Escuela", "");
INSERT INTO `places` VALUES("9", "Caja SI5351", "SI5351 caja", "Escuela", "");


DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `time` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `shortname` (`shortname`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO `projects` VALUES("1", "ontech", "Soporte de Ontech", "1", "2018-2019", "Proyecto de Asesoramiento de Ontech en General");
INSERT INTO `projects` VALUES("2", "test", "Placa Test Ontech", "1", "2019", "Placa de Test.
Terminada v1.0
Iniciada v2.0
");
INSERT INTO `projects` VALUES("3", "McHf", "MCHF SDR QRP", "4", "2018-2020", "Comenzado componentes en 2018.
Montado primer prototipo.
En Evaluación");
INSERT INTO `projects` VALUES("4", "FT817", "817 Clone", "4", "2017-2020", "Componentes para diseño de clon FT817.
Primera Fase, recogida de componentes.");
INSERT INTO `projects` VALUES("5", "PLL", "Diseño Varios PLL de Analog Devices", "3", "2018-2020", "Evaluacion de varios PLL de Analog Devices
En fase de recogida de componentes y diseño de PCBs");
INSERT INTO `projects` VALUES("6", "RADIO-RX", "Prueba de varios diseño e IC de Radios miniatura", "5", "2018-2020", "Recogida de componentes");
INSERT INTO `projects` VALUES("7", "REPETIDOR", "Ham Repeater", "5", "2018-2020", "Diseño de repetidores HAM con varias prestaciones
Fase de Recogida de compoentes y diseño de PCBs");
INSERT INTO `projects` VALUES("8", "ESP32", "Varios Proyectos con ESP32", "1", "2018-2020", "Varios proyectos sobre ESP32:
- Proyecto Juan
- Proyecto Linares

Telemetria e Internet de las Cosas");
INSERT INTO `projects` VALUES("9", "SI5351", "VFO basado en SI5351", "5", "2018-2020", "VFO con pantalla digital con SI5351. Componentes y diseño de PCB");
INSERT INTO `projects` VALUES("10", "TAC", "Time Analog Converter", "4", "2017-2020", "Proyecto de convertidor tiempo amplitud analógico y digital para Investigación en Instrumentación Nuclear");
INSERT INTO `projects` VALUES("11", "CONTROL", "Control Ham de Estación", "3", "2017-2020", "Control remoto y monitorización empleando RS485 o similar. Basado en ATMEGA328P");
INSERT INTO `projects` VALUES("12", "APRS", "Sistema Ham APRS con GPS", "3", "2018-2020", "Sistema APRS completo con radio y GPS. Fase de captación de componentes y diseño de PCB");
INSERT INTO `projects` VALUES("13", "EXC", "Excedente de Componentes", "1", "2018", "Asignación de componentes a ningún proyecto. Excedente de componentes para labores de I+D sin proyecto concreto asignado");


DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;

INSERT INTO `stock` VALUES("467", "100", "0.0072", "eur");
INSERT INTO `stock` VALUES("468", "100", "0.0108", "eur");
INSERT INTO `stock` VALUES("469", "50", "0.0394", "eur");
INSERT INTO `stock` VALUES("471", "50", "0.0298", "eur");
INSERT INTO `stock` VALUES("472", "50", "0.0304", "eur");
INSERT INTO `stock` VALUES("473", "100", "0.0072", "eur");
INSERT INTO `stock` VALUES("474", "50", "0.0574", "eur");
INSERT INTO `stock` VALUES("480", "9", "0.27", "EUR");
INSERT INTO `stock` VALUES("481", "10", "0.023", "EUR");
INSERT INTO `stock` VALUES("482", "49", "0.34", "EUR");
INSERT INTO `stock` VALUES("483", "100", "0.03", "EUR");
INSERT INTO `stock` VALUES("484", "10", "0.34", "EUR");
INSERT INTO `stock` VALUES("485", "11", "1.32", "EUR");
INSERT INTO `stock` VALUES("486", "10", "0.22", "EUR");
INSERT INTO `stock` VALUES("487", "10", "0.34", "EUR");
INSERT INTO `stock` VALUES("488", "10", "0.261", "EUR");
INSERT INTO `stock` VALUES("489", "15", "0.3", "EUR");
INSERT INTO `stock` VALUES("490", "20", "0.097", "EUR");
INSERT INTO `stock` VALUES("491", "4", "0.85", "EUR");
INSERT INTO `stock` VALUES("492", "10", "0.3", "EUR");
INSERT INTO `stock` VALUES("493", "5", "1.16", "EUR");
INSERT INTO `stock` VALUES("494", "8", "0.5", "EUR");
INSERT INTO `stock` VALUES("495", "10", "0.044", "EUR");
INSERT INTO `stock` VALUES("496", "100", "0.057", "EUR");
INSERT INTO `stock` VALUES("497", "10", "0.5", "EUR");
INSERT INTO `stock` VALUES("498", "11", "0.5", "EUR");
INSERT INTO `stock` VALUES("499", "6", "3.34", "EUR");
INSERT INTO `stock` VALUES("500", "25", "0.056", "EUR");
INSERT INTO `stock` VALUES("501", "100", "0.07", "USD");
INSERT INTO `stock` VALUES("502", "2", "1.0", "EUR");
INSERT INTO `stock` VALUES("503", "2", "1.0", "EUR");
INSERT INTO `stock` VALUES("504", "25", "23.2", "EUR");
INSERT INTO `stock` VALUES("505", "5", "1.65", "EUR");
INSERT INTO `stock` VALUES("506", "10", "0.36", "EUR");
INSERT INTO `stock` VALUES("507", "20", "0.0525", "EUR");
INSERT INTO `stock` VALUES("508", "10", "0.353", "EUR");
INSERT INTO `stock` VALUES("509", "5", "0.923", "EUR");
INSERT INTO `stock` VALUES("510", "20", "0.095", "EUR");


DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `www` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `suppliers` VALUES("1", "TME", "TME Czech Republic s.r.o. ", "http://www.tme.eu", "Slévárenská 406/17
709 00 Ostrava - Mariánské Hory
ČESKÁ REPUBLIKA", "");
INSERT INTO `suppliers` VALUES("2", "GME", "GM electronic", "http://www.gme.cz/", "Thámova 15
186 00 Praha
Česká Republika", "Naše společnost, GM electronic, spol. s r.o. je jedním z největších českých distributorů elektronických součástek, komponentů pro elektroniku, chemických přípravků a měřicí techniky. Společnost byla založena roku 1990 a od svého založení až do současnosti se jedná o rodinný podnik, plně vlastněný pouze českým kapitálem. Z kapacitních důvodů jsme v roce 2010 přestěhovali hlavní sklad do moderních skladových prostor v Dobrovízi, které splňují současný standard pro skladování elektronických součástek. Jsme vlastníky certifikátu ISO 9001:2001, který každoročně obhajujeme. Náš e-shop využívá přes 100 000 registrovaných uživatelů, kteří si mohou vybrat z 33 000 položek elektronických součástek, nářadí a finálních produktů a od roku 2010 si objednané zboží vyzvedávat již na 6 prodejnách v Praze, Plzni, Brně, Ostravě, Hradci Králové a na Slovensku v Bratislavě.");
INSERT INTO `suppliers` VALUES("3", "GES", "GES-ELECTRONICS, a.s.", "http://www.ges.cz/", "GES-ELECTRONICS, a.s.
Studentská 55a
323 00  Plzeň", "");
INSERT INTO `suppliers` VALUES("4", "Farnell", "Farnell element14", "http://farnell.com/", "Premier Farnell UK Limited
150 Armley Road
Leeds, LS12 2QQ
England", "Společnost Farnell element14 je prémiový distributor technologických produktů, služeb a řešení pro navrhování, údržbu a opravy elektronických systémů.");
INSERT INTO `suppliers` VALUES("5", "utsource", "UtSource Inc.", "https://www.utsource.net/", "Room B2 , World trade plaza, Futian dist, Shenzhen, Guangdong, China", "UTSOURCE.net is a professional purchasing B2B & B2C tools in electronic components field. UTSOURCE.net provides different types such as IC, Modules, RF transistors etc., and various product type PDF parameter form as well as the related photographs, we also provide satisfying one-stop package service for customers.");
INSERT INTO `suppliers` VALUES("6", "Mouser", "Mouser Inc", "https://www.mouser.es/", "Parque de Negocios MAS BLAU I
Edificio Muntadas, Esc. B
C/ Solsones nº 2, Planta 2 Local C1 y C3
08820 El Prat de Llobregat
Barcelona ", "Mouser Electronics is a worldwide leading authorised distributor of semiconductors and electronic components for over 750 industry-leading manufacturers. We specialise in the rapid introduction of new products and technologies for design engineers and buyers. Our extensive product offering includes semiconductors, interconnects, passives, and electromechanical components.");
INSERT INTO `suppliers` VALUES("7", "Longqi Store", "Longqi Store Aliexpress", "https://es.aliexpress.com/store/3626036", "", "kit de componentes electrónicos");


