V34 :0x3c test_ci_mod
11 test_ci.f03 S624 0
03/20/2024  21:26:16
use iso_fortran_env public 0 indirect
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
D 342 26 1387 88 1386 7
D 359 22 7
D 361 22 7
D 363 22 7
D 368 26 1417 512 1416 7
D 395 26 1493 720 1492 7
D 422 26 1573 1024 1572 7
D 958 26 4020 104 4017 7
D 982 22 958
D 984 22 958
D 1094 26 4135 272 4134 7
D 1102 26 4142 1328 4141 7
D 1161 26 1387 88 1386 7
D 1167 22 7
D 1169 22 7
D 1171 22 7
D 1173 26 1417 512 1416 7
D 1179 26 1493 720 1492 7
D 1213 26 4330 2344 4329 7
D 1298 26 4436 512 4435 7
D 1306 23 7 1 11 1087 0 0 0 0 0
 0 1087 11 11 1087 1087
D 1443 26 1387 88 1386 7
D 1449 22 7
D 1451 22 7
D 1453 22 7
D 1455 26 1417 512 1416 7
D 1461 26 1493 720 1492 7
D 1467 26 1573 1024 1572 7
D 1495 26 4957 3152 4956 7
D 1512 26 5002 1152 5001 7
D 1521 26 5020 22520 5019 7
D 1529 26 5043 5040 5042 7
D 1538 26 5053 23784 5052 7
D 1550 26 5064 1440 5063 7
D 1559 26 5069 2552 5068 7
D 1568 26 5079 16512 5078 7
D 2051 26 4135 272 4134 7
D 2057 26 4142 1328 4141 7
D 2063 26 1387 88 1386 7
D 2069 22 7
D 2071 22 7
D 2073 22 7
D 2190 26 1387 88 1386 7
D 2196 22 7
D 2198 22 7
D 2200 22 7
D 2202 26 1417 512 1416 7
D 2208 26 1493 720 1492 7
D 2214 26 4330 2344 4329 7
D 2220 26 6623 1472 6622 7
D 2235 26 6640 1928 6639 7
D 2348 26 6782 2520 6781 7
D 2455 26 7144 8 7143 7
D 2464 26 7147 8 7146 7
D 2568 23 1495 1 11 1786 0 0 0 0 0
 0 1786 11 11 1786 1786
D 2571 23 1495 1 11 1786 0 0 0 0 0
 0 1786 11 11 1786 1786
