V34 :0x3c force_mod
9 force.f03 S624 0
11/13/2023  13:50:51
use iso_fortran_env public 0 direct
use mqc_files public 0 indirect
use mqc_datastructures public 0 indirect
use mqc_est public 0 indirect
use mqc_molecule public 0 direct
use mqc_matwrapper public 0 indirect
use mqc_gaussian public 0 direct
use mqc_algebra2 public 0 direct
use mqc_general public 0 direct
use mqc_algebra public 0 direct
use omp_lib_kinds public 0 indirect
use omp_lib public 0 direct
use iso_c_binding private
enduse
B 606 iso_c_binding compiler_options
B 607 iso_c_binding compiler_version
D 63 23 6 1 11 55 0 0 0 0 0
 0 55 11 11 55 55
D 66 23 6 1 11 55 0 0 0 0 0
 0 55 11 11 55 55
D 69 23 6 1 11 55 0 0 0 0 0
 0 55 11 11 55 55
D 72 23 6 1 11 55 0 0 0 0 0
 0 55 11 11 55 55
D 75 23 6 1 11 56 0 0 0 0 0
 0 56 11 11 56 56
D 78 23 6 1 11 56 0 0 0 0 0
 0 56 11 11 56 56
D 342 26 1376 88 1375 7
D 359 22 7
D 361 22 7
D 363 22 7
D 368 26 1406 512 1405 7
D 395 26 1482 720 1481 7
D 422 26 1562 1024 1561 7
D 958 26 3992 104 3989 7
D 982 22 958
D 984 22 958
D 1094 26 4107 272 4106 7
D 1102 26 4114 1328 4113 7
D 1161 26 1376 88 1375 7
D 1167 22 7
D 1169 22 7
D 1171 22 7
D 1173 26 1406 512 1405 7
D 1179 26 1482 720 1481 7
D 1213 26 4302 2344 4301 7
D 1298 26 4408 512 4407 7
D 1306 23 7 1 11 1085 0 0 0 0 0
 0 1085 11 11 1085 1085
