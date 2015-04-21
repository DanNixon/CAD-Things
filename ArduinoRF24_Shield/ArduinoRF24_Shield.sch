EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:dev_boards
LIBS:modules
LIBS:arduino_shieldsNCL
LIBS:ArduinoRF24_Shield-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NRF24 U1
U 1 1 53724665
P 8100 2850
F 0 "U1" H 8250 2400 60  0000 C CNN
F 1 "NRF24" H 8150 3300 60  0000 C CNN
F 2 "" H 8100 2850 60  0000 C CNN
F 3 "" H 8100 2850 60  0000 C CNN
	1    8100 2850
	1    0    0    -1  
$EndComp
Text Label 2750 2700 1    60   ~ 0
GND
Text Label 7400 2500 2    60   ~ 0
GND
Text Label 7400 2600 2    60   ~ 0
3v3
Text Label 2950 2500 1    60   ~ 0
3v3
$Comp
L SWITCH_INV SW1
U 1 1 537249B6
P 7900 4200
F 0 "SW1" H 7700 4350 50  0000 C CNN
F 1 "SWITCH_INV" H 7750 4050 50  0000 C CNN
F 2 "" H 7900 4200 60  0000 C CNN
F 3 "" H 7900 4200 60  0000 C CNN
	1    7900 4200
	-1   0    0    1   
$EndComp
Text Label 7400 3200 2    60   ~ 0
IRQ
Text Label 7400 3100 2    60   ~ 0
MISO
Text Label 7400 3000 2    60   ~ 0
MOSI
Text Label 7400 2900 2    60   ~ 0
SCK
Text Label 7400 2800 2    60   ~ 0
CSN
Text Label 7400 2700 2    60   ~ 0
CE
Wire Wire Line
	2500 2700 3000 2700
Wire Wire Line
	2500 2500 3000 2500
Wire Wire Line
	8400 4200 8700 4200
Wire Wire Line
	7200 4100 7400 4100
Wire Wire Line
	7300 4300 7300 4400
Wire Wire Line
	7300 4400 8500 4400
Wire Wire Line
	7400 2500 7600 2500
Wire Wire Line
	7600 2600 7400 2600
Wire Wire Line
	7400 3200 7600 3200
Wire Wire Line
	7600 3100 7400 3100
Wire Wire Line
	7400 3000 7600 3000
Wire Wire Line
	7600 2900 7400 2900
Wire Wire Line
	7400 2800 7600 2800
Wire Wire Line
	7600 2700 7400 2700
Wire Wire Line
	8500 4400 8500 4200
Text Label 8700 4200 0    60   ~ 0
IRQ
Text Label 5000 2200 1    60   ~ 0
SCK
Text Label 5400 2600 1    60   ~ 0
CE
Text Label 5300 2500 1    60   ~ 0
CSN
Wire Wire Line
	4900 2200 5500 2200
Wire Wire Line
	4900 2500 5500 2500
Wire Wire Line
	4900 2600 5500 2600
Connection ~ 8500 4200
Text Label 5100 2300 1    60   ~ 0
MISO
Text Label 5200 2400 1    60   ~ 0
MOSI
Wire Wire Line
	4900 2400 5500 2400
Wire Wire Line
	4900 2300 5500 2300
$Comp
L ARDUINO_SHIELD SHIELD1
U 1 1 537263BD
P 3950 2800
F 0 "SHIELD1" H 3600 3750 60  0000 C CNN
F 1 "ARDUINO_SHIELD" H 4000 1850 60  0000 C CNN
F 2 "" H 3950 2800 60  0000 C CNN
F 3 "" H 3950 2800 60  0000 C CNN
	1    3950 2800
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P1
U 1 1 538B8A5B
P 2150 2650
F 0 "P1" V 2100 2650 60  0000 C CNN
F 1 "CONN_6" V 2200 2650 60  0000 C CNN
F 2 "" H 2150 2650 60  0000 C CNN
F 3 "" H 2150 2650 60  0000 C CNN
	1    2150 2650
	-1   0    0    1   
$EndComp
$Comp
L CONN_6 P2
U 1 1 538B8A6A
P 2150 3350
F 0 "P2" V 2100 3350 60  0000 C CNN
F 1 "CONN_6" V 2200 3350 60  0000 C CNN
F 2 "" H 2150 3350 60  0000 C CNN
F 3 "" H 2150 3350 60  0000 C CNN
	1    2150 3350
	-1   0    0    1   
$EndComp
$Comp
L CONN_8 P4
U 1 1 538B8A79
P 5850 2350
F 0 "P4" V 5800 2350 60  0000 C CNN
F 1 "CONN_8" V 5900 2350 60  0000 C CNN
F 2 "" H 5850 2350 60  0000 C CNN
F 3 "" H 5850 2350 60  0000 C CNN
	1    5850 2350
	1    0    0    -1  
$EndComp
$Comp
L CONN_8 P3
U 1 1 538B8A88
P 5850 3250
F 0 "P3" V 5800 3250 60  0000 C CNN
F 1 "CONN_8" V 5900 3250 60  0000 C CNN
F 2 "" H 5850 3250 60  0000 C CNN
F 3 "" H 5850 3250 60  0000 C CNN
	1    5850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2000 5500 2000
Wire Wire Line
	5500 2100 4900 2100
Wire Wire Line
	4900 2700 5500 2700
Wire Wire Line
	2500 2400 3000 2400
Wire Wire Line
	3000 2600 2500 2600
Wire Wire Line
	2500 2800 3000 2800
Wire Wire Line
	3000 2900 2500 2900
Wire Wire Line
	2500 3100 3000 3100
Wire Wire Line
	3000 3200 2500 3200
Wire Wire Line
	2500 3300 3000 3300
Wire Wire Line
	3000 3400 2500 3400
Wire Wire Line
	2500 3500 3000 3500
Wire Wire Line
	3000 3600 2500 3600
Wire Wire Line
	4900 2900 5500 2900
Wire Wire Line
	5500 3000 4900 3000
Wire Wire Line
	4900 3100 5500 3100
Wire Wire Line
	5500 3200 4900 3200
Wire Wire Line
	4900 3300 5500 3300
Wire Wire Line
	5500 3400 4900 3400
Wire Wire Line
	4900 3500 5500 3500
Wire Wire Line
	5500 3600 4900 3600
Wire Wire Line
	7200 4300 7400 4300
Connection ~ 7300 4300
Text Label 7200 4100 2    60   ~ 0
INT1
Text Label 7200 4300 2    60   ~ 0
INT0
Text Label 5300 3400 1    60   ~ 0
INT0
Text Label 5200 3300 1    60   ~ 0
INT1
Text Label 2850 2600 1    60   ~ 0
5V
Text Label 2650 2800 1    60   ~ 0
GND
Text Label 2950 2900 1    60   ~ 0
VIN
Text Label 5400 2100 1    60   ~ 0
GND
$EndSCHEMATC