S 626 24 0 0 0 10 1 0 5029 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 test_ci_mod
S 634 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 637 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 642 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 643 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 644 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 666 7 22 iso_fortran_env integer_kinds$ac
R 668 7 24 iso_fortran_env logical_kinds$ac
R 670 7 26 iso_fortran_env real_kinds$ac
R 869 14 165 mqc_general mqc_print_scalar_integer
R 877 14 173 mqc_general mqc_print_scalar_real
R 885 14 181 mqc_general mqc_print_scalar_complex
R 912 14 208 mqc_general mqc_print_matrix_array_integer
R 926 14 222 mqc_general mqc_print_matrix_array_real
R 940 14 236 mqc_general mqc_print_matrix_array_complex
R 954 14 250 mqc_general mqc_print_vector_array_integer
R 965 14 261 mqc_general mqc_print_vector_array_real
R 976 14 272 mqc_general mqc_print_vector_array_complex
R 987 14 283 mqc_general mqc_print_r4tensor_array_integer
R 1007 14 303 mqc_general mqc_print_r4tensor_array_real
R 1027 14 323 mqc_general mqc_print_r4tensor_array_complex
R 1050 14 346 mqc_general integer2character
R 1055 14 351 mqc_general real2character
R 1060 14 356 mqc_general complex2character
S 1373 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1375 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 1386 25 4 mqc_algebra mqc_scalar
R 1387 5 5 mqc_algebra scar mqc_scalar
R 1389 5 7 mqc_algebra scar$p mqc_scalar
R 1390 5 8 mqc_algebra scai mqc_scalar
R 1392 5 10 mqc_algebra scai$p mqc_scalar
R 1393 5 11 mqc_algebra scac mqc_scalar
R 1395 5 13 mqc_algebra scac$p mqc_scalar
R 1396 5 14 mqc_algebra data_type mqc_scalar
R 1405 5 23 mqc_algebra random$tbp$0 mqc_scalar
R 1406 5 24 mqc_algebra log$tbp$1 mqc_scalar
R 1407 5 25 mqc_algebra exp$tbp$2 mqc_scalar
R 1408 5 26 mqc_algebra sqrt$tbp$3 mqc_scalar
R 1409 5 27 mqc_algebra abs$tbp$4 mqc_scalar
R 1410 5 28 mqc_algebra cval$tbp$5 mqc_scalar
R 1411 5 29 mqc_algebra ival$tbp$6 mqc_scalar
R 1412 5 30 mqc_algebra rval$tbp$7 mqc_scalar
R 1413 5 31 mqc_algebra print$tbp$8 mqc_scalar
R 1416 25 34 mqc_algebra mqc_vector
R 1417 5 35 mqc_algebra length mqc_vector
R 1418 5 36 mqc_algebra column mqc_vector
R 1419 5 37 mqc_algebra data_type mqc_vector
R 1421 5 39 mqc_algebra vecr mqc_vector
R 1422 5 40 mqc_algebra vecr$sd mqc_vector
R 1423 5 41 mqc_algebra vecr$p mqc_vector
R 1424 5 42 mqc_algebra vecr$o mqc_vector
R 1427 5 45 mqc_algebra veci mqc_vector
R 1428 5 46 mqc_algebra veci$sd mqc_vector
R 1429 5 47 mqc_algebra veci$p mqc_vector
R 1430 5 48 mqc_algebra veci$o mqc_vector
R 1433 5 51 mqc_algebra vecc mqc_vector
R 1434 5 52 mqc_algebra vecc$sd mqc_vector
R 1435 5 53 mqc_algebra vecc$p mqc_vector
R 1436 5 54 mqc_algebra vecc$o mqc_vector
R 1454 5 72 mqc_algebra diagf$tbp$9 mqc_vector
R 1455 5 73 mqc_algebra hphdiag$tbp$10 mqc_vector
R 1456 5 74 mqc_algebra diag$tbp$11 mqc_vector
R 1457 5 75 mqc_algebra power$tbp$12 mqc_vector
R 1458 5 76 mqc_algebra product$tbp$13 mqc_vector
R 1459 5 77 mqc_algebra sum$tbp$14 mqc_vector
R 1460 5 78 mqc_algebra abs$tbp$15 mqc_vector
R 1461 5 79 mqc_algebra exp$tbp$16 mqc_vector
R 1462 5 80 mqc_algebra sqrt$tbp$17 mqc_vector
R 1463 5 81 mqc_algebra sort$tbp$18 mqc_vector
R 1464 5 82 mqc_algebra argsort$tbp$19 mqc_vector
R 1465 5 83 mqc_algebra minloc$tbp$20 mqc_vector
R 1466 5 84 mqc_algebra maxloc$tbp$21 mqc_vector
R 1467 5 85 mqc_algebra minval$tbp$22 mqc_vector
R 1468 5 86 mqc_algebra maxval$tbp$23 mqc_vector
R 1469 5 87 mqc_algebra shift$tbp$24 mqc_vector
R 1470 5 88 mqc_algebra pop$tbp$25 mqc_vector
R 1471 5 89 mqc_algebra unshift$tbp$26 mqc_vector
R 1472 5 90 mqc_algebra push$tbp$27 mqc_vector
R 1473 5 91 mqc_algebra vput$tbp$28 mqc_vector
R 1474 5 92 mqc_algebra put$tbpg$29 mqc_vector
R 1475 5 93 mqc_algebra put$tbpg$30 mqc_vector
R 1476 5 94 mqc_algebra put_int$tbp$31 mqc_vector
R 1477 5 95 mqc_algebra put_sca$tbp$32 mqc_vector
R 1478 5 96 mqc_algebra vat$tbp$33 mqc_vector
R 1479 5 97 mqc_algebra at$tbpg$34 mqc_vector
R 1480 5 98 mqc_algebra at$tbpg$35 mqc_vector
R 1481 5 99 mqc_algebra at_int$tbp$36 mqc_vector
R 1482 5 100 mqc_algebra at_sca$tbp$37 mqc_vector
R 1483 5 101 mqc_algebra dagger$tbp$38 mqc_vector
R 1484 5 102 mqc_algebra transpose$tbp$39 mqc_vector
R 1485 5 103 mqc_algebra norm$tbp$40 mqc_vector
R 1486 5 104 mqc_algebra set$tbp$41 mqc_vector
R 1487 5 105 mqc_algebra init$tbp$42 mqc_vector
R 1488 5 106 mqc_algebra size$tbp$43 mqc_vector
R 1489 5 107 mqc_algebra print$tbp$44 mqc_vector
R 1492 25 110 mqc_algebra mqc_matrix
R 1493 5 111 mqc_algebra ncol mqc_matrix
R 1494 5 112 mqc_algebra nrow mqc_matrix
R 1495 5 113 mqc_algebra data_type mqc_matrix
R 1496 5 114 mqc_algebra storage mqc_matrix
R 1499 5 117 mqc_algebra matr mqc_matrix
R 1500 5 118 mqc_algebra matr$sd mqc_matrix
R 1501 5 119 mqc_algebra matr$p mqc_matrix
R 1502 5 120 mqc_algebra matr$o mqc_matrix
R 1506 5 124 mqc_algebra mati mqc_matrix
R 1507 5 125 mqc_algebra mati$sd mqc_matrix
R 1508 5 126 mqc_algebra mati$p mqc_matrix
R 1509 5 127 mqc_algebra mati$o mqc_matrix
R 1513 5 131 mqc_algebra matc mqc_matrix
R 1514 5 132 mqc_algebra matc$sd mqc_matrix
R 1515 5 133 mqc_algebra matc$p mqc_matrix
R 1516 5 134 mqc_algebra matc$o mqc_matrix
R 1530 5 148 mqc_algebra mput$tbp$45 mqc_matrix
R 1531 5 149 mqc_algebra vput$tbp$46 mqc_matrix
R 1532 5 150 mqc_algebra put$tbpg$47 mqc_matrix
R 1533 5 151 mqc_algebra put$tbpg$48 mqc_matrix
R 1534 5 152 mqc_algebra put$tbpg$49 mqc_matrix
R 1535 5 153 mqc_algebra put$tbpg$50 mqc_matrix
R 1536 5 154 mqc_algebra put_int$tbp$51 mqc_matrix
R 1537 5 155 mqc_algebra put_intsca$tbp$52 mqc_matrix
R 1538 5 156 mqc_algebra put_scaint$tbp$53 mqc_matrix
R 1539 5 157 mqc_algebra put_sca$tbp$54 mqc_matrix
R 1540 5 158 mqc_algebra mat$tbp$55 mqc_matrix
R 1541 5 159 mqc_algebra vat$tbp$56 mqc_matrix
R 1542 5 160 mqc_algebra at$tbpg$57 mqc_matrix
R 1543 5 161 mqc_algebra at$tbpg$58 mqc_matrix
R 1544 5 162 mqc_algebra at$tbpg$59 mqc_matrix
R 1545 5 163 mqc_algebra at$tbpg$60 mqc_matrix
R 1546 5 164 mqc_algebra at_int$tbp$61 mqc_matrix
R 1547 5 165 mqc_algebra at_intsca$tbp$62 mqc_matrix
R 1548 5 166 mqc_algebra at_scaint$tbp$63 mqc_matrix
R 1549 5 167 mqc_algebra at_sca$tbp$64 mqc_matrix
R 1550 5 168 mqc_algebra power$tbp$65 mqc_matrix
R 1551 5 169 mqc_algebra sum$tbp$66 mqc_matrix
R 1552 5 170 mqc_algebra exp$tbp$67 mqc_matrix
R 1553 5 171 mqc_algebra sqrt$tbp$68 mqc_matrix
R 1554 5 172 mqc_algebra rmsmax$tbp$69 mqc_matrix
R 1555 5 173 mqc_algebra diagonal$tbp$70 mqc_matrix
R 1556 5 174 mqc_algebra pinv$tbp$71 mqc_matrix
R 1557 5 175 mqc_algebra trace$tbp$72 mqc_matrix
R 1558 5 176 mqc_algebra det$tbp$73 mqc_matrix
R 1559 5 177 mqc_algebra inv$tbp$74 mqc_matrix
R 1560 5 178 mqc_algebra eigensys$tbp$75 mqc_matrix
R 1561 5 179 mqc_algebra svd$tbp$76 mqc_matrix
R 1562 5 180 mqc_algebra diag$tbp$77 mqc_matrix
R 1563 5 181 mqc_algebra dagger$tbp$78 mqc_matrix
R 1564 5 182 mqc_algebra transpose$tbp$79 mqc_matrix
R 1565 5 183 mqc_algebra norm$tbp$80 mqc_matrix
R 1566 5 184 mqc_algebra set$tbp$81 mqc_matrix
R 1567 5 185 mqc_algebra identity$tbp$82 mqc_matrix
R 1568 5 186 mqc_algebra init$tbp$83 mqc_matrix
R 1569 5 187 mqc_algebra print$tbp$84 mqc_matrix
R 1572 25 190 mqc_algebra mqc_r4tensor
R 1573 5 191 mqc_algebra i mqc_r4tensor
R 1574 5 192 mqc_algebra j mqc_r4tensor
R 1575 5 193 mqc_algebra k mqc_r4tensor
R 1576 5 194 mqc_algebra l mqc_r4tensor
R 1577 5 195 mqc_algebra data_type mqc_r4tensor
R 1578 5 196 mqc_algebra storage mqc_r4tensor
R 1579 5 197 mqc_algebra rten mqc_r4tensor
R 1584 5 202 mqc_algebra rten$sd mqc_r4tensor
R 1585 5 203 mqc_algebra rten$p mqc_r4tensor
R 1586 5 204 mqc_algebra rten$o mqc_r4tensor
R 1588 5 206 mqc_algebra iten mqc_r4tensor
R 1593 5 211 mqc_algebra iten$sd mqc_r4tensor
R 1594 5 212 mqc_algebra iten$p mqc_r4tensor
R 1595 5 213 mqc_algebra iten$o mqc_r4tensor
R 1597 5 215 mqc_algebra cten mqc_r4tensor
R 1602 5 220 mqc_algebra cten$sd mqc_r4tensor
R 1603 5 221 mqc_algebra cten$p mqc_r4tensor
R 1604 5 222 mqc_algebra cten$o mqc_r4tensor
R 1611 5 229 mqc_algebra init$tbp$85 mqc_r4tensor
R 1612 5 230 mqc_algebra tput$tbp$86 mqc_r4tensor
R 1613 5 231 mqc_algebra mput$tbp$87 mqc_r4tensor
R 1614 5 232 mqc_algebra vput$tbp$88 mqc_r4tensor
R 1615 5 233 mqc_algebra put$tbpg$89 mqc_r4tensor
R 1616 5 234 mqc_algebra put$tbpg$90 mqc_r4tensor
R 1617 5 235 mqc_algebra put_int$tbp$91 mqc_r4tensor
R 1618 5 236 mqc_algebra put_sca$tbp$92 mqc_r4tensor
R 1619 5 237 mqc_algebra tat$tbp$93 mqc_r4tensor
R 1620 5 238 mqc_algebra mat$tbp$94 mqc_r4tensor
R 1621 5 239 mqc_algebra vat$tbp$95 mqc_r4tensor
R 1622 5 240 mqc_algebra at$tbpg$96 mqc_r4tensor
R 1623 5 241 mqc_algebra at$tbpg$97 mqc_r4tensor
R 1624 5 242 mqc_algebra at_int$tbp$98 mqc_r4tensor
R 1625 5 243 mqc_algebra at_sca$tbp$99 mqc_r4tensor
R 1626 5 244 mqc_algebra print$tbp$100 mqc_r4tensor
R 1812 26 430 mqc_algebra **
R 1817 26 435 mqc_algebra !=
R 1825 26 443 mqc_algebra ==
R 1833 26 451 mqc_algebra <
R 1839 26 457 mqc_algebra >
R 1845 26 463 mqc_algebra <=
R 1851 26 469 mqc_algebra >=
R 1861 26 479 mqc_algebra dot
R 1877 26 495 mqc_algebra ewp
R 1880 26 498 mqc_algebra ewd
R 1882 26 500 mqc_algebra x
R 1884 26 502 mqc_algebra outer
R 1923 14 541 mqc_algebra put_intsca$tbp
R 1924 14 542 mqc_algebra put_scaint$tbp
R 1930 14 548 mqc_algebra at_intsca$tbp
R 1931 14 549 mqc_algebra at_scaint$tbp
R 1974 14 592 mqc_algebra put_int$tbp
R 1975 14 593 mqc_algebra put_sca$tbp
R 1978 14 596 mqc_algebra at_int$tbp
R 1979 14 597 mqc_algebra at_sca$tbp
R 2027 14 645 mqc_algebra mqc_input_integer_scalar
R 2031 14 649 mqc_algebra mqc_input_real_scalar
R 2035 14 653 mqc_algebra mqc_input_complex_scalar
R 2039 14 657 mqc_algebra mqc_output_mqcscalar_scalar
R 2043 14 661 mqc_algebra mqc_output_integer_scalar
R 2047 14 665 mqc_algebra mqc_output_real_scalar
R 2051 14 669 mqc_algebra mqc_output_complex_scalar
R 2059 14 677 mqc_algebra mqc_print_scalar_algebra1
R 2124 14 742 mqc_algebra mqc_scalar_get_intrinsic_real
R 2128 14 746 mqc_algebra mqc_scalar_get_intrinsic_integer
R 2153 14 771 mqc_algebra mqc_scalaradd
R 2158 14 776 mqc_algebra mqc_scalarsubtract
R 2163 14 781 mqc_algebra mqc_scalarmultiply
R 2168 14 786 mqc_algebra mqc_scalardivide
R 2363 14 981 mqc_algebra mqc_scalar_complex_conjugate
R 2376 14 994 mqc_algebra mqc_integerscalarmultiply
R 2381 14 999 mqc_algebra mqc_scalarintegermultiply
R 2386 14 1004 mqc_algebra mqc_realscalarmultiply
R 2391 14 1009 mqc_algebra mqc_scalarrealmultiply
R 2396 14 1014 mqc_algebra mqc_complexscalarmultiply
R 2401 14 1019 mqc_algebra mqc_scalarcomplexmultiply
R 2406 14 1024 mqc_algebra mqc_integerscalardivide
R 2411 14 1029 mqc_algebra mqc_scalarintegerdivide
R 2416 14 1034 mqc_algebra mqc_realscalardivide
R 2421 14 1039 mqc_algebra mqc_scalarrealdivide
R 2426 14 1044 mqc_algebra mqc_complexscalardivide
R 2431 14 1049 mqc_algebra mqc_scalarcomplexdivide
R 2436 14 1054 mqc_algebra mqc_integerscalaradd
R 2441 14 1059 mqc_algebra mqc_scalarintegeradd
R 2446 14 1064 mqc_algebra mqc_realscalaradd
R 2451 14 1069 mqc_algebra mqc_scalarrealadd
R 2456 14 1074 mqc_algebra mqc_complexscalaradd
R 2461 14 1079 mqc_algebra mqc_scalarcomplexadd
R 2466 14 1084 mqc_algebra mqc_integerscalarsubtract
R 2471 14 1089 mqc_algebra mqc_scalarintegersubtract
R 2476 14 1094 mqc_algebra mqc_realscalarsubtract
R 2481 14 1099 mqc_algebra mqc_scalarrealsubtract
R 2486 14 1104 mqc_algebra mqc_complexscalarsubtract
R 2491 14 1109 mqc_algebra mqc_scalarcomplexsubtract
R 2503 14 1121 mqc_algebra mqcscalar2character
R 2515 14 1133 mqc_algebra mqc_length_vector
R 2569 14 1187 mqc_algebra mqc_set_vector2integerarray
R 2574 14 1192 mqc_algebra mqc_set_vector2realarray
R 2579 14 1197 mqc_algebra mqc_set_vector2complexarray
R 2584 14 1202 mqc_algebra mqc_set_array2vector_integer
R 2592 14 1210 mqc_algebra mqc_set_array2vector_real
R 2600 14 1218 mqc_algebra mqc_set_array2vector_complex
R 2608 14 1226 mqc_algebra mqc_set_vector2vector
R 2612 14 1230 mqc_algebra mqc_vectorvectorsum
R 2617 14 1235 mqc_algebra mqc_vectorvectordifference
R 2622 14 1240 mqc_algebra mqc_scalarvectorsum
R 2627 14 1245 mqc_algebra mqc_vectorscalarsum
R 2632 14 1250 mqc_algebra mqc_scalarvectordifference
R 2641 14 1259 mqc_algebra mqc_vector_transpose
R 2645 14 1263 mqc_algebra mqc_vector_conjugate_transpose
R 2650 14 1268 mqc_algebra mqc_vectorvectordotproduct
R 2670 14 1288 mqc_algebra mqc_print_vector_algebra1
R 2724 14 1342 mqc_algebra mqc_scalarvectorproduct
R 2729 14 1347 mqc_algebra mqc_vectorscalarproduct
R 2734 14 1352 mqc_algebra mqc_vectorscalardivide
R 2739 14 1357 mqc_algebra mqc_realvectorproduct
R 2744 14 1362 mqc_algebra mqc_vectorrealproduct
R 2749 14 1367 mqc_algebra mqc_vectorrealdivide
R 2754 14 1372 mqc_algebra mqc_integervectorproduct
R 2759 14 1377 mqc_algebra mqc_vectorintegerproduct
R 2764 14 1382 mqc_algebra mqc_vectorintegerdivide
R 2769 14 1387 mqc_algebra mqc_complexvectorproduct
R 2774 14 1392 mqc_algebra mqc_vectorcomplexproduct
R 2779 14 1397 mqc_algebra mqc_vectorcomplexdivide
R 2883 14 1501 mqc_algebra mqc_vector_sum
R 2891 14 1509 mqc_algebra mqc_vector_complex_conjugate
R 3065 14 1683 mqc_algebra mqc_elementmatrixproduct
R 3105 14 1723 mqc_algebra mqc_set_integerarray2matrix
R 3116 14 1734 mqc_algebra mqc_set_realarray2matrix
R 3127 14 1745 mqc_algebra mqc_set_complexarray2matrix
R 3138 14 1756 mqc_algebra mqc_set_matrix2integerarray
R 3143 14 1761 mqc_algebra mqc_set_matrix2realarray
R 3148 14 1766 mqc_algebra mqc_set_matrix2complexarray
R 3153 14 1771 mqc_algebra mqc_set_matrix2matrix
R 3161 14 1779 mqc_algebra mqc_print_matrix_algebra1
R 3191 14 1809 mqc_algebra mqc_matrix_size
R 3219 14 1837 mqc_algebra mqc_matrix_transpose
R 3223 14 1841 mqc_algebra mqc_matrix_conjugate_transpose
R 3300 14 1918 mqc_algebra mqc_matrixmatrixsum
R 3305 14 1923 mqc_algebra mqc_matrixmatrixsubtract
R 3310 14 1928 mqc_algebra mqc_matrixmatrixdotproduct
R 3315 14 1933 mqc_algebra mqc_matrixvectordotproduct
R 3320 14 1938 mqc_algebra mqc_vectormatrixdotproduct
R 3325 14 1943 mqc_algebra mqc_matrixscalarproduct
R 3330 14 1948 mqc_algebra mqc_scalarmatrixproduct
R 3335 14 1953 mqc_algebra mqc_integermatrixproduct
R 3340 14 1958 mqc_algebra mqc_matrixintegerproduct
R 3345 14 1963 mqc_algebra mqc_realmatrixproduct
R 3350 14 1968 mqc_algebra mqc_matrixrealproduct
R 3355 14 1973 mqc_algebra mqc_complexmatrixproduct
R 3360 14 1978 mqc_algebra mqc_matrixcomplexproduct
R 3365 14 1983 mqc_algebra mqc_matrixscalardivide
R 3372 14 1990 mqc_algebra mqc_matrix_matrix_contraction
R 3535 14 2153 mqc_algebra mqc_matrix_complex_conjugate
R 3551 14 2169 mqc_algebra mqc_matrix_sum
R 3614 14 2232 mqc_algebra mqc_print_r4tensor_algebra1
R 3618 14 2236 mqc_algebra mqc_set_integerarray2tensor
R 3635 14 2253 mqc_algebra mqc_set_realarray2tensor
R 3652 14 2270 mqc_algebra mqc_set_complexarray2tensor
R 3669 14 2287 mqc_algebra mqc_set_tensor2integerarray
R 3674 14 2292 mqc_algebra mqc_set_tensor2realarray
R 3679 14 2297 mqc_algebra mqc_set_tensor2complexarray
R 3737 14 2355 mqc_algebra mqc_r4tensor_size
R 3764 14 2382 mqc_algebra mqc_r4tensor_r4tensor_contraction
R 3769 14 2387 mqc_algebra mqc_r4tensor_r4tensor_sum
R 3774 14 2392 mqc_algebra mqc_r4tensor_r4tensor_difference
R 3927 14 2545 mqc_algebra mqc_r4tensorscalardivide
R 3934 14 2552 mqc_algebra mqc_scalarr4tensorproduct
R 3941 14 2559 mqc_algebra mqc_r4tensorscalarproduct
R 3947 14 2565 mqc_algebra mqc_r4tensor_complex_conjugate
R 3960 14 2578 mqc_algebra put_int$tbp
R 3961 14 2579 mqc_algebra put_sca$tbp
R 3965 14 2583 mqc_algebra at_int$tbp
R 3966 14 2584 mqc_algebra at_sca$tbp
R 3971 14 2589 mqc_algebra put_int$tbp
R 3972 14 2590 mqc_algebra put_sca$tbp
R 3976 14 2594 mqc_algebra at_int$tbp
R 3977 14 2595 mqc_algebra at_sca$tbp
S 4014 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 4017 25 3 mqc_datastructures mqc_linkedlist
R 4020 5 6 mqc_datastructures val mqc_linkedlist
R 4022 5 8 mqc_datastructures val$td mqc_linkedlist
R 4023 5 9 mqc_datastructures val$p mqc_linkedlist
R 4024 5 10 mqc_datastructures previous mqc_linkedlist
R 4026 5 12 mqc_datastructures previous$p mqc_linkedlist
R 4027 5 13 mqc_datastructures next mqc_linkedlist
R 4029 5 15 mqc_datastructures next$p mqc_linkedlist
S 4131 3 0 0 0 22 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 24399 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1 20
S 4132 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 4134 25 1 mqc_files mqc_fileinfo
R 4135 5 2 mqc_files filename mqc_fileinfo
R 4136 5 3 mqc_files currentlyopen mqc_fileinfo
R 4137 5 4 mqc_files unitnumber mqc_fileinfo
R 4138 5 5 mqc_files isopen$tbp$0 mqc_fileinfo
R 4141 25 8 mqc_files mqc_text_fileinfo
R 4142 5 9 mqc_files mqc_fileinfo mqc_text_fileinfo
R 4143 5 10 mqc_files buffer mqc_text_fileinfo
R 4144 5 11 mqc_files buffer_caps mqc_text_fileinfo
R 4145 5 12 mqc_files buffer_loaded mqc_text_fileinfo
R 4146 5 13 mqc_files buffer_cursor mqc_text_fileinfo
R 4147 5 14 mqc_files inside_quotes mqc_text_fileinfo
R 4148 5 15 mqc_files skip_multiple_delimits mqc_text_fileinfo
R 4149 5 16 mqc_files isopen$tbp$1 mqc_text_fileinfo
R 4150 5 17 mqc_files writeline$tbp$2 mqc_text_fileinfo
R 4151 5 18 mqc_files getnextinteger$tbp$3 mqc_text_fileinfo
R 4152 5 19 mqc_files getnextstring$tbp$4 mqc_text_fileinfo
R 4153 5 20 mqc_files getbuffer$tbp$5 mqc_text_fileinfo
R 4154 5 21 mqc_files loadbuffer$tbp$6 mqc_text_fileinfo
R 4155 5 22 mqc_files rewind$tbp$7 mqc_text_fileinfo
R 4156 5 23 mqc_files closefile$tbp$8 mqc_text_fileinfo
R 4157 5 24 mqc_files openfile$tbp$9 mqc_text_fileinfo
R 4329 25 1 mqc_molecule mqc_molecule_data
R 4330 5 2 mqc_molecule natoms mqc_molecule_data
R 4331 5 3 mqc_molecule atomic_numbers mqc_molecule_data
R 4332 5 4 mqc_molecule atomic_masses mqc_molecule_data
R 4333 5 5 mqc_molecule nuclear_charges mqc_molecule_data
R 4334 5 6 mqc_molecule cartesian_coordinates mqc_molecule_data
R 4336 5 8 mqc_molecule updatemoldata$tbp$0 mqc_molecule_data
R 4337 5 9 mqc_molecule getnumatoms$tbp$1 mqc_molecule_data
R 4338 5 10 mqc_molecule getnucrep$tbp$2 mqc_molecule_data
R 4339 5 11 mqc_molecule print$tbp$3 mqc_molecule_data
R 4415 14 87 mqc_molecule mqc_print_nuclear_geometry
R 4435 25 3 mqc_algebra2 mqc_variable
R 4436 5 4 mqc_algebra2 rank mqc_variable
R 4437 5 5 mqc_algebra2 datatype mqc_variable
R 4438 5 6 mqc_algebra2 storageformat mqc_variable
R 4439 5 7 mqc_algebra2 dimensions mqc_variable
R 4441 5 9 mqc_algebra2 realarray mqc_variable
R 4442 5 10 mqc_algebra2 realarray$sd mqc_variable
R 4443 5 11 mqc_algebra2 realarray$p mqc_variable
R 4444 5 12 mqc_algebra2 realarray$o mqc_variable
R 4447 5 15 mqc_algebra2 integerarray mqc_variable
R 4448 5 16 mqc_algebra2 integerarray$sd mqc_variable
R 4449 5 17 mqc_algebra2 integerarray$p mqc_variable
R 4450 5 18 mqc_algebra2 integerarray$o mqc_variable
R 4452 5 20 mqc_algebra2 initialized mqc_variable
R 4461 14 29 mqc_algebra2 mqc_variable_put_mqc$tbp
R 4463 14 31 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp
R 4465 14 33 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp
R 4472 5 40 mqc_algebra2 submatrix$tbp$0 mqc_variable
R 4473 5 41 mqc_algebra2 det$tbp$1 mqc_variable
R 4474 5 42 mqc_algebra2 diag$tbp$2 mqc_variable
R 4475 5 43 mqc_algebra2 eigen$tbp$3 mqc_variable
R 4476 5 44 mqc_algebra2 column$tbp$4 mqc_variable
R 4477 5 45 mqc_algebra2 rpower$tbp$5 mqc_variable
R 4478 5 46 mqc_algebra2 ipower$tbp$6 mqc_variable
R 4479 5 47 mqc_algebra2 isconformable$tbp$7 mqc_variable
R 4480 5 48 mqc_algebra2 print$tbp$8 mqc_variable
R 4481 5 49 mqc_algebra2 gettype$tbp$9 mqc_variable
R 4482 5 50 mqc_algebra2 getrank$tbp$10 mqc_variable
R 4483 5 51 mqc_algebra2 getval$tbp$11 mqc_variable
R 4484 5 52 mqc_algebra2 put$tbpg$12 mqc_variable
R 4485 5 53 mqc_algebra2 put$tbpg$13 mqc_variable
R 4486 5 54 mqc_algebra2 put$tbpg$14 mqc_variable
R 4487 5 55 mqc_algebra2 putmqc$tbp$15 mqc_variable
R 4488 5 56 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp$16 mqc_variable
R 4489 5 57 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp$17 mqc_variable
R 4490 5 58 mqc_algebra2 mqc_variable_put_mqc$tbp$18 mqc_variable
R 4491 5 59 mqc_algebra2 clear$tbpg$19 mqc_variable
R 4492 5 60 mqc_algebra2 clear$tbpg$20 mqc_variable
R 4493 5 61 mqc_algebra2 clear$tbpg$21 mqc_variable
R 4494 5 62 mqc_algebra2 mqc_variable_clear_real$tbp$22 mqc_variable
R 4495 5 63 mqc_algebra2 mqc_variable_clear_integer$tbp$23 mqc_variable
R 4496 5 64 mqc_algebra2 mqc_variable_clear_mqc$tbp$24 mqc_variable
R 4497 5 65 mqc_algebra2 init$tbp$25 mqc_variable
R 4548 26 116 mqc_algebra2 conformable
R 4610 14 178 mqc_algebra2 mqc_variable_getsize
R 4643 14 211 mqc_algebra2 mqc_print_mqcvariable
R 4760 14 328 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_integer
R 4764 14 332 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_real
R 4768 14 336 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_integer
R 4776 14 344 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_real
R 4784 14 352 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_integer
R 4795 14 363 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_real
R 4806 14 374 mqc_algebra2 mqc_variable_setval_intrinsicrank42mqcrank4_real
R 4823 14 391 mqc_algebra2 mqc_variable_mqc2intrinsicintegerscalar
R 4827 14 395 mqc_algebra2 mqc_variable_mqc2intrinsicrealscalar
R 4831 14 399 mqc_algebra2 mqc_variable_mqc2intrinsicinteger1array
R 4836 14 404 mqc_algebra2 mqc_variable_mqc2intrinsicreal1array
R 4841 14 409 mqc_algebra2 mqc_variable_mqc2intrinsicinteger2array
R 4846 14 414 mqc_algebra2 mqc_variable_mqc2intrinsicreal2array
R 4851 14 419 mqc_algebra2 mqc_variable_mqc2intrinsicreal4array
R 4864 14 432 mqc_algebra2 mqc_variable_int_scalar
R 4868 14 436 mqc_algebra2 mqc_variable_float_scalar
R 4872 14 440 mqc_algebra2 mqc_variable_matrix_transpose
R 4877 14 445 mqc_algebra2 mqc_variable_addition
R 4882 14 450 mqc_algebra2 mqc_variable_subtraction
R 4887 14 455 mqc_algebra2 mqc_variable_multiplication
R 4892 14 460 mqc_algebra2 mqc_variable_division
R 4907 14 475 mqc_algebra2 mqc_variable_array_sum
R 4918 14 486 mqc_algebra2 mqc_variable_contraction_full
R 4923 14 491 mqc_algebra2 mqc_variable_dot_product
R 4933 14 501 mqc_algebra2 mqc_variable_matrix_multiplication
R 4956 25 4 mqc_est mqc_scf_integral
R 4957 5 5 mqc_est alpha mqc_scf_integral
R 4958 5 6 mqc_est beta mqc_scf_integral
R 4959 5 7 mqc_est alphabeta mqc_scf_integral
R 4960 5 8 mqc_est betaalpha mqc_scf_integral
R 4961 5 9 mqc_est array_name mqc_scf_integral
R 4962 5 10 mqc_est array_type mqc_scf_integral
R 4964 5 12 mqc_est energy_list mqc_scf_integral
R 4965 5 13 mqc_est energy_list$sd mqc_scf_integral
R 4966 5 14 mqc_est energy_list$p mqc_scf_integral
R 4967 5 15 mqc_est energy_list$o mqc_scf_integral
R 4971 5 19 mqc_est swapodb$tbp$0 mqc_scf_integral
R 4972 5 20 mqc_est combine$tbp$1 mqc_scf_integral
R 4973 5 21 mqc_est swap$tbp$2 mqc_scf_integral
R 4974 5 22 mqc_est orbitals$tbp$3 mqc_scf_integral
R 4975 5 23 mqc_est deleteelist$tbp$4 mqc_scf_integral
R 4976 5 24 mqc_est getelist$tbp$5 mqc_scf_integral
R 4977 5 25 mqc_est setelist$tbp$6 mqc_scf_integral
R 4978 5 26 mqc_est at$tbp$7 mqc_scf_integral
R 4979 5 27 mqc_est power$tbp$8 mqc_scf_integral
R 4980 5 28 mqc_est norm$tbp$9 mqc_scf_integral
R 4981 5 29 mqc_est det$tbp$10 mqc_scf_integral
R 4982 5 30 mqc_est trace$tbp$11 mqc_scf_integral
R 4983 5 31 mqc_est inv$tbp$12 mqc_scf_integral
R 4984 5 32 mqc_est eigensys$tbp$13 mqc_scf_integral
R 4985 5 33 mqc_est svd$tbp$14 mqc_scf_integral
R 4986 5 34 mqc_est diag$tbp$15 mqc_scf_integral
R 4987 5 35 mqc_est init$tbp$16 mqc_scf_integral
R 4988 5 36 mqc_est identity$tbp$17 mqc_scf_integral
R 4989 5 37 mqc_est getblock$tbp$18 mqc_scf_integral
R 4990 5 38 mqc_est addlabel$tbp$19 mqc_scf_integral
R 4991 5 39 mqc_est getlabel$tbp$20 mqc_scf_integral
R 4992 5 40 mqc_est blocksize$tbp$21 mqc_scf_integral
R 4993 5 41 mqc_est type$tbp$22 mqc_scf_integral
R 4994 5 42 mqc_est hasbetaalpha$tbp$23 mqc_scf_integral
R 4995 5 43 mqc_est hasalphabeta$tbp$24 mqc_scf_integral
R 4996 5 44 mqc_est hasbeta$tbp$25 mqc_scf_integral
R 4997 5 45 mqc_est hasalpha$tbp$26 mqc_scf_integral
R 4998 5 46 mqc_est print$tbp$27 mqc_scf_integral
R 5001 25 49 mqc_est mqc_scf_eigenvalues
R 5002 5 50 mqc_est alpha mqc_scf_eigenvalues
R 5003 5 51 mqc_est beta mqc_scf_eigenvalues
R 5004 5 52 mqc_est array_name mqc_scf_eigenvalues
R 5005 5 53 mqc_est array_type mqc_scf_eigenvalues
R 5007 5 55 mqc_est at$tbp$28 mqc_scf_eigenvalues
R 5008 5 56 mqc_est power$tbp$29 mqc_scf_eigenvalues
R 5009 5 57 mqc_est getblock$tbp$30 mqc_scf_eigenvalues
R 5010 5 58 mqc_est addlabel$tbp$31 mqc_scf_eigenvalues
R 5011 5 59 mqc_est getlabel$tbp$32 mqc_scf_eigenvalues
R 5012 5 60 mqc_est blocksize$tbp$33 mqc_scf_eigenvalues
R 5013 5 61 mqc_est type$tbp$34 mqc_scf_eigenvalues
R 5014 5 62 mqc_est hasbeta$tbp$35 mqc_scf_eigenvalues
R 5015 5 63 mqc_est hasalpha$tbp$36 mqc_scf_eigenvalues
R 5016 5 64 mqc_est print$tbp$37 mqc_scf_eigenvalues
R 5019 25 67 mqc_est mqc_wavefunction
R 5020 5 68 mqc_est mo_coefficients mqc_wavefunction
R 5021 5 69 mqc_est mo_energies mqc_wavefunction
R 5022 5 70 mqc_est mo_symmetries mqc_wavefunction
R 5023 5 71 mqc_est core_hamiltonian mqc_wavefunction
R 5024 5 72 mqc_est fock_matrix mqc_wavefunction
R 5025 5 73 mqc_est density_matrix mqc_wavefunction
R 5026 5 74 mqc_est scf_density_matrix mqc_wavefunction
R 5027 5 75 mqc_est overlap_matrix mqc_wavefunction
R 5028 5 76 mqc_est nalpha mqc_wavefunction
R 5029 5 77 mqc_est nbeta mqc_wavefunction
R 5030 5 78 mqc_est nelectrons mqc_wavefunction
R 5031 5 79 mqc_est nbasis mqc_wavefunction
R 5032 5 80 mqc_est charge mqc_wavefunction
R 5033 5 81 mqc_est multiplicity mqc_wavefunction
R 5034 5 82 mqc_est basis mqc_wavefunction
R 5035 5 83 mqc_est symmetry mqc_wavefunction
R 5036 5 84 mqc_est wf_type mqc_wavefunction
R 5037 5 85 mqc_est wf_complex mqc_wavefunction
R 5039 5 87 mqc_est print$tbp$38 mqc_wavefunction
R 5042 25 90 mqc_est mqc_basis_set
R 5043 5 91 mqc_est sh2atmp mqc_basis_set
R 5044 5 92 mqc_est shltyp mqc_basis_set
R 5045 5 93 mqc_est nprmsh mqc_basis_set
R 5046 5 94 mqc_est prmexp mqc_basis_set
R 5047 5 95 mqc_est concoef mqc_basis_set
R 5048 5 96 mqc_est concotwo mqc_basis_set
R 5049 5 97 mqc_est shcoor mqc_basis_set
R 5052 25 100 mqc_est mqc_pscf_wavefunction
R 5053 5 101 mqc_est mqc_wavefunction mqc_pscf_wavefunction
R 5054 5 102 mqc_est ncore mqc_pscf_wavefunction
R 5055 5 103 mqc_est nval mqc_pscf_wavefunction
R 5056 5 104 mqc_est nactive mqc_pscf_wavefunction
R 5057 5 105 mqc_est nfrz mqc_pscf_wavefunction
R 5058 5 106 mqc_est pscf_amplitudes mqc_pscf_wavefunction
R 5059 5 107 mqc_est pscf_energies mqc_pscf_wavefunction
R 5060 5 108 mqc_est print$tbp$39 mqc_pscf_wavefunction
R 5063 25 111 mqc_est mqc_determinant_string
R 5064 5 112 mqc_est alpha mqc_determinant_string
R 5065 5 113 mqc_est beta mqc_determinant_string
R 5068 25 116 mqc_est mqc_determinant
R 5069 5 117 mqc_est strings mqc_determinant
R 5070 5 118 mqc_est order mqc_determinant
R 5071 5 119 mqc_est ndets mqc_determinant
R 5072 5 120 mqc_est nalpstr mqc_determinant
R 5073 5 121 mqc_est nbetstr mqc_determinant
R 5074 5 122 mqc_est nsubsalpha mqc_determinant
R 5075 5 123 mqc_est nsubsbeta mqc_determinant
R 5078 25 126 mqc_est mqc_twoeris
R 5079 5 127 mqc_est alpha mqc_twoeris
R 5080 5 128 mqc_est beta mqc_twoeris
R 5081 5 129 mqc_est alphabeta mqc_twoeris
R 5082 5 130 mqc_est betaalpha mqc_twoeris
R 5083 5 131 mqc_est aaab mqc_twoeris
R 5084 5 132 mqc_est aaba mqc_twoeris
R 5085 5 133 mqc_est abaa mqc_twoeris
R 5086 5 134 mqc_est baaa mqc_twoeris
R 5087 5 135 mqc_est abab mqc_twoeris
R 5088 5 136 mqc_est baab mqc_twoeris
R 5089 5 137 mqc_est baba mqc_twoeris
R 5090 5 138 mqc_est abba mqc_twoeris
R 5091 5 139 mqc_est bbba mqc_twoeris
R 5092 5 140 mqc_est bbab mqc_twoeris
R 5093 5 141 mqc_est babb mqc_twoeris
R 5094 5 142 mqc_est abbb mqc_twoeris
R 5095 5 143 mqc_est integraltype mqc_twoeris
R 5096 5 144 mqc_est storagetype mqc_twoeris
R 5098 5 146 mqc_est type$tbp$40 mqc_twoeris
R 5099 5 147 mqc_est getblock$tbp$41 mqc_twoeris
R 5100 5 148 mqc_est hasspinblock$tbp$42 mqc_twoeris
R 5101 5 149 mqc_est blocksize$tbp$43 mqc_twoeris
R 5102 5 150 mqc_est at$tbp$44 mqc_twoeris
R 5103 5 151 mqc_est print$tbp$45 mqc_twoeris
R 5191 14 239 mqc_est mqc_print_wavefunction
R 5199 14 247 mqc_est mqc_print_integral
R 5207 14 255 mqc_est mqc_print_eigenvalues
R 5214 14 262 mqc_est mqc_print_twoeris
R 5431 14 479 mqc_est mqc_integral_output_array
R 5435 14 483 mqc_est mqc_eigenvalues_output_array
R 5439 14 487 mqc_est mqc_2eris_output_array
R 5445 14 493 mqc_est mqc_integral_matrix_multiply
R 5451 14 499 mqc_est mqc_matrix_integral_multiply
R 5456 14 504 mqc_est mqc_integral_sum
R 5461 14 509 mqc_est mqc_integral_difference
R 5466 14 514 mqc_est mqc_matrix_integral_difference
R 5472 14 520 mqc_est mqc_integral_integral_multiply
R 5477 14 525 mqc_est mqc_scalar_integral_multiply
R 5484 14 532 mqc_est mqc_integral_scalar_multiply
R 5492 14 540 mqc_est mqc_integral_eigenvalues_multiply
R 5498 14 546 mqc_est mqc_eigenvalues_integral_multiply
R 5504 14 552 mqc_est mqc_eigenvalues_eigenvalues_multiply
R 5509 14 557 mqc_est mqc_eigenvalue_eigenvalue_dotproduct
R 5514 14 562 mqc_est mqc_integral_transpose
R 5519 14 567 mqc_est mqc_integral_conjugate_transpose
R 5546 14 594 mqc_est mqc_scf_integral_contraction
R 5553 14 601 mqc_est mqc_eri_integral_contraction
R 5563 14 611 mqc_est mqc_eri_r4tensor_contraction
R 5603 14 651 mqc_est mqc_scf_integral_conjg
S 6621 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 6622 25 1 mqc_gaussian mqc_gaussian_fchk_file
R 6623 5 2 mqc_gaussian mqc_text_fileinfo mqc_gaussian_fchk_file
R 6624 5 3 mqc_gaussian title mqc_gaussian_fchk_file
R 6625 5 4 mqc_gaussian jobtype mqc_gaussian_fchk_file
R 6626 5 5 mqc_gaussian method mqc_gaussian_fchk_file
R 6627 5 6 mqc_gaussian basisset mqc_gaussian_fchk_file
R 6628 5 7 mqc_gaussian closefile$tbp$0 mqc_gaussian_fchk_file
R 6629 5 8 mqc_gaussian rewind$tbp$1 mqc_gaussian_fchk_file
R 6630 5 9 mqc_gaussian loadbuffer$tbp$2 mqc_gaussian_fchk_file
R 6631 5 10 mqc_gaussian getbuffer$tbp$3 mqc_gaussian_fchk_file
R 6632 5 11 mqc_gaussian getnextstring$tbp$5 mqc_gaussian_fchk_file
R 6633 5 12 mqc_gaussian getnextinteger$tbp$6 mqc_gaussian_fchk_file
R 6634 5 13 mqc_gaussian writeline$tbp$7 mqc_gaussian_fchk_file
R 6635 5 14 mqc_gaussian isopen$tbp$8 mqc_gaussian_fchk_file
R 6636 5 15 mqc_gaussian openfile$tbp$10 mqc_gaussian_fchk_file
R 6639 25 18 mqc_gaussian mqc_gaussian_unformatted_matrix_file
R 6640 5 19 mqc_gaussian mqc_fileinfo mqc_gaussian_unformatted_matrix_file
R 6641 5 20 mqc_gaussian declared mqc_gaussian_unformatted_matrix_file
R 6642 5 21 mqc_gaussian header_read mqc_gaussian_unformatted_matrix_file
R 6643 5 22 mqc_gaussian header_written mqc_gaussian_unformatted_matrix_file
R 6644 5 23 mqc_gaussian gaussianscalars_read mqc_gaussian_unformatted_matrix_file
R 6645 5 24 mqc_gaussian readwritemode mqc_gaussian_unformatted_matrix_file
R 6646 5 25 mqc_gaussian labfil mqc_gaussian_unformatted_matrix_file
R 6647 5 26 mqc_gaussian gvers mqc_gaussian_unformatted_matrix_file
R 6648 5 27 mqc_gaussian title mqc_gaussian_unformatted_matrix_file
R 6649 5 28 mqc_gaussian natoms mqc_gaussian_unformatted_matrix_file
R 6651 5 30 mqc_gaussian natoms$p mqc_gaussian_unformatted_matrix_file
R 6652 5 31 mqc_gaussian nbasis mqc_gaussian_unformatted_matrix_file
R 6654 5 33 mqc_gaussian nbasis$p mqc_gaussian_unformatted_matrix_file
R 6655 5 34 mqc_gaussian nbasisuse mqc_gaussian_unformatted_matrix_file
R 6657 5 36 mqc_gaussian nbasisuse$p mqc_gaussian_unformatted_matrix_file
R 6658 5 37 mqc_gaussian icharge mqc_gaussian_unformatted_matrix_file
R 6660 5 39 mqc_gaussian icharge$p mqc_gaussian_unformatted_matrix_file
R 6661 5 40 mqc_gaussian multiplicity mqc_gaussian_unformatted_matrix_file
R 6663 5 42 mqc_gaussian multiplicity$p mqc_gaussian_unformatted_matrix_file
R 6664 5 43 mqc_gaussian nelectrons mqc_gaussian_unformatted_matrix_file
R 6666 5 45 mqc_gaussian nelectrons$p mqc_gaussian_unformatted_matrix_file
R 6667 5 46 mqc_gaussian icgu mqc_gaussian_unformatted_matrix_file
R 6669 5 48 mqc_gaussian icgu$p mqc_gaussian_unformatted_matrix_file
R 6670 5 49 mqc_gaussian nfc mqc_gaussian_unformatted_matrix_file
R 6672 5 51 mqc_gaussian nfc$p mqc_gaussian_unformatted_matrix_file
R 6673 5 52 mqc_gaussian nfv mqc_gaussian_unformatted_matrix_file
R 6675 5 54 mqc_gaussian nfv$p mqc_gaussian_unformatted_matrix_file
R 6676 5 55 mqc_gaussian itran mqc_gaussian_unformatted_matrix_file
R 6678 5 57 mqc_gaussian itran$p mqc_gaussian_unformatted_matrix_file
R 6679 5 58 mqc_gaussian idum9 mqc_gaussian_unformatted_matrix_file
R 6681 5 60 mqc_gaussian idum9$p mqc_gaussian_unformatted_matrix_file
R 6682 5 61 mqc_gaussian nshlao mqc_gaussian_unformatted_matrix_file
R 6684 5 63 mqc_gaussian nshlao$p mqc_gaussian_unformatted_matrix_file
R 6685 5 64 mqc_gaussian nprmao mqc_gaussian_unformatted_matrix_file
R 6687 5 66 mqc_gaussian nprmao$p mqc_gaussian_unformatted_matrix_file
R 6688 5 67 mqc_gaussian nshldb mqc_gaussian_unformatted_matrix_file
R 6690 5 69 mqc_gaussian nshldb$p mqc_gaussian_unformatted_matrix_file
R 6691 5 70 mqc_gaussian nprmdb mqc_gaussian_unformatted_matrix_file
R 6693 5 72 mqc_gaussian nprmdb$p mqc_gaussian_unformatted_matrix_file
R 6694 5 73 mqc_gaussian nbtot mqc_gaussian_unformatted_matrix_file
R 6696 5 75 mqc_gaussian nbtot$p mqc_gaussian_unformatted_matrix_file
R 6698 5 77 mqc_gaussian atomicnumbers mqc_gaussian_unformatted_matrix_file
R 6699 5 78 mqc_gaussian atomicnumbers$sd mqc_gaussian_unformatted_matrix_file
R 6700 5 79 mqc_gaussian atomicnumbers$p mqc_gaussian_unformatted_matrix_file
R 6701 5 80 mqc_gaussian atomicnumbers$o mqc_gaussian_unformatted_matrix_file
R 6703 5 82 mqc_gaussian atomtypes mqc_gaussian_unformatted_matrix_file
R 6705 5 84 mqc_gaussian atomtypes$sd mqc_gaussian_unformatted_matrix_file
R 6706 5 85 mqc_gaussian atomtypes$p mqc_gaussian_unformatted_matrix_file
R 6707 5 86 mqc_gaussian atomtypes$o mqc_gaussian_unformatted_matrix_file
R 6709 5 88 mqc_gaussian basisfunction2atom mqc_gaussian_unformatted_matrix_file
R 6711 5 90 mqc_gaussian basisfunction2atom$sd mqc_gaussian_unformatted_matrix_file
R 6712 5 91 mqc_gaussian basisfunction2atom$p mqc_gaussian_unformatted_matrix_file
R 6713 5 92 mqc_gaussian basisfunction2atom$o mqc_gaussian_unformatted_matrix_file
R 6715 5 94 mqc_gaussian ibasisfunctiontype mqc_gaussian_unformatted_matrix_file
R 6717 5 96 mqc_gaussian ibasisfunctiontype$sd mqc_gaussian_unformatted_matrix_file
R 6718 5 97 mqc_gaussian ibasisfunctiontype$p mqc_gaussian_unformatted_matrix_file
R 6719 5 98 mqc_gaussian ibasisfunctiontype$o mqc_gaussian_unformatted_matrix_file
R 6721 5 100 mqc_gaussian igaussianscalars mqc_gaussian_unformatted_matrix_file
R 6723 5 102 mqc_gaussian igaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6724 5 103 mqc_gaussian igaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6725 5 104 mqc_gaussian igaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6728 5 107 mqc_gaussian atomiccharges mqc_gaussian_unformatted_matrix_file
R 6729 5 108 mqc_gaussian atomiccharges$sd mqc_gaussian_unformatted_matrix_file
R 6730 5 109 mqc_gaussian atomiccharges$p mqc_gaussian_unformatted_matrix_file
R 6731 5 110 mqc_gaussian atomiccharges$o mqc_gaussian_unformatted_matrix_file
R 6733 5 112 mqc_gaussian atomicweights mqc_gaussian_unformatted_matrix_file
R 6735 5 114 mqc_gaussian atomicweights$sd mqc_gaussian_unformatted_matrix_file
R 6736 5 115 mqc_gaussian atomicweights$p mqc_gaussian_unformatted_matrix_file
R 6737 5 116 mqc_gaussian atomicweights$o mqc_gaussian_unformatted_matrix_file
R 6739 5 118 mqc_gaussian cartesians mqc_gaussian_unformatted_matrix_file
R 6741 5 120 mqc_gaussian cartesians$sd mqc_gaussian_unformatted_matrix_file
R 6742 5 121 mqc_gaussian cartesians$p mqc_gaussian_unformatted_matrix_file
R 6743 5 122 mqc_gaussian cartesians$o mqc_gaussian_unformatted_matrix_file
R 6745 5 124 mqc_gaussian gaussianscalars mqc_gaussian_unformatted_matrix_file
R 6747 5 126 mqc_gaussian gaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6748 5 127 mqc_gaussian gaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6749 5 128 mqc_gaussian gaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6751 5 130 mqc_gaussian isopen$tbp$11 mqc_gaussian_unformatted_matrix_file
R 6752 5 131 mqc_gaussian updateheader$tbp$12 mqc_gaussian_unformatted_matrix_file
R 6753 5 132 mqc_gaussian write2eris$tbp$13 mqc_gaussian_unformatted_matrix_file
R 6754 5 133 mqc_gaussian writeestobj$tbp$14 mqc_gaussian_unformatted_matrix_file
R 6755 5 134 mqc_gaussian writebasisdata$tbp$15 mqc_gaussian_unformatted_matrix_file
R 6756 5 135 mqc_gaussian writearray$tbp$16 mqc_gaussian_unformatted_matrix_file
R 6757 5 136 mqc_gaussian writearray2$tbp$17 mqc_gaussian_unformatted_matrix_file
R 6758 5 137 mqc_gaussian get2eris$tbp$18 mqc_gaussian_unformatted_matrix_file
R 6759 5 138 mqc_gaussian getestobj$tbp$19 mqc_gaussian_unformatted_matrix_file
R 6760 5 139 mqc_gaussian getmoldata$tbp$20 mqc_gaussian_unformatted_matrix_file
R 6761 5 140 mqc_gaussian getbasisdata$tbp$21 mqc_gaussian_unformatted_matrix_file
R 6762 5 141 mqc_gaussian getbasisarray$tbp$22 mqc_gaussian_unformatted_matrix_file
R 6763 5 142 mqc_gaussian getbasisinfo$tbp$23 mqc_gaussian_unformatted_matrix_file
R 6764 5 143 mqc_gaussian getatominfo$tbp$24 mqc_gaussian_unformatted_matrix_file
R 6765 5 144 mqc_gaussian getarray$tbp$25 mqc_gaussian_unformatted_matrix_file
R 6766 5 145 mqc_gaussian getvalreal$tbp$26 mqc_gaussian_unformatted_matrix_file
R 6767 5 146 mqc_gaussian getval$tbp$27 mqc_gaussian_unformatted_matrix_file
R 6768 5 147 mqc_gaussian getatomweights$tbp$28 mqc_gaussian_unformatted_matrix_file
R 6769 5 148 mqc_gaussian getatomcarts$tbp$29 mqc_gaussian_unformatted_matrix_file
R 6770 5 149 mqc_gaussian getatomicnumbers$tbp$30 mqc_gaussian_unformatted_matrix_file
R 6771 5 150 mqc_gaussian iscomplex$tbp$31 mqc_gaussian_unformatted_matrix_file
R 6772 5 151 mqc_gaussian isgeneral$tbp$32 mqc_gaussian_unformatted_matrix_file
R 6773 5 152 mqc_gaussian isunrestricted$tbp$33 mqc_gaussian_unformatted_matrix_file
R 6774 5 153 mqc_gaussian isrestricted$tbp$34 mqc_gaussian_unformatted_matrix_file
R 6775 5 154 mqc_gaussian create$tbp$35 mqc_gaussian_unformatted_matrix_file
R 6776 5 155 mqc_gaussian load$tbp$36 mqc_gaussian_unformatted_matrix_file
R 6777 5 156 mqc_gaussian closefile$tbp$37 mqc_gaussian_unformatted_matrix_file
R 6778 5 157 mqc_gaussian openfile$tbp$38 mqc_gaussian_unformatted_matrix_file
R 6781 25 160 mqc_gaussian mqc_gaussian_molecule_data
R 6782 5 161 mqc_gaussian mqc_molecule_data mqc_gaussian_molecule_data
R 6783 5 162 mqc_gaussian charge mqc_gaussian_molecule_data
R 6784 5 163 mqc_gaussian multiplicity mqc_gaussian_molecule_data
R 6785 5 164 mqc_gaussian print$tbp$40 mqc_gaussian_molecule_data
R 6786 5 165 mqc_gaussian getnucrep$tbp$41 mqc_gaussian_molecule_data
R 6787 5 166 mqc_gaussian getnumatoms$tbp$42 mqc_gaussian_molecule_data
R 6788 5 167 mqc_gaussian updatemoldata$tbp$43 mqc_gaussian_molecule_data
R 7143 25 6 iso_c_binding c_ptr
R 7144 5 7 iso_c_binding val c_ptr
R 7146 25 9 iso_c_binding c_funptr
R 7147 5 10 iso_c_binding val c_funptr
R 7181 6 44 iso_c_binding c_null_ptr$ac
R 7183 6 46 iso_c_binding c_null_funptr$ac
R 7184 26 47 iso_c_binding ==
R 7186 26 49 iso_c_binding !=
S 7661 16 0 0 0 7 1 626 6693 4 400000 A 0 0 0 0 B 0 20 0 0 0 0 0 0 7662 2055 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 iout
S 7662 3 0 0 0 7 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 7663 19 0 0 0 7 1 626 5620 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1133 22 0 0 0 0 0 626 0 0 0 0 mqc_print
O 7663 22 4415 4643 3614 3161 2670 2059 5214 5207 5199 5191 1027 1007 987 940 926 912 976 965 954 885 877 869
S 7664 19 0 0 0 7 1 626 6242 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1137 4 0 0 0 0 0 626 0 0 0 0 num2char
O 7664 4 2503 1060 1055 1050
S 7665 19 0 0 0 10 1 626 9577 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 at
S 7666 19 0 0 0 10 1 626 9635 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 put
S 7667 19 0 0 0 10 1 626 11859 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1313 6 0 0 0 0 0 626 0 0 0 0 contraction
O 7667 6 5563 5553 5546 4918 3764 3372
S 7668 19 0 0 0 10 1 626 2344 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1145 5 0 0 0 0 0 626 0 0 0 0 conjg
O 7668 5 5603 3947 3535 2891 2363
S 7669 19 0 0 0 10 1 626 2153 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1147 2 0 0 0 0 0 626 0 0 0 0 float
O 7669 2 4868 2124
S 7670 19 0 0 0 7 1 626 2585 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1149 2 0 0 0 0 0 626 0 0 0 0 int
O 7670 2 4864 2128
S 7671 19 0 0 0 7 1 626 2687 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1308 10 0 0 0 0 0 626 0 0 0 0 matmul
O 7671 10 5504 5498 5492 5472 5451 5445 4933 3320 3315 3310
S 7672 19 0 0 0 10 1 626 2794 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1310 4 0 0 0 0 0 626 0 0 0 0 transpose
O 7672 4 5514 4872 3219 2641
S 7673 19 0 0 0 10 1 626 12562 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1159 3 0 0 0 0 0 626 0 0 0 0 dagger
O 7673 3 5519 3223 2645
S 7674 19 0 0 0 10 1 626 2671 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1309 3 0 0 0 0 0 626 0 0 0 0 dot_product
O 7674 3 5509 4923 2650
S 7675 19 0 0 0 10 1 626 2783 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1164 3 0 0 0 0 0 626 0 0 0 0 sum
O 7675 3 4907 3551 2883
S 7676 19 0 0 0 10 1 626 2875 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1168 4 0 0 0 0 0 626 0 0 0 0 size
O 7676 4 4610 3737 3191 2515
S 7677 26 0 0 0 0 1 626 13936 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1212 44 0 0 0 0 0 626 0 0 0 0 =
O 7677 44 4851 4846 4841 4836 4831 4827 4823 4806 4795 4784 4776 4768 4764 4760 3679 3674 3669 3652 3635 3618 3127 3116 3105 3148 3143 3138 3153 2600 2592 2584 2579 2574 2569 2608 2051 2047 2043 2039 2035 2031 2027 5439 5435 5431
S 7678 26 0 0 0 0 1 626 14113 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1226 14 0 0 0 0 0 626 0 0 0 0 +
O 7678 14 4877 3769 3300 2627 2622 2612 2461 2456 2451 2446 2441 2436 2153 5456
S 7679 26 0 0 0 0 1 626 14249 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1240 14 0 0 0 0 0 626 0 0 0 0 -
O 7679 14 4882 3774 3305 2632 2617 2491 2486 2481 2476 2471 2466 2158 5466 5461
S 7680 26 0 0 0 0 1 626 14420 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1269 29 0 0 0 0 0 626 0 0 0 0 *
O 7680 29 4887 3065 2774 2769 2759 2754 2744 2739 3941 3934 3360 3355 3350 3345 3340 3335 3325 3330 2729 2724 2401 2396 2391 2386 2381 2376 2163 5484 5477
S 7681 26 0 0 0 0 1 626 14883 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1283 14 0 0 0 0 0 626 0 0 0 0 /
O 7681 14 4892 2779 2764 2749 3927 3365 2734 2431 2426 2421 2416 2411 2406 2168
S 7682 19 0 0 0 10 1 626 16932 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1302 11 0 0 0 0 0 626 0 0 0 0 put$tbpg
O 7682 11 3972 3971 3961 3960 1924 1923 1975 1974 4461 4463 4465
S 7683 19 0 0 0 10 1 626 16989 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1294 8 0 0 0 0 0 626 0 0 0 0 at$tbpg
O 7683 8 3966 3965 1931 1930 1979 1978 3977 3976
S 7684 23 5 0 0 10 7689 626 48928 0 0 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipole_expectation_value
S 7685 1 3 1 0 1495 1 7684 48953 4 3000 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 bra
S 7686 7 3 1 0 2568 1 7684 48957 800004 3000 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipole
S 7687 1 3 1 0 1495 1 7684 48964 4 3000 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ket
S 7688 7 3 0 0 2571 1 7684 48968 800004 1003000 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipoleev
S 7689 14 5 0 0 2571 1 7684 48928 4 1400000 A 0 0 0 0 B 0 26 0 0 0 0 0 3084 3 0 0 7688 0 0 0 0 0 0 0 0 0 26 0 626 0 0 0 0 dipole_expectation_value dipole_expectation_value dipoleev
F 7689 3 7685 7686 7687
A 14 2 0 0 0 6 634 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 31 2 0 0 0 6 637 0 0 0 31 0 0 0 0 0 0 0 0 0 0 0
A 33 2 0 0 0 6 642 0 0 0 33 0 0 0 0 0 0 0 0 0 0 0
A 55 2 0 0 0 7 643 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0
A 56 2 0 0 0 7 644 0 0 0 56 0 0 0 0 0 0 0 0 0 0 0
A 62 1 0 1 0 63 666 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 68 1 0 1 0 69 668 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 72 1 0 3 0 75 670 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1086 2 0 0 793 19 1375 0 0 0 1086 0 0 0 0 0 0 0 0 0 0 0
A 1087 2 0 0 880 7 4014 0 0 0 1087 0 0 0 0 0 0 0 0 0 0 0
A 1112 2 0 0 0 22 4131 0 0 0 1112 0 0 0 0 0 0 0 0 0 0 0
A 1113 2 0 0 0 19 4132 0 0 0 1113 0 0 0 0 0 0 0 0 0 0 0
A 1358 2 0 0 758 7 1373 0 0 0 1358 0 0 0 0 0 0 0 0 0 0 0
A 1786 2 0 0 339 7 6621 0 0 0 1786 0 0 0 0 0 0 0 0 0 0 0
A 1954 1 0 0 153 2455 7181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1957 1 0 0 1292 2464 7183 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2055 2 0 0 2000 7 7662 0 0 0 2055 0 0 0 0 0 0 0 0 0 0 0
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
V 1954 2455 7 0
S 0 2455 0 0 0
A 0 6 0 0 1 2 0
J 132 1 1
V 1957 2464 7 0
S 0 2464 0 0 0
A 0 6 0 0 1 2 0
T 1386 342 0 0 0 0
A 1389 7 359 0 1 2 1
A 1392 7 361 0 1 2 1
A 1395 7 363 0 1 2 0
T 1416 368 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 1492 395 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 1572 422 0 3 0 0
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 4017 958 0 3 0 0
A 4026 7 982 0 1 2 1
A 4029 7 984 0 1 2 0
T 4134 1094 0 3 0 0
A 4135 22 0 0 1 1112 1
A 4136 19 0 0 1 1113 1
A 4137 7 0 0 1 10 0
T 4141 1102 0 3 0 0
A 4143 22 0 0 1 1112 1
A 4144 22 0 0 1 1112 1
A 4145 19 0 0 1 1113 1
A 4146 7 0 0 1 10 1
A 4147 19 0 0 1 1113 1
A 4148 19 0 0 1 1086 1
T 4142 1094 0 3 0 0
A 4135 22 0 0 1 1112 1
A 4136 19 0 0 1 1113 1
A 4137 7 0 0 1 10 0
T 4329 1213 0 3 0 0
T 4330 1161 0 3 0 1
A 1389 7 1167 0 1 2 1
A 1392 7 1169 0 1 2 1
A 1395 7 1171 0 1 2 0
T 4331 1173 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4332 1173 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4333 1173 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4334 1179 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4435 1298 0 3 0 0
A 4436 7 0 0 1 1358 1
R 4439 1306 0 1
A 0 7 0 1087 1 10 0
A 4452 19 0 0 1 1113 0
T 4956 1495 0 3 0 0
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5001 1512 0 3 0 0
T 5002 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5003 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5019 1521 0 3 0 0
T 5020 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5021 1512 0 3 0 1
T 5002 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5003 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5022 1512 0 3 0 1
T 5002 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5003 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5023 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5024 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5025 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5026 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5027 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5028 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5029 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5030 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5031 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5032 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5033 1443 0 3 0 0
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5042 1529 0 3 0 0
T 5043 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5044 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5045 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5046 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5047 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5048 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5049 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5052 1538 0 3 0 0
T 5058 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5059 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5053 1521 0 3 0 0
T 5020 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5021 1512 0 3 0 1
T 5002 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5003 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5022 1512 0 3 0 1
T 5002 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5003 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5023 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5024 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5025 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5026 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5027 1495 0 3 0 1
T 4957 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4958 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4959 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 4960 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5028 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5029 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5030 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5031 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5032 1443 0 3 0 1
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5033 1443 0 3 0 0
A 1389 7 1449 0 1 2 1
A 1392 7 1451 0 1 2 1
A 1395 7 1453 0 1 2 0
T 5063 1550 0 3 0 0
T 5064 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5065 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5068 1559 0 3 0 0
T 5069 1550 0 3 0 1
T 5064 1461 0 3 0 1
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5065 1461 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
T 5074 1455 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5075 1455 0 3 0 0
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 5078 1568 0 3 0 0
T 5079 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5080 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5081 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5082 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5083 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5084 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5085 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5086 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5087 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5088 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5089 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5090 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5091 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5092 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5093 1467 0 3 0 1
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 5094 1467 0 3 0 0
A 1573 7 0 0 1 10 1
A 1574 7 0 0 1 10 1
A 1575 7 0 0 1 10 1
A 1576 7 0 0 1 10 0
T 6622 2220 0 3 0 0
T 6623 2057 0 3 0 0
A 4143 22 0 0 1 1112 1
A 4144 22 0 0 1 1112 1
A 4145 19 0 0 1 1113 1
A 4146 7 0 0 1 10 1
A 4147 19 0 0 1 1113 1
A 4148 19 0 0 1 1086 1
T 4142 2051 0 3 0 0
A 4135 22 0 0 1 1112 1
A 4136 19 0 0 1 1113 1
A 4137 7 0 0 1 10 0
T 6639 2235 0 3 0 0
A 6641 19 0 0 1 1113 1
A 6642 19 0 0 1 1113 1
A 6643 19 0 0 1 1113 1
A 6644 19 0 0 1 1113 1
A 6645 22 0 0 1 1112 1
A 6646 22 0 0 1 1112 1
A 6647 22 0 0 1 1112 1
A 6648 22 0 0 1 1112 1
T 6640 2051 0 3 0 0
A 4135 22 0 0 1 1112 1
A 4136 19 0 0 1 1113 1
A 4137 7 0 0 1 10 0
T 6781 2348 0 3 0 0
T 6783 2063 0 3 0 1
A 1389 7 2069 0 1 2 1
A 1392 7 2071 0 1 2 1
A 1395 7 2073 0 1 2 0
T 6784 2063 0 3 0 1
A 1389 7 2069 0 1 2 1
A 1392 7 2071 0 1 2 1
A 1395 7 2073 0 1 2 0
T 6782 2214 0 3 0 0
T 4330 2190 0 3 0 1
A 1389 7 2196 0 1 2 1
A 1392 7 2198 0 1 2 1
A 1395 7 2200 0 1 2 0
T 4331 2202 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4332 2202 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4333 2202 0 3 0 1
A 1417 7 0 0 1 10 1
A 1418 19 0 0 1 1086 0
T 4334 2208 0 3 0 0
A 1493 7 0 0 1 10 1
A 1494 7 0 0 1 10 0
Z