D 1443 26 1376 88 1375 7
D 1449 22 7
D 1451 22 7
D 1453 22 7
D 1455 26 1406 512 1405 7
D 1461 26 1482 720 1481 7
D 1467 26 1562 1024 1561 7
D 1495 26 4929 3152 4928 7
D 1512 26 4974 1152 4973 7
D 1521 26 4992 22520 4991 7
D 1529 26 5015 5040 5014 7
D 1538 26 5025 23784 5024 7
D 1550 26 5036 1440 5035 7
D 1559 26 5041 2552 5040 7
D 1568 26 5051 16512 5050 7
D 1991 26 4107 272 4106 7
D 1997 26 4114 1328 4113 7
D 2003 26 1376 88 1375 7
D 2009 22 7
D 2011 22 7
D 2013 22 7
D 2130 26 1376 88 1375 7
D 2136 22 7
D 2138 22 7
D 2140 22 7
D 2142 26 1406 512 1405 7
D 2148 26 1482 720 1481 7
D 2154 26 4302 2344 4301 7
D 2160 26 6565 1472 6564 7
D 2175 26 6582 1928 6581 7
D 2288 26 6724 2520 6723 7
D 2395 26 7086 8 7085 7
D 2404 26 7089 8 7088 7
S 626 24 0 0 0 10 1 0 5027 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 force_mod
S 634 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 637 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 642 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 643 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 644 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 666 7 22 iso_fortran_env integer_kinds$ac
R 668 7 24 iso_fortran_env logical_kinds$ac
R 670 7 26 iso_fortran_env real_kinds$ac
R 866 14 163 mqc_general mqc_print_scalar_integer
R 874 14 171 mqc_general mqc_print_scalar_real
R 901 14 198 mqc_general mqc_print_matrix_array_integer
R 915 14 212 mqc_general mqc_print_matrix_array_real
R 929 14 226 mqc_general mqc_print_matrix_array_complex
R 943 14 240 mqc_general mqc_print_vector_array_integer
R 954 14 251 mqc_general mqc_print_vector_array_real
R 965 14 262 mqc_general mqc_print_vector_array_complex
R 976 14 273 mqc_general mqc_print_r4tensor_array_integer
R 996 14 293 mqc_general mqc_print_r4tensor_array_real
R 1016 14 313 mqc_general mqc_print_r4tensor_array_complex
R 1039 14 336 mqc_general integer2character
R 1044 14 341 mqc_general real2character
R 1049 14 346 mqc_general complex2character
S 1362 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1364 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 1375 25 4 mqc_algebra mqc_scalar
R 1376 5 5 mqc_algebra scar mqc_scalar
R 1378 5 7 mqc_algebra scar$p mqc_scalar
R 1379 5 8 mqc_algebra scai mqc_scalar
R 1381 5 10 mqc_algebra scai$p mqc_scalar
R 1382 5 11 mqc_algebra scac mqc_scalar
R 1384 5 13 mqc_algebra scac$p mqc_scalar
R 1385 5 14 mqc_algebra data_type mqc_scalar
R 1394 5 23 mqc_algebra random$tbp$0 mqc_scalar
R 1395 5 24 mqc_algebra log$tbp$1 mqc_scalar
R 1396 5 25 mqc_algebra exp$tbp$2 mqc_scalar
R 1397 5 26 mqc_algebra sqrt$tbp$3 mqc_scalar
R 1398 5 27 mqc_algebra abs$tbp$4 mqc_scalar
R 1399 5 28 mqc_algebra cval$tbp$5 mqc_scalar
R 1400 5 29 mqc_algebra ival$tbp$6 mqc_scalar
R 1401 5 30 mqc_algebra rval$tbp$7 mqc_scalar
R 1402 5 31 mqc_algebra print$tbp$8 mqc_scalar
R 1405 25 34 mqc_algebra mqc_vector
R 1406 5 35 mqc_algebra length mqc_vector
R 1407 5 36 mqc_algebra column mqc_vector
R 1408 5 37 mqc_algebra data_type mqc_vector
R 1410 5 39 mqc_algebra vecr mqc_vector
R 1411 5 40 mqc_algebra vecr$sd mqc_vector
R 1412 5 41 mqc_algebra vecr$p mqc_vector
R 1413 5 42 mqc_algebra vecr$o mqc_vector
R 1416 5 45 mqc_algebra veci mqc_vector
R 1417 5 46 mqc_algebra veci$sd mqc_vector
R 1418 5 47 mqc_algebra veci$p mqc_vector
R 1419 5 48 mqc_algebra veci$o mqc_vector
R 1422 5 51 mqc_algebra vecc mqc_vector
R 1423 5 52 mqc_algebra vecc$sd mqc_vector
R 1424 5 53 mqc_algebra vecc$p mqc_vector
R 1425 5 54 mqc_algebra vecc$o mqc_vector
R 1443 5 72 mqc_algebra diagf$tbp$9 mqc_vector
R 1444 5 73 mqc_algebra hphdiag$tbp$10 mqc_vector
R 1445 5 74 mqc_algebra diag$tbp$11 mqc_vector
R 1446 5 75 mqc_algebra power$tbp$12 mqc_vector
R 1447 5 76 mqc_algebra product$tbp$13 mqc_vector
R 1448 5 77 mqc_algebra sum$tbp$14 mqc_vector
R 1449 5 78 mqc_algebra abs$tbp$15 mqc_vector
R 1450 5 79 mqc_algebra exp$tbp$16 mqc_vector
R 1451 5 80 mqc_algebra sqrt$tbp$17 mqc_vector
R 1452 5 81 mqc_algebra sort$tbp$18 mqc_vector
R 1453 5 82 mqc_algebra argsort$tbp$19 mqc_vector
R 1454 5 83 mqc_algebra minloc$tbp$20 mqc_vector
R 1455 5 84 mqc_algebra maxloc$tbp$21 mqc_vector
R 1456 5 85 mqc_algebra minval$tbp$22 mqc_vector
R 1457 5 86 mqc_algebra maxval$tbp$23 mqc_vector
R 1458 5 87 mqc_algebra shift$tbp$24 mqc_vector
R 1459 5 88 mqc_algebra pop$tbp$25 mqc_vector
R 1460 5 89 mqc_algebra unshift$tbp$26 mqc_vector
R 1461 5 90 mqc_algebra push$tbp$27 mqc_vector
R 1462 5 91 mqc_algebra vput$tbp$28 mqc_vector
R 1463 5 92 mqc_algebra put$tbpg$29 mqc_vector
R 1464 5 93 mqc_algebra put$tbpg$30 mqc_vector
R 1465 5 94 mqc_algebra put_int$tbp$31 mqc_vector
R 1466 5 95 mqc_algebra put_sca$tbp$32 mqc_vector
R 1467 5 96 mqc_algebra vat$tbp$33 mqc_vector
R 1468 5 97 mqc_algebra at$tbpg$34 mqc_vector
R 1469 5 98 mqc_algebra at$tbpg$35 mqc_vector
R 1470 5 99 mqc_algebra at_int$tbp$36 mqc_vector
R 1471 5 100 mqc_algebra at_sca$tbp$37 mqc_vector
R 1472 5 101 mqc_algebra dagger$tbp$38 mqc_vector
R 1473 5 102 mqc_algebra transpose$tbp$39 mqc_vector
R 1474 5 103 mqc_algebra norm$tbp$40 mqc_vector
R 1475 5 104 mqc_algebra set$tbp$41 mqc_vector
R 1476 5 105 mqc_algebra init$tbp$42 mqc_vector
R 1477 5 106 mqc_algebra size$tbp$43 mqc_vector
R 1478 5 107 mqc_algebra print$tbp$44 mqc_vector
R 1481 25 110 mqc_algebra mqc_matrix
R 1482 5 111 mqc_algebra ncol mqc_matrix
R 1483 5 112 mqc_algebra nrow mqc_matrix
R 1484 5 113 mqc_algebra data_type mqc_matrix
R 1485 5 114 mqc_algebra storage mqc_matrix
R 1488 5 117 mqc_algebra matr mqc_matrix
R 1489 5 118 mqc_algebra matr$sd mqc_matrix
R 1490 5 119 mqc_algebra matr$p mqc_matrix
R 1491 5 120 mqc_algebra matr$o mqc_matrix
R 1495 5 124 mqc_algebra mati mqc_matrix
R 1496 5 125 mqc_algebra mati$sd mqc_matrix
R 1497 5 126 mqc_algebra mati$p mqc_matrix
R 1498 5 127 mqc_algebra mati$o mqc_matrix
R 1502 5 131 mqc_algebra matc mqc_matrix
R 1503 5 132 mqc_algebra matc$sd mqc_matrix
R 1504 5 133 mqc_algebra matc$p mqc_matrix
R 1505 5 134 mqc_algebra matc$o mqc_matrix
R 1519 5 148 mqc_algebra mput$tbp$45 mqc_matrix
R 1520 5 149 mqc_algebra vput$tbp$46 mqc_matrix
R 1521 5 150 mqc_algebra put$tbpg$47 mqc_matrix
R 1522 5 151 mqc_algebra put$tbpg$48 mqc_matrix
R 1523 5 152 mqc_algebra put$tbpg$49 mqc_matrix
R 1524 5 153 mqc_algebra put$tbpg$50 mqc_matrix
R 1525 5 154 mqc_algebra put_int$tbp$51 mqc_matrix
R 1526 5 155 mqc_algebra put_intsca$tbp$52 mqc_matrix
R 1527 5 156 mqc_algebra put_scaint$tbp$53 mqc_matrix
R 1528 5 157 mqc_algebra put_sca$tbp$54 mqc_matrix
R 1529 5 158 mqc_algebra mat$tbp$55 mqc_matrix
R 1530 5 159 mqc_algebra vat$tbp$56 mqc_matrix
R 1531 5 160 mqc_algebra at$tbpg$57 mqc_matrix
R 1532 5 161 mqc_algebra at$tbpg$58 mqc_matrix
R 1533 5 162 mqc_algebra at$tbpg$59 mqc_matrix
R 1534 5 163 mqc_algebra at$tbpg$60 mqc_matrix
R 1535 5 164 mqc_algebra at_int$tbp$61 mqc_matrix
R 1536 5 165 mqc_algebra at_intsca$tbp$62 mqc_matrix
R 1537 5 166 mqc_algebra at_scaint$tbp$63 mqc_matrix
R 1538 5 167 mqc_algebra at_sca$tbp$64 mqc_matrix
R 1539 5 168 mqc_algebra power$tbp$65 mqc_matrix
R 1540 5 169 mqc_algebra sum$tbp$66 mqc_matrix
R 1541 5 170 mqc_algebra exp$tbp$67 mqc_matrix
R 1542 5 171 mqc_algebra sqrt$tbp$68 mqc_matrix
R 1543 5 172 mqc_algebra rmsmax$tbp$69 mqc_matrix
R 1544 5 173 mqc_algebra diagonal$tbp$70 mqc_matrix
R 1545 5 174 mqc_algebra pinv$tbp$71 mqc_matrix
R 1546 5 175 mqc_algebra trace$tbp$72 mqc_matrix
R 1547 5 176 mqc_algebra det$tbp$73 mqc_matrix
R 1548 5 177 mqc_algebra inv$tbp$74 mqc_matrix
R 1549 5 178 mqc_algebra eigensys$tbp$75 mqc_matrix
R 1550 5 179 mqc_algebra svd$tbp$76 mqc_matrix
R 1551 5 180 mqc_algebra diag$tbp$77 mqc_matrix
R 1552 5 181 mqc_algebra dagger$tbp$78 mqc_matrix
R 1553 5 182 mqc_algebra transpose$tbp$79 mqc_matrix
R 1554 5 183 mqc_algebra norm$tbp$80 mqc_matrix
R 1555 5 184 mqc_algebra set$tbp$81 mqc_matrix
R 1556 5 185 mqc_algebra identity$tbp$82 mqc_matrix
R 1557 5 186 mqc_algebra init$tbp$83 mqc_matrix
R 1558 5 187 mqc_algebra print$tbp$84 mqc_matrix
R 1561 25 190 mqc_algebra mqc_r4tensor
R 1562 5 191 mqc_algebra i mqc_r4tensor
R 1563 5 192 mqc_algebra j mqc_r4tensor
R 1564 5 193 mqc_algebra k mqc_r4tensor
R 1565 5 194 mqc_algebra l mqc_r4tensor
R 1566 5 195 mqc_algebra data_type mqc_r4tensor
R 1567 5 196 mqc_algebra storage mqc_r4tensor
R 1568 5 197 mqc_algebra rten mqc_r4tensor
R 1573 5 202 mqc_algebra rten$sd mqc_r4tensor
R 1574 5 203 mqc_algebra rten$p mqc_r4tensor
R 1575 5 204 mqc_algebra rten$o mqc_r4tensor
R 1577 5 206 mqc_algebra iten mqc_r4tensor
R 1582 5 211 mqc_algebra iten$sd mqc_r4tensor
R 1583 5 212 mqc_algebra iten$p mqc_r4tensor
R 1584 5 213 mqc_algebra iten$o mqc_r4tensor
R 1586 5 215 mqc_algebra cten mqc_r4tensor
R 1591 5 220 mqc_algebra cten$sd mqc_r4tensor
R 1592 5 221 mqc_algebra cten$p mqc_r4tensor
R 1593 5 222 mqc_algebra cten$o mqc_r4tensor
R 1600 5 229 mqc_algebra init$tbp$85 mqc_r4tensor
R 1601 5 230 mqc_algebra tput$tbp$86 mqc_r4tensor
R 1602 5 231 mqc_algebra mput$tbp$87 mqc_r4tensor
R 1603 5 232 mqc_algebra vput$tbp$88 mqc_r4tensor
R 1604 5 233 mqc_algebra put$tbpg$89 mqc_r4tensor
R 1605 5 234 mqc_algebra put$tbpg$90 mqc_r4tensor
R 1606 5 235 mqc_algebra put_int$tbp$91 mqc_r4tensor
R 1607 5 236 mqc_algebra put_sca$tbp$92 mqc_r4tensor
R 1608 5 237 mqc_algebra tat$tbp$93 mqc_r4tensor
R 1609 5 238 mqc_algebra mat$tbp$94 mqc_r4tensor
R 1610 5 239 mqc_algebra vat$tbp$95 mqc_r4tensor
R 1611 5 240 mqc_algebra at$tbpg$96 mqc_r4tensor
R 1612 5 241 mqc_algebra at$tbpg$97 mqc_r4tensor
R 1613 5 242 mqc_algebra at_int$tbp$98 mqc_r4tensor
R 1614 5 243 mqc_algebra at_sca$tbp$99 mqc_r4tensor
R 1615 5 244 mqc_algebra print$tbp$100 mqc_r4tensor
R 1796 26 425 mqc_algebra **
R 1801 26 430 mqc_algebra !=
R 1809 26 438 mqc_algebra ==
R 1817 26 446 mqc_algebra <
R 1823 26 452 mqc_algebra >
R 1829 26 458 mqc_algebra <=
R 1835 26 464 mqc_algebra >=
R 1845 26 474 mqc_algebra dot
R 1861 26 490 mqc_algebra ewp
R 1864 26 493 mqc_algebra ewd
R 1866 26 495 mqc_algebra x
R 1868 26 497 mqc_algebra outer
R 1907 14 536 mqc_algebra put_intsca$tbp
R 1908 14 537 mqc_algebra put_scaint$tbp
R 1914 14 543 mqc_algebra at_intsca$tbp
R 1915 14 544 mqc_algebra at_scaint$tbp
R 1958 14 587 mqc_algebra put_int$tbp
R 1959 14 588 mqc_algebra put_sca$tbp
R 1962 14 591 mqc_algebra at_int$tbp
R 1963 14 592 mqc_algebra at_sca$tbp
R 2007 14 636 mqc_algebra mqc_input_integer_scalar
R 2011 14 640 mqc_algebra mqc_input_real_scalar
R 2015 14 644 mqc_algebra mqc_input_complex_scalar
R 2019 14 648 mqc_algebra mqc_output_mqcscalar_scalar
R 2023 14 652 mqc_algebra mqc_output_integer_scalar
R 2027 14 656 mqc_algebra mqc_output_real_scalar
R 2031 14 660 mqc_algebra mqc_output_complex_scalar
R 2039 14 668 mqc_algebra mqc_print_scalar_algebra1
R 2096 14 725 mqc_algebra mqc_scalar_get_intrinsic_real
R 2100 14 729 mqc_algebra mqc_scalar_get_intrinsic_integer
R 2125 14 754 mqc_algebra mqc_scalaradd
R 2130 14 759 mqc_algebra mqc_scalarsubtract
R 2135 14 764 mqc_algebra mqc_scalarmultiply
R 2140 14 769 mqc_algebra mqc_scalardivide
R 2335 14 964 mqc_algebra mqc_scalar_complex_conjugate
R 2348 14 977 mqc_algebra mqc_integerscalarmultiply
R 2353 14 982 mqc_algebra mqc_scalarintegermultiply
R 2358 14 987 mqc_algebra mqc_realscalarmultiply
R 2363 14 992 mqc_algebra mqc_scalarrealmultiply
R 2368 14 997 mqc_algebra mqc_complexscalarmultiply
R 2373 14 1002 mqc_algebra mqc_scalarcomplexmultiply
R 2378 14 1007 mqc_algebra mqc_integerscalardivide
R 2383 14 1012 mqc_algebra mqc_scalarintegerdivide
R 2388 14 1017 mqc_algebra mqc_realscalardivide
R 2393 14 1022 mqc_algebra mqc_scalarrealdivide
R 2398 14 1027 mqc_algebra mqc_complexscalardivide
R 2403 14 1032 mqc_algebra mqc_scalarcomplexdivide
R 2408 14 1037 mqc_algebra mqc_integerscalaradd
R 2413 14 1042 mqc_algebra mqc_scalarintegeradd
R 2418 14 1047 mqc_algebra mqc_realscalaradd
R 2423 14 1052 mqc_algebra mqc_scalarrealadd
R 2428 14 1057 mqc_algebra mqc_complexscalaradd
R 2433 14 1062 mqc_algebra mqc_scalarcomplexadd
R 2438 14 1067 mqc_algebra mqc_integerscalarsubtract
R 2443 14 1072 mqc_algebra mqc_scalarintegersubtract
R 2448 14 1077 mqc_algebra mqc_realscalarsubtract
R 2453 14 1082 mqc_algebra mqc_scalarrealsubtract
R 2458 14 1087 mqc_algebra mqc_complexscalarsubtract
R 2463 14 1092 mqc_algebra mqc_scalarcomplexsubtract
R 2475 14 1104 mqc_algebra mqcscalar2character
R 2487 14 1116 mqc_algebra mqc_length_vector
R 2541 14 1170 mqc_algebra mqc_set_vector2integerarray
R 2546 14 1175 mqc_algebra mqc_set_vector2realarray
R 2551 14 1180 mqc_algebra mqc_set_vector2complexarray
R 2556 14 1185 mqc_algebra mqc_set_array2vector_integer
R 2564 14 1193 mqc_algebra mqc_set_array2vector_real
R 2572 14 1201 mqc_algebra mqc_set_array2vector_complex
R 2580 14 1209 mqc_algebra mqc_set_vector2vector
R 2584 14 1213 mqc_algebra mqc_vectorvectorsum
R 2589 14 1218 mqc_algebra mqc_vectorvectordifference
R 2594 14 1223 mqc_algebra mqc_scalarvectorsum
R 2599 14 1228 mqc_algebra mqc_vectorscalarsum
R 2604 14 1233 mqc_algebra mqc_scalarvectordifference
R 2613 14 1242 mqc_algebra mqc_vector_transpose
R 2617 14 1246 mqc_algebra mqc_vector_conjugate_transpose
R 2622 14 1251 mqc_algebra mqc_vectorvectordotproduct
R 2642 14 1271 mqc_algebra mqc_print_vector_algebra1
R 2696 14 1325 mqc_algebra mqc_scalarvectorproduct
R 2701 14 1330 mqc_algebra mqc_vectorscalarproduct
R 2706 14 1335 mqc_algebra mqc_vectorscalardivide
R 2711 14 1340 mqc_algebra mqc_realvectorproduct
R 2716 14 1345 mqc_algebra mqc_vectorrealproduct
R 2721 14 1350 mqc_algebra mqc_vectorrealdivide
R 2726 14 1355 mqc_algebra mqc_integervectorproduct
R 2731 14 1360 mqc_algebra mqc_vectorintegerproduct
R 2736 14 1365 mqc_algebra mqc_vectorintegerdivide
R 2741 14 1370 mqc_algebra mqc_complexvectorproduct
R 2746 14 1375 mqc_algebra mqc_vectorcomplexproduct
R 2751 14 1380 mqc_algebra mqc_vectorcomplexdivide
R 2855 14 1484 mqc_algebra mqc_vector_sum
R 2863 14 1492 mqc_algebra mqc_vector_complex_conjugate
R 3037 14 1666 mqc_algebra mqc_elementmatrixproduct
R 3077 14 1706 mqc_algebra mqc_set_integerarray2matrix
R 3088 14 1717 mqc_algebra mqc_set_realarray2matrix
R 3099 14 1728 mqc_algebra mqc_set_complexarray2matrix
R 3110 14 1739 mqc_algebra mqc_set_matrix2integerarray
R 3115 14 1744 mqc_algebra mqc_set_matrix2realarray
R 3120 14 1749 mqc_algebra mqc_set_matrix2complexarray
R 3125 14 1754 mqc_algebra mqc_set_matrix2matrix
R 3133 14 1762 mqc_algebra mqc_print_matrix_algebra1
R 3163 14 1792 mqc_algebra mqc_matrix_size
R 3191 14 1820 mqc_algebra mqc_matrix_transpose
R 3195 14 1824 mqc_algebra mqc_matrix_conjugate_transpose
R 3272 14 1901 mqc_algebra mqc_matrixmatrixsum
R 3277 14 1906 mqc_algebra mqc_matrixmatrixsubtract
R 3282 14 1911 mqc_algebra mqc_matrixmatrixdotproduct
R 3287 14 1916 mqc_algebra mqc_matrixvectordotproduct
R 3292 14 1921 mqc_algebra mqc_vectormatrixdotproduct
R 3297 14 1926 mqc_algebra mqc_matrixscalarproduct
R 3302 14 1931 mqc_algebra mqc_scalarmatrixproduct
R 3307 14 1936 mqc_algebra mqc_integermatrixproduct
R 3312 14 1941 mqc_algebra mqc_matrixintegerproduct
R 3317 14 1946 mqc_algebra mqc_realmatrixproduct
R 3322 14 1951 mqc_algebra mqc_matrixrealproduct
R 3327 14 1956 mqc_algebra mqc_complexmatrixproduct
R 3332 14 1961 mqc_algebra mqc_matrixcomplexproduct
R 3337 14 1966 mqc_algebra mqc_matrixscalardivide
R 3344 14 1973 mqc_algebra mqc_matrix_matrix_contraction
R 3507 14 2136 mqc_algebra mqc_matrix_complex_conjugate
R 3523 14 2152 mqc_algebra mqc_matrix_sum
R 3586 14 2215 mqc_algebra mqc_print_r4tensor_algebra1
R 3590 14 2219 mqc_algebra mqc_set_integerarray2tensor
R 3607 14 2236 mqc_algebra mqc_set_realarray2tensor
R 3624 14 2253 mqc_algebra mqc_set_complexarray2tensor
R 3641 14 2270 mqc_algebra mqc_set_tensor2integerarray
R 3646 14 2275 mqc_algebra mqc_set_tensor2realarray
R 3651 14 2280 mqc_algebra mqc_set_tensor2complexarray
R 3709 14 2338 mqc_algebra mqc_r4tensor_size
R 3736 14 2365 mqc_algebra mqc_r4tensor_r4tensor_contraction
R 3741 14 2370 mqc_algebra mqc_r4tensor_r4tensor_sum
R 3746 14 2375 mqc_algebra mqc_r4tensor_r4tensor_difference
R 3899 14 2528 mqc_algebra mqc_r4tensorscalardivide
R 3906 14 2535 mqc_algebra mqc_scalarr4tensorproduct
R 3913 14 2542 mqc_algebra mqc_r4tensorscalarproduct
R 3919 14 2548 mqc_algebra mqc_r4tensor_complex_conjugate
R 3932 14 2561 mqc_algebra put_int$tbp
R 3933 14 2562 mqc_algebra put_sca$tbp
R 3937 14 2566 mqc_algebra at_int$tbp
R 3938 14 2567 mqc_algebra at_sca$tbp
R 3943 14 2572 mqc_algebra put_int$tbp
R 3944 14 2573 mqc_algebra put_sca$tbp
R 3948 14 2577 mqc_algebra at_int$tbp
R 3949 14 2578 mqc_algebra at_sca$tbp
S 3986 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 3989 25 3 mqc_datastructures mqc_linkedlist
R 3992 5 6 mqc_datastructures val mqc_linkedlist
R 3994 5 8 mqc_datastructures val$td mqc_linkedlist
R 3995 5 9 mqc_datastructures val$p mqc_linkedlist
R 3996 5 10 mqc_datastructures previous mqc_linkedlist
R 3998 5 12 mqc_datastructures previous$p mqc_linkedlist
R 3999 5 13 mqc_datastructures next mqc_linkedlist
R 4001 5 15 mqc_datastructures next$p mqc_linkedlist
S 4103 3 0 0 0 22 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 24266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1 20
S 4104 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 4106 25 1 mqc_files mqc_fileinfo
R 4107 5 2 mqc_files filename mqc_fileinfo
R 4108 5 3 mqc_files currentlyopen mqc_fileinfo
R 4109 5 4 mqc_files unitnumber mqc_fileinfo
R 4110 5 5 mqc_files isopen$tbp$0 mqc_fileinfo
R 4113 25 8 mqc_files mqc_text_fileinfo
R 4114 5 9 mqc_files mqc_fileinfo mqc_text_fileinfo
R 4115 5 10 mqc_files buffer mqc_text_fileinfo
R 4116 5 11 mqc_files buffer_caps mqc_text_fileinfo
R 4117 5 12 mqc_files buffer_loaded mqc_text_fileinfo
R 4118 5 13 mqc_files buffer_cursor mqc_text_fileinfo
R 4119 5 14 mqc_files inside_quotes mqc_text_fileinfo
R 4120 5 15 mqc_files skip_multiple_delimits mqc_text_fileinfo
R 4121 5 16 mqc_files isopen$tbp$1 mqc_text_fileinfo
R 4122 5 17 mqc_files writeline$tbp$2 mqc_text_fileinfo
R 4123 5 18 mqc_files getnextinteger$tbp$3 mqc_text_fileinfo
R 4124 5 19 mqc_files getnextstring$tbp$4 mqc_text_fileinfo
R 4125 5 20 mqc_files getbuffer$tbp$5 mqc_text_fileinfo
R 4126 5 21 mqc_files loadbuffer$tbp$6 mqc_text_fileinfo
R 4127 5 22 mqc_files rewind$tbp$7 mqc_text_fileinfo
R 4128 5 23 mqc_files closefile$tbp$8 mqc_text_fileinfo
R 4129 5 24 mqc_files openfile$tbp$9 mqc_text_fileinfo
R 4301 25 1 mqc_molecule mqc_molecule_data
R 4302 5 2 mqc_molecule natoms mqc_molecule_data
R 4303 5 3 mqc_molecule atomic_numbers mqc_molecule_data
R 4304 5 4 mqc_molecule atomic_masses mqc_molecule_data
R 4305 5 5 mqc_molecule nuclear_charges mqc_molecule_data
R 4306 5 6 mqc_molecule cartesian_coordinates mqc_molecule_data
R 4308 5 8 mqc_molecule updatemoldata$tbp$0 mqc_molecule_data
R 4309 5 9 mqc_molecule getnumatoms$tbp$1 mqc_molecule_data
R 4310 5 10 mqc_molecule getnucrep$tbp$2 mqc_molecule_data
R 4311 5 11 mqc_molecule print$tbp$3 mqc_molecule_data
R 4387 14 87 mqc_molecule mqc_print_nuclear_geometry
R 4407 25 3 mqc_algebra2 mqc_variable
R 4408 5 4 mqc_algebra2 rank mqc_variable
R 4409 5 5 mqc_algebra2 datatype mqc_variable
R 4410 5 6 mqc_algebra2 storageformat mqc_variable
R 4411 5 7 mqc_algebra2 dimensions mqc_variable
R 4413 5 9 mqc_algebra2 realarray mqc_variable
R 4414 5 10 mqc_algebra2 realarray$sd mqc_variable
R 4415 5 11 mqc_algebra2 realarray$p mqc_variable
R 4416 5 12 mqc_algebra2 realarray$o mqc_variable
R 4419 5 15 mqc_algebra2 integerarray mqc_variable
R 4420 5 16 mqc_algebra2 integerarray$sd mqc_variable
R 4421 5 17 mqc_algebra2 integerarray$p mqc_variable
R 4422 5 18 mqc_algebra2 integerarray$o mqc_variable
R 4424 5 20 mqc_algebra2 initialized mqc_variable
R 4433 14 29 mqc_algebra2 mqc_variable_put_mqc$tbp
R 4435 14 31 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp
R 4437 14 33 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp
R 4444 5 40 mqc_algebra2 submatrix$tbp$0 mqc_variable
R 4445 5 41 mqc_algebra2 det$tbp$1 mqc_variable
R 4446 5 42 mqc_algebra2 diag$tbp$2 mqc_variable
R 4447 5 43 mqc_algebra2 eigen$tbp$3 mqc_variable
R 4448 5 44 mqc_algebra2 column$tbp$4 mqc_variable
R 4449 5 45 mqc_algebra2 rpower$tbp$5 mqc_variable
R 4450 5 46 mqc_algebra2 ipower$tbp$6 mqc_variable
R 4451 5 47 mqc_algebra2 isconformable$tbp$7 mqc_variable
R 4452 5 48 mqc_algebra2 print$tbp$8 mqc_variable
R 4453 5 49 mqc_algebra2 gettype$tbp$9 mqc_variable
R 4454 5 50 mqc_algebra2 getrank$tbp$10 mqc_variable
R 4455 5 51 mqc_algebra2 getval$tbp$11 mqc_variable
R 4456 5 52 mqc_algebra2 put$tbpg$12 mqc_variable
R 4457 5 53 mqc_algebra2 put$tbpg$13 mqc_variable
R 4458 5 54 mqc_algebra2 put$tbpg$14 mqc_variable
R 4459 5 55 mqc_algebra2 putmqc$tbp$15 mqc_variable
R 4460 5 56 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp$16 mqc_variable
R 4461 5 57 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp$17 mqc_variable
R 4462 5 58 mqc_algebra2 mqc_variable_put_mqc$tbp$18 mqc_variable
R 4463 5 59 mqc_algebra2 clear$tbpg$19 mqc_variable
R 4464 5 60 mqc_algebra2 clear$tbpg$20 mqc_variable
R 4465 5 61 mqc_algebra2 clear$tbpg$21 mqc_variable
R 4466 5 62 mqc_algebra2 mqc_variable_clear_real$tbp$22 mqc_variable
R 4467 5 63 mqc_algebra2 mqc_variable_clear_integer$tbp$23 mqc_variable
R 4468 5 64 mqc_algebra2 mqc_variable_clear_mqc$tbp$24 mqc_variable
R 4469 5 65 mqc_algebra2 init$tbp$25 mqc_variable
R 4520 26 116 mqc_algebra2 conformable
R 4582 14 178 mqc_algebra2 mqc_variable_getsize
R 4615 14 211 mqc_algebra2 mqc_print_mqcvariable
R 4732 14 328 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_integer
R 4736 14 332 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_real
R 4740 14 336 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_integer
R 4748 14 344 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_real
R 4756 14 352 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_integer
R 4767 14 363 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_real
R 4778 14 374 mqc_algebra2 mqc_variable_setval_intrinsicrank42mqcrank4_real
R 4795 14 391 mqc_algebra2 mqc_variable_mqc2intrinsicintegerscalar
R 4799 14 395 mqc_algebra2 mqc_variable_mqc2intrinsicrealscalar
R 4803 14 399 mqc_algebra2 mqc_variable_mqc2intrinsicinteger1array
R 4808 14 404 mqc_algebra2 mqc_variable_mqc2intrinsicreal1array
R 4813 14 409 mqc_algebra2 mqc_variable_mqc2intrinsicinteger2array
R 4818 14 414 mqc_algebra2 mqc_variable_mqc2intrinsicreal2array
R 4823 14 419 mqc_algebra2 mqc_variable_mqc2intrinsicreal4array
R 4836 14 432 mqc_algebra2 mqc_variable_int_scalar
R 4840 14 436 mqc_algebra2 mqc_variable_float_scalar
R 4844 14 440 mqc_algebra2 mqc_variable_matrix_transpose
R 4849 14 445 mqc_algebra2 mqc_variable_addition
R 4854 14 450 mqc_algebra2 mqc_variable_subtraction
R 4859 14 455 mqc_algebra2 mqc_variable_multiplication
R 4864 14 460 mqc_algebra2 mqc_variable_division
R 4879 14 475 mqc_algebra2 mqc_variable_array_sum
R 4890 14 486 mqc_algebra2 mqc_variable_contraction_full
R 4895 14 491 mqc_algebra2 mqc_variable_dot_product
R 4905 14 501 mqc_algebra2 mqc_variable_matrix_multiplication
R 4928 25 4 mqc_est mqc_scf_integral
R 4929 5 5 mqc_est alpha mqc_scf_integral
R 4930 5 6 mqc_est beta mqc_scf_integral
R 4931 5 7 mqc_est alphabeta mqc_scf_integral
R 4932 5 8 mqc_est betaalpha mqc_scf_integral
R 4933 5 9 mqc_est array_name mqc_scf_integral
R 4934 5 10 mqc_est array_type mqc_scf_integral
R 4936 5 12 mqc_est energy_list mqc_scf_integral
R 4937 5 13 mqc_est energy_list$sd mqc_scf_integral
R 4938 5 14 mqc_est energy_list$p mqc_scf_integral
R 4939 5 15 mqc_est energy_list$o mqc_scf_integral
R 4943 5 19 mqc_est swapodb$tbp$0 mqc_scf_integral
R 4944 5 20 mqc_est combine$tbp$1 mqc_scf_integral
R 4945 5 21 mqc_est swap$tbp$2 mqc_scf_integral
R 4946 5 22 mqc_est orbitals$tbp$3 mqc_scf_integral
R 4947 5 23 mqc_est deleteelist$tbp$4 mqc_scf_integral
R 4948 5 24 mqc_est getelist$tbp$5 mqc_scf_integral
R 4949 5 25 mqc_est setelist$tbp$6 mqc_scf_integral
R 4950 5 26 mqc_est at$tbp$7 mqc_scf_integral
R 4951 5 27 mqc_est power$tbp$8 mqc_scf_integral
R 4952 5 28 mqc_est norm$tbp$9 mqc_scf_integral
R 4953 5 29 mqc_est det$tbp$10 mqc_scf_integral
R 4954 5 30 mqc_est trace$tbp$11 mqc_scf_integral
R 4955 5 31 mqc_est inv$tbp$12 mqc_scf_integral
R 4956 5 32 mqc_est eigensys$tbp$13 mqc_scf_integral
R 4957 5 33 mqc_est svd$tbp$14 mqc_scf_integral
R 4958 5 34 mqc_est diag$tbp$15 mqc_scf_integral
R 4959 5 35 mqc_est init$tbp$16 mqc_scf_integral
R 4960 5 36 mqc_est identity$tbp$17 mqc_scf_integral
R 4961 5 37 mqc_est getblock$tbp$18 mqc_scf_integral
R 4962 5 38 mqc_est addlabel$tbp$19 mqc_scf_integral
R 4963 5 39 mqc_est getlabel$tbp$20 mqc_scf_integral
R 4964 5 40 mqc_est blocksize$tbp$21 mqc_scf_integral
R 4965 5 41 mqc_est type$tbp$22 mqc_scf_integral
R 4966 5 42 mqc_est hasbetaalpha$tbp$23 mqc_scf_integral
R 4967 5 43 mqc_est hasalphabeta$tbp$24 mqc_scf_integral
R 4968 5 44 mqc_est hasbeta$tbp$25 mqc_scf_integral
R 4969 5 45 mqc_est hasalpha$tbp$26 mqc_scf_integral
R 4970 5 46 mqc_est print$tbp$27 mqc_scf_integral
R 4973 25 49 mqc_est mqc_scf_eigenvalues
R 4974 5 50 mqc_est alpha mqc_scf_eigenvalues
R 4975 5 51 mqc_est beta mqc_scf_eigenvalues
R 4976 5 52 mqc_est array_name mqc_scf_eigenvalues
R 4977 5 53 mqc_est array_type mqc_scf_eigenvalues
R 4979 5 55 mqc_est at$tbp$28 mqc_scf_eigenvalues
R 4980 5 56 mqc_est power$tbp$29 mqc_scf_eigenvalues
R 4981 5 57 mqc_est getblock$tbp$30 mqc_scf_eigenvalues
R 4982 5 58 mqc_est addlabel$tbp$31 mqc_scf_eigenvalues
R 4983 5 59 mqc_est getlabel$tbp$32 mqc_scf_eigenvalues
R 4984 5 60 mqc_est blocksize$tbp$33 mqc_scf_eigenvalues
R 4985 5 61 mqc_est type$tbp$34 mqc_scf_eigenvalues
R 4986 5 62 mqc_est hasbeta$tbp$35 mqc_scf_eigenvalues
R 4987 5 63 mqc_est hasalpha$tbp$36 mqc_scf_eigenvalues
R 4988 5 64 mqc_est print$tbp$37 mqc_scf_eigenvalues
R 4991 25 67 mqc_est mqc_wavefunction
R 4992 5 68 mqc_est mo_coefficients mqc_wavefunction
R 4993 5 69 mqc_est mo_energies mqc_wavefunction
R 4994 5 70 mqc_est mo_symmetries mqc_wavefunction
R 4995 5 71 mqc_est core_hamiltonian mqc_wavefunction
R 4996 5 72 mqc_est fock_matrix mqc_wavefunction
R 4997 5 73 mqc_est density_matrix mqc_wavefunction
R 4998 5 74 mqc_est scf_density_matrix mqc_wavefunction
R 4999 5 75 mqc_est overlap_matrix mqc_wavefunction
R 5000 5 76 mqc_est nalpha mqc_wavefunction
R 5001 5 77 mqc_est nbeta mqc_wavefunction
R 5002 5 78 mqc_est nelectrons mqc_wavefunction
R 5003 5 79 mqc_est nbasis mqc_wavefunction
R 5004 5 80 mqc_est charge mqc_wavefunction
R 5005 5 81 mqc_est multiplicity mqc_wavefunction
R 5006 5 82 mqc_est basis mqc_wavefunction
R 5007 5 83 mqc_est symmetry mqc_wavefunction
R 5008 5 84 mqc_est wf_type mqc_wavefunction
R 5009 5 85 mqc_est wf_complex mqc_wavefunction
R 5011 5 87 mqc_est print$tbp$38 mqc_wavefunction
R 5014 25 90 mqc_est mqc_basis_set
R 5015 5 91 mqc_est sh2atmp mqc_basis_set
R 5016 5 92 mqc_est shltyp mqc_basis_set
R 5017 5 93 mqc_est nprmsh mqc_basis_set
R 5018 5 94 mqc_est prmexp mqc_basis_set
R 5019 5 95 mqc_est concoef mqc_basis_set
R 5020 5 96 mqc_est concotwo mqc_basis_set
R 5021 5 97 mqc_est shcoor mqc_basis_set
R 5024 25 100 mqc_est mqc_pscf_wavefunction
R 5025 5 101 mqc_est mqc_wavefunction mqc_pscf_wavefunction
R 5026 5 102 mqc_est ncore mqc_pscf_wavefunction
R 5027 5 103 mqc_est nval mqc_pscf_wavefunction
R 5028 5 104 mqc_est nactive mqc_pscf_wavefunction
R 5029 5 105 mqc_est nfrz mqc_pscf_wavefunction
R 5030 5 106 mqc_est pscf_amplitudes mqc_pscf_wavefunction
R 5031 5 107 mqc_est pscf_energies mqc_pscf_wavefunction
R 5032 5 108 mqc_est print$tbp$39 mqc_pscf_wavefunction
R 5035 25 111 mqc_est mqc_determinant_string
R 5036 5 112 mqc_est alpha mqc_determinant_string
R 5037 5 113 mqc_est beta mqc_determinant_string
R 5040 25 116 mqc_est mqc_determinant
R 5041 5 117 mqc_est strings mqc_determinant
R 5042 5 118 mqc_est order mqc_determinant
R 5043 5 119 mqc_est ndets mqc_determinant
R 5044 5 120 mqc_est nalpstr mqc_determinant
R 5045 5 121 mqc_est nbetstr mqc_determinant
R 5046 5 122 mqc_est nsubsalpha mqc_determinant
R 5047 5 123 mqc_est nsubsbeta mqc_determinant
R 5050 25 126 mqc_est mqc_twoeris
R 5051 5 127 mqc_est alpha mqc_twoeris
R 5052 5 128 mqc_est beta mqc_twoeris
R 5053 5 129 mqc_est alphabeta mqc_twoeris
R 5054 5 130 mqc_est betaalpha mqc_twoeris
R 5055 5 131 mqc_est aaab mqc_twoeris
R 5056 5 132 mqc_est aaba mqc_twoeris
R 5057 5 133 mqc_est abaa mqc_twoeris
R 5058 5 134 mqc_est baaa mqc_twoeris
R 5059 5 135 mqc_est abab mqc_twoeris
R 5060 5 136 mqc_est baab mqc_twoeris
R 5061 5 137 mqc_est baba mqc_twoeris
R 5062 5 138 mqc_est abba mqc_twoeris
R 5063 5 139 mqc_est bbba mqc_twoeris
R 5064 5 140 mqc_est bbab mqc_twoeris
R 5065 5 141 mqc_est babb mqc_twoeris
R 5066 5 142 mqc_est abbb mqc_twoeris
R 5067 5 143 mqc_est integraltype mqc_twoeris
R 5068 5 144 mqc_est storagetype mqc_twoeris
R 5070 5 146 mqc_est type$tbp$40 mqc_twoeris
R 5071 5 147 mqc_est getblock$tbp$41 mqc_twoeris
R 5072 5 148 mqc_est hasspinblock$tbp$42 mqc_twoeris
R 5073 5 149 mqc_est blocksize$tbp$43 mqc_twoeris
R 5074 5 150 mqc_est at$tbp$44 mqc_twoeris
R 5075 5 151 mqc_est print$tbp$45 mqc_twoeris
R 5163 14 239 mqc_est mqc_print_wavefunction
R 5171 14 247 mqc_est mqc_print_integral
R 5179 14 255 mqc_est mqc_print_eigenvalues
R 5186 14 262 mqc_est mqc_print_twoeris
R 5403 14 479 mqc_est mqc_integral_output_array
R 5407 14 483 mqc_est mqc_eigenvalues_output_array
R 5411 14 487 mqc_est mqc_2eris_output_array
R 5417 14 493 mqc_est mqc_integral_matrix_multiply
R 5423 14 499 mqc_est mqc_matrix_integral_multiply
R 5428 14 504 mqc_est mqc_integral_sum
R 5433 14 509 mqc_est mqc_integral_difference
R 5438 14 514 mqc_est mqc_matrix_integral_difference
R 5444 14 520 mqc_est mqc_integral_integral_multiply
R 5449 14 525 mqc_est mqc_scalar_integral_multiply
R 5456 14 532 mqc_est mqc_integral_scalar_multiply
R 5464 14 540 mqc_est mqc_integral_eigenvalues_multiply
R 5470 14 546 mqc_est mqc_eigenvalues_integral_multiply
R 5476 14 552 mqc_est mqc_eigenvalues_eigenvalues_multiply
R 5481 14 557 mqc_est mqc_eigenvalue_eigenvalue_dotproduct
R 5486 14 562 mqc_est mqc_integral_transpose
R 5491 14 567 mqc_est mqc_integral_conjugate_transpose
R 5518 14 594 mqc_est mqc_scf_integral_contraction
R 5525 14 601 mqc_est mqc_eri_integral_contraction
R 5535 14 611 mqc_est mqc_eri_r4tensor_contraction
R 5575 14 651 mqc_est mqc_scf_integral_conjg
R 6564 25 1 mqc_gaussian mqc_gaussian_fchk_file
R 6565 5 2 mqc_gaussian mqc_text_fileinfo mqc_gaussian_fchk_file
R 6566 5 3 mqc_gaussian title mqc_gaussian_fchk_file
R 6567 5 4 mqc_gaussian jobtype mqc_gaussian_fchk_file
R 6568 5 5 mqc_gaussian method mqc_gaussian_fchk_file
R 6569 5 6 mqc_gaussian basisset mqc_gaussian_fchk_file
R 6570 5 7 mqc_gaussian closefile$tbp$0 mqc_gaussian_fchk_file
R 6571 5 8 mqc_gaussian rewind$tbp$1 mqc_gaussian_fchk_file
R 6572 5 9 mqc_gaussian loadbuffer$tbp$2 mqc_gaussian_fchk_file
R 6573 5 10 mqc_gaussian getbuffer$tbp$3 mqc_gaussian_fchk_file
R 6574 5 11 mqc_gaussian getnextstring$tbp$5 mqc_gaussian_fchk_file
R 6575 5 12 mqc_gaussian getnextinteger$tbp$6 mqc_gaussian_fchk_file
R 6576 5 13 mqc_gaussian writeline$tbp$7 mqc_gaussian_fchk_file
R 6577 5 14 mqc_gaussian isopen$tbp$8 mqc_gaussian_fchk_file
R 6578 5 15 mqc_gaussian openfile$tbp$10 mqc_gaussian_fchk_file
R 6581 25 18 mqc_gaussian mqc_gaussian_unformatted_matrix_file
R 6582 5 19 mqc_gaussian mqc_fileinfo mqc_gaussian_unformatted_matrix_file
R 6583 5 20 mqc_gaussian declared mqc_gaussian_unformatted_matrix_file
R 6584 5 21 mqc_gaussian header_read mqc_gaussian_unformatted_matrix_file
R 6585 5 22 mqc_gaussian header_written mqc_gaussian_unformatted_matrix_file
R 6586 5 23 mqc_gaussian gaussianscalars_read mqc_gaussian_unformatted_matrix_file
R 6587 5 24 mqc_gaussian readwritemode mqc_gaussian_unformatted_matrix_file
R 6588 5 25 mqc_gaussian labfil mqc_gaussian_unformatted_matrix_file
R 6589 5 26 mqc_gaussian gvers mqc_gaussian_unformatted_matrix_file
R 6590 5 27 mqc_gaussian title mqc_gaussian_unformatted_matrix_file
R 6591 5 28 mqc_gaussian natoms mqc_gaussian_unformatted_matrix_file
R 6593 5 30 mqc_gaussian natoms$p mqc_gaussian_unformatted_matrix_file
R 6594 5 31 mqc_gaussian nbasis mqc_gaussian_unformatted_matrix_file
R 6596 5 33 mqc_gaussian nbasis$p mqc_gaussian_unformatted_matrix_file
R 6597 5 34 mqc_gaussian nbasisuse mqc_gaussian_unformatted_matrix_file
R 6599 5 36 mqc_gaussian nbasisuse$p mqc_gaussian_unformatted_matrix_file
R 6600 5 37 mqc_gaussian icharge mqc_gaussian_unformatted_matrix_file
R 6602 5 39 mqc_gaussian icharge$p mqc_gaussian_unformatted_matrix_file
R 6603 5 40 mqc_gaussian multiplicity mqc_gaussian_unformatted_matrix_file
R 6605 5 42 mqc_gaussian multiplicity$p mqc_gaussian_unformatted_matrix_file
R 6606 5 43 mqc_gaussian nelectrons mqc_gaussian_unformatted_matrix_file
R 6608 5 45 mqc_gaussian nelectrons$p mqc_gaussian_unformatted_matrix_file
R 6609 5 46 mqc_gaussian icgu mqc_gaussian_unformatted_matrix_file
R 6611 5 48 mqc_gaussian icgu$p mqc_gaussian_unformatted_matrix_file
R 6612 5 49 mqc_gaussian nfc mqc_gaussian_unformatted_matrix_file
R 6614 5 51 mqc_gaussian nfc$p mqc_gaussian_unformatted_matrix_file
R 6615 5 52 mqc_gaussian nfv mqc_gaussian_unformatted_matrix_file
R 6617 5 54 mqc_gaussian nfv$p mqc_gaussian_unformatted_matrix_file
R 6618 5 55 mqc_gaussian itran mqc_gaussian_unformatted_matrix_file
R 6620 5 57 mqc_gaussian itran$p mqc_gaussian_unformatted_matrix_file
R 6621 5 58 mqc_gaussian idum9 mqc_gaussian_unformatted_matrix_file
R 6623 5 60 mqc_gaussian idum9$p mqc_gaussian_unformatted_matrix_file
R 6624 5 61 mqc_gaussian nshlao mqc_gaussian_unformatted_matrix_file
R 6626 5 63 mqc_gaussian nshlao$p mqc_gaussian_unformatted_matrix_file
R 6627 5 64 mqc_gaussian nprmao mqc_gaussian_unformatted_matrix_file
R 6629 5 66 mqc_gaussian nprmao$p mqc_gaussian_unformatted_matrix_file
R 6630 5 67 mqc_gaussian nshldb mqc_gaussian_unformatted_matrix_file
R 6632 5 69 mqc_gaussian nshldb$p mqc_gaussian_unformatted_matrix_file
R 6633 5 70 mqc_gaussian nprmdb mqc_gaussian_unformatted_matrix_file
R 6635 5 72 mqc_gaussian nprmdb$p mqc_gaussian_unformatted_matrix_file
R 6636 5 73 mqc_gaussian nbtot mqc_gaussian_unformatted_matrix_file
R 6638 5 75 mqc_gaussian nbtot$p mqc_gaussian_unformatted_matrix_file
R 6640 5 77 mqc_gaussian atomicnumbers mqc_gaussian_unformatted_matrix_file
R 6641 5 78 mqc_gaussian atomicnumbers$sd mqc_gaussian_unformatted_matrix_file
R 6642 5 79 mqc_gaussian atomicnumbers$p mqc_gaussian_unformatted_matrix_file
R 6643 5 80 mqc_gaussian atomicnumbers$o mqc_gaussian_unformatted_matrix_file
R 6645 5 82 mqc_gaussian atomtypes mqc_gaussian_unformatted_matrix_file
R 6647 5 84 mqc_gaussian atomtypes$sd mqc_gaussian_unformatted_matrix_file
R 6648 5 85 mqc_gaussian atomtypes$p mqc_gaussian_unformatted_matrix_file
R 6649 5 86 mqc_gaussian atomtypes$o mqc_gaussian_unformatted_matrix_file
R 6651 5 88 mqc_gaussian basisfunction2atom mqc_gaussian_unformatted_matrix_file
R 6653 5 90 mqc_gaussian basisfunction2atom$sd mqc_gaussian_unformatted_matrix_file
R 6654 5 91 mqc_gaussian basisfunction2atom$p mqc_gaussian_unformatted_matrix_file
R 6655 5 92 mqc_gaussian basisfunction2atom$o mqc_gaussian_unformatted_matrix_file
R 6657 5 94 mqc_gaussian ibasisfunctiontype mqc_gaussian_unformatted_matrix_file
R 6659 5 96 mqc_gaussian ibasisfunctiontype$sd mqc_gaussian_unformatted_matrix_file
R 6660 5 97 mqc_gaussian ibasisfunctiontype$p mqc_gaussian_unformatted_matrix_file
R 6661 5 98 mqc_gaussian ibasisfunctiontype$o mqc_gaussian_unformatted_matrix_file
R 6663 5 100 mqc_gaussian igaussianscalars mqc_gaussian_unformatted_matrix_file
R 6665 5 102 mqc_gaussian igaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6666 5 103 mqc_gaussian igaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6667 5 104 mqc_gaussian igaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6670 5 107 mqc_gaussian atomiccharges mqc_gaussian_unformatted_matrix_file
R 6671 5 108 mqc_gaussian atomiccharges$sd mqc_gaussian_unformatted_matrix_file
R 6672 5 109 mqc_gaussian atomiccharges$p mqc_gaussian_unformatted_matrix_file
R 6673 5 110 mqc_gaussian atomiccharges$o mqc_gaussian_unformatted_matrix_file
R 6675 5 112 mqc_gaussian atomicweights mqc_gaussian_unformatted_matrix_file
R 6677 5 114 mqc_gaussian atomicweights$sd mqc_gaussian_unformatted_matrix_file
R 6678 5 115 mqc_gaussian atomicweights$p mqc_gaussian_unformatted_matrix_file
R 6679 5 116 mqc_gaussian atomicweights$o mqc_gaussian_unformatted_matrix_file
R 6681 5 118 mqc_gaussian cartesians mqc_gaussian_unformatted_matrix_file
R 6683 5 120 mqc_gaussian cartesians$sd mqc_gaussian_unformatted_matrix_file
R 6684 5 121 mqc_gaussian cartesians$p mqc_gaussian_unformatted_matrix_file
R 6685 5 122 mqc_gaussian cartesians$o mqc_gaussian_unformatted_matrix_file
R 6687 5 124 mqc_gaussian gaussianscalars mqc_gaussian_unformatted_matrix_file
R 6689 5 126 mqc_gaussian gaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6690 5 127 mqc_gaussian gaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6691 5 128 mqc_gaussian gaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6693 5 130 mqc_gaussian isopen$tbp$11 mqc_gaussian_unformatted_matrix_file
R 6694 5 131 mqc_gaussian updateheader$tbp$12 mqc_gaussian_unformatted_matrix_file
R 6695 5 132 mqc_gaussian write2eris$tbp$13 mqc_gaussian_unformatted_matrix_file
R 6696 5 133 mqc_gaussian writeestobj$tbp$14 mqc_gaussian_unformatted_matrix_file
R 6697 5 134 mqc_gaussian writebasisdata$tbp$15 mqc_gaussian_unformatted_matrix_file
R 6698 5 135 mqc_gaussian writearray$tbp$16 mqc_gaussian_unformatted_matrix_file
R 6699 5 136 mqc_gaussian writearray2$tbp$17 mqc_gaussian_unformatted_matrix_file
R 6700 5 137 mqc_gaussian get2eris$tbp$18 mqc_gaussian_unformatted_matrix_file
R 6701 5 138 mqc_gaussian getestobj$tbp$19 mqc_gaussian_unformatted_matrix_file
R 6702 5 139 mqc_gaussian getmoldata$tbp$20 mqc_gaussian_unformatted_matrix_file
R 6703 5 140 mqc_gaussian getbasisdata$tbp$21 mqc_gaussian_unformatted_matrix_file
R 6704 5 141 mqc_gaussian getbasisarray$tbp$22 mqc_gaussian_unformatted_matrix_file
R 6705 5 142 mqc_gaussian getbasisinfo$tbp$23 mqc_gaussian_unformatted_matrix_file
R 6706 5 143 mqc_gaussian getatominfo$tbp$24 mqc_gaussian_unformatted_matrix_file
R 6707 5 144 mqc_gaussian getarray$tbp$25 mqc_gaussian_unformatted_matrix_file
R 6708 5 145 mqc_gaussian getvalreal$tbp$26 mqc_gaussian_unformatted_matrix_file
R 6709 5 146 mqc_gaussian getval$tbp$27 mqc_gaussian_unformatted_matrix_file
R 6710 5 147 mqc_gaussian getatomweights$tbp$28 mqc_gaussian_unformatted_matrix_file
R 6711 5 148 mqc_gaussian getatomcarts$tbp$29 mqc_gaussian_unformatted_matrix_file
R 6712 5 149 mqc_gaussian getatomicnumbers$tbp$30 mqc_gaussian_unformatted_matrix_file
R 6713 5 150 mqc_gaussian iscomplex$tbp$31 mqc_gaussian_unformatted_matrix_file
R 6714 5 151 mqc_gaussian isgeneral$tbp$32 mqc_gaussian_unformatted_matrix_file
R 6715 5 152 mqc_gaussian isunrestricted$tbp$33 mqc_gaussian_unformatted_matrix_file
R 6716 5 153 mqc_gaussian isrestricted$tbp$34 mqc_gaussian_unformatted_matrix_file
R 6717 5 154 mqc_gaussian create$tbp$35 mqc_gaussian_unformatted_matrix_file
R 6718 5 155 mqc_gaussian load$tbp$36 mqc_gaussian_unformatted_matrix_file
R 6719 5 156 mqc_gaussian closefile$tbp$37 mqc_gaussian_unformatted_matrix_file
R 6720 5 157 mqc_gaussian openfile$tbp$38 mqc_gaussian_unformatted_matrix_file
R 6723 25 160 mqc_gaussian mqc_gaussian_molecule_data
R 6724 5 161 mqc_gaussian mqc_molecule_data mqc_gaussian_molecule_data
R 6725 5 162 mqc_gaussian charge mqc_gaussian_molecule_data
R 6726 5 163 mqc_gaussian multiplicity mqc_gaussian_molecule_data
R 6727 5 164 mqc_gaussian print$tbp$40 mqc_gaussian_molecule_data
R 6728 5 165 mqc_gaussian getnucrep$tbp$41 mqc_gaussian_molecule_data
R 6729 5 166 mqc_gaussian getnumatoms$tbp$42 mqc_gaussian_molecule_data
R 6730 5 167 mqc_gaussian updatemoldata$tbp$43 mqc_gaussian_molecule_data
R 7085 25 6 iso_c_binding c_ptr
R 7086 5 7 iso_c_binding val c_ptr
R 7088 25 9 iso_c_binding c_funptr
R 7089 5 10 iso_c_binding val c_funptr
R 7123 6 44 iso_c_binding c_null_ptr$ac
R 7125 6 46 iso_c_binding c_null_funptr$ac
R 7126 26 47 iso_c_binding ==
R 7128 26 49 iso_c_binding !=
S 7603 16 0 0 0 7 1 626 6661 4 400000 A 0 0 0 0 B 0 21 0 0 0 0 0 0 7604 1973 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 iout
S 7604 3 0 0 0 7 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 7605 19 0 0 0 7 1 626 5613 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1119 21 0 0 0 0 0 626 0 0 0 0 mqc_print
O 7605 21 4387 4615 3586 3133 2642 2039 5186 5179 5171 5163 1016 996 976 929 915 901 965 954 943 874 866
S 7606 19 0 0 0 7 1 626 6210 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1123 4 0 0 0 0 0 626 0 0 0 0 num2char
O 7606 4 2475 1049 1044 1039
S 7607 19 0 0 0 10 1 626 9545 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 at
S 7608 19 0 0 0 10 1 626 9603 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 put
S 7609 19 0 0 0 10 1 626 11809 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1299 6 0 0 0 0 0 626 0 0 0 0 contraction
O 7609 6 5535 5525 5518 4890 3736 3344
S 7610 19 0 0 0 10 1 626 2344 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1131 5 0 0 0 0 0 626 0 0 0 0 conjg
O 7610 5 5575 3919 3507 2863 2335
S 7611 19 0 0 0 10 1 626 2153 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1133 2 0 0 0 0 0 626 0 0 0 0 float
O 7611 2 4840 2096
S 7612 19 0 0 0 7 1 626 2585 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1135 2 0 0 0 0 0 626 0 0 0 0 int
O 7612 2 4836 2100
S 7613 19 0 0 0 7 1 626 2687 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1294 10 0 0 0 0 0 626 0 0 0 0 matmul
O 7613 10 5476 5470 5464 5444 5423 5417 4905 3292 3287 3282
S 7614 19 0 0 0 10 1 626 2794 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1296 4 0 0 0 0 0 626 0 0 0 0 transpose
O 7614 4 5486 4844 3191 2613
S 7615 19 0 0 0 10 1 626 12512 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1145 3 0 0 0 0 0 626 0 0 0 0 dagger
O 7615 3 5491 3195 2617
S 7616 19 0 0 0 10 1 626 2671 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1295 3 0 0 0 0 0 626 0 0 0 0 dot_product
O 7616 3 5481 4895 2622
S 7617 19 0 0 0 10 1 626 2783 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1150 3 0 0 0 0 0 626 0 0 0 0 sum
O 7617 3 4879 3523 2855
S 7618 19 0 0 0 10 1 626 2875 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1154 4 0 0 0 0 0 626 0 0 0 0 size
O 7618 4 4582 3709 3163 2487
S 7619 26 0 0 0 0 1 626 13854 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1198 44 0 0 0 0 0 626 0 0 0 0 =
O 7619 44 4823 4818 4813 4808 4803 4799 4795 4778 4767 4756 4748 4740 4736 4732 3651 3646 3641 3624 3607 3590 3099 3088 3077 3120 3115 3110 3125 2572 2564 2556 2551 2546 2541 2580 2031 2027 2023 2019 2015 2011 2007 5411 5407 5403
S 7620 26 0 0 0 0 1 626 14031 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1212 14 0 0 0 0 0 626 0 0 0 0 +
O 7620 14 4849 3741 3272 2599 2594 2584 2433 2428 2423 2418 2413 2408 2125 5428
S 7621 26 0 0 0 0 1 626 14167 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1226 14 0 0 0 0 0 626 0 0 0 0 -
O 7621 14 4854 3746 3277 2604 2589 2463 2458 2453 2448 2443 2438 2130 5438 5433
S 7622 26 0 0 0 0 1 626 14338 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1255 29 0 0 0 0 0 626 0 0 0 0 *
O 7622 29 4859 3037 2746 2741 2731 2726 2716 2711 3913 3906 3332 3327 3322 3317 3312 3307 3297 3302 2701 2696 2373 2368 2363 2358 2353 2348 2135 5456 5449
S 7623 26 0 0 0 0 1 626 14801 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1269 14 0 0 0 0 0 626 0 0 0 0 /
O 7623 14 4864 2751 2736 2721 3899 3337 2706 2403 2398 2393 2388 2383 2378 2140
S 7624 19 0 0 0 10 1 626 16850 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1288 11 0 0 0 0 0 626 0 0 0 0 put$tbpg
O 7624 11 3944 3943 3933 3932 1908 1907 1959 1958 4433 4435 4437
S 7625 19 0 0 0 10 1 626 16907 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1280 8 0 0 0 0 0 626 0 0 0 0 at$tbpg
O 7625 8 3938 3937 1915 1914 1963 1962 3949 3948
A 14 2 0 0 0 6 634 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 31 2 0 0 0 6 637 0 0 0 31 0 0 0 0 0 0 0 0 0 0 0
A 33 2 0 0 0 6 642 0 0 0 33 0 0 0 0 0 0 0 0 0 0 0
A 55 2 0 0 0 7 643 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0
A 56 2 0 0 0 7 644 0 0 0 56 0 0 0 0 0 0 0 0 0 0 0
A 62 1 0 1 0 63 666 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 68 1 0 1 0 69 668 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 72 1 0 3 0 75 670 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1084 2 0 0 874 19 1364 0 0 0 1084 0 0 0 0 0 0 0 0 0 0 0
A 1085 2 0 0 878 7 3986 0 0 0 1085 0 0 0 0 0 0 0 0 0 0 0
A 1110 2 0 0 464 22 4103 0 0 0 1110 0 0 0 0 0 0 0 0 0 0 0
A 1111 2 0 0 468 19 4104 0 0 0 1111 0 0 0 0 0 0 0 0 0 0 0
A 1356 2 0 0 766 7 1362 0 0 0 1356 0 0 0 0 0 0 0 0 0 0 0
A 1872 1 0 0 845 2395 7123 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1875 1 0 0 1524 2404 7125 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1973 2 0 0 1918 7 7604 0 0 0 1973 0 0 0 0 0 0 0 0 0 0 0
Z
J 69 1 1
V 62 63 7 0
R 0 66 0 0
A 0 6 0 0 1 3 1
A 0 6 0 0 1 31 1
A 0 6 0 0 1 33 1
A 0 6 0 0 1 14 0
J 71 1 1
V 68 69 7 0
R 0 72 0 0
A 0 6 0 0 1 3 1
A 0 6 0 0 1 31 1
A 0 6 0 0 1 33 1
A 0 6 0 0 1 14 0
J 73 1 1
V 72 75 7 0
R 0 78 0 0
A 0 6 0 0 1 33 1
A 0 6 0 0 1 14 0
J 131 1 1
V 1872 2395 7 0
S 0 2395 0 0 0
A 0 6 0 0 1 2 0
J 132 1 1
V 1875 2404 7 0
S 0 2404 0 0 0
A 0 6 0 0 1 2 0
T 1375 342 0 0 0 0
A 1378 7 359 0 1 2 1
A 1381 7 361 0 1 2 1
A 1384 7 363 0 1 2 0
T 1405 368 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 1481 395 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 1561 422 0 3 0 0
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 3989 958 0 3 0 0
A 3998 7 982 0 1 2 1
A 4001 7 984 0 1 2 0
T 4106 1094 0 3 0 0
A 4107 22 0 0 1 1110 1
A 4108 19 0 0 1 1111 1
A 4109 7 0 0 1 10 0
T 4113 1102 0 3 0 0
A 4115 22 0 0 1 1110 1
A 4116 22 0 0 1 1110 1
A 4117 19 0 0 1 1111 1
A 4118 7 0 0 1 10 1
A 4119 19 0 0 1 1111 1
A 4120 19 0 0 1 1084 1
T 4114 1094 0 3 0 0
A 4107 22 0 0 1 1110 1
A 4108 19 0 0 1 1111 1
A 4109 7 0 0 1 10 0
T 4301 1213 0 3 0 0
T 4302 1161 0 3 0 1
A 1378 7 1167 0 1 2 1
A 1381 7 1169 0 1 2 1
A 1384 7 1171 0 1 2 0
T 4303 1173 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4304 1173 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4305 1173 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4306 1179 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4407 1298 0 3 0 0
A 4408 7 0 0 1 1356 1
R 4411 1306 0 1
A 0 7 0 1085 1 10 0
A 4424 19 0 0 1 1111 0
T 4928 1495 0 3 0 0
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4973 1512 0 3 0 0
T 4974 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4975 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4991 1521 0 3 0 0
T 4992 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4993 1512 0 3 0 1
T 4974 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4975 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4994 1512 0 3 0 1
T 4974 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4975 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4995 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4996 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4997 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4998 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4999 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5000 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5001 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5002 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5003 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5004 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5005 1443 0 3 0 0
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5014 1529 0 3 0 0
T 5015 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5016 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5017 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5018 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5019 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5020 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5021 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5024 1538 0 3 0 0
T 5030 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5031 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 5025 1521 0 3 0 0
T 4992 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4993 1512 0 3 0 1
T 4974 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4975 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4994 1512 0 3 0 1
T 4974 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4975 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4995 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4996 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4997 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4998 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4999 1495 0 3 0 1
T 4929 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4930 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4931 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 4932 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5000 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5001 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5002 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5003 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5004 1443 0 3 0 1
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5005 1443 0 3 0 0
A 1378 7 1449 0 1 2 1
A 1381 7 1451 0 1 2 1
A 1384 7 1453 0 1 2 0
T 5035 1550 0 3 0 0
T 5036 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5037 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5040 1559 0 3 0 0
T 5041 1550 0 3 0 1
T 5036 1461 0 3 0 1
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5037 1461 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
T 5046 1455 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 5047 1455 0 3 0 0
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 5050 1568 0 3 0 0
T 5051 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5052 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5053 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5054 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5055 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5056 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5057 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5058 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5059 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5060 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5061 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5062 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5063 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5064 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5065 1467 0 3 0 1
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 5066 1467 0 3 0 0
A 1562 7 0 0 1 10 1
A 1563 7 0 0 1 10 1
A 1564 7 0 0 1 10 1
A 1565 7 0 0 1 10 0
T 6564 2160 0 3 0 0
T 6565 1997 0 3 0 0
A 4115 22 0 0 1 1110 1
A 4116 22 0 0 1 1110 1
A 4117 19 0 0 1 1111 1
A 4118 7 0 0 1 10 1
A 4119 19 0 0 1 1111 1
A 4120 19 0 0 1 1084 1
T 4114 1991 0 3 0 0
A 4107 22 0 0 1 1110 1
A 4108 19 0 0 1 1111 1
A 4109 7 0 0 1 10 0
T 6581 2175 0 3 0 0
A 6583 19 0 0 1 1111 1
A 6584 19 0 0 1 1111 1
A 6585 19 0 0 1 1111 1
A 6586 19 0 0 1 1111 1
A 6587 22 0 0 1 1110 1
A 6588 22 0 0 1 1110 1
A 6589 22 0 0 1 1110 1
A 6590 22 0 0 1 1110 1
T 6582 1991 0 3 0 0
A 4107 22 0 0 1 1110 1
A 4108 19 0 0 1 1111 1
A 4109 7 0 0 1 10 0
T 6723 2288 0 3 0 0
T 6725 2003 0 3 0 1
A 1378 7 2009 0 1 2 1
A 1381 7 2011 0 1 2 1
A 1384 7 2013 0 1 2 0
T 6726 2003 0 3 0 1
A 1378 7 2009 0 1 2 1
A 1381 7 2011 0 1 2 1
A 1384 7 2013 0 1 2 0
T 6724 2154 0 3 0 0
T 4302 2130 0 3 0 1
A 1378 7 2136 0 1 2 1
A 1381 7 2138 0 1 2 1
A 1384 7 2140 0 1 2 0
T 4303 2142 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4304 2142 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4305 2142 0 3 0 1
A 1406 7 0 0 1 10 1
A 1407 19 0 0 1 1084 0
T 4306 2148 0 3 0 0
A 1482 7 0 0 1 10 1
A 1483 7 0 0 1 10 0
Z
