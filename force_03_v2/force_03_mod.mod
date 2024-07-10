V34 :0x3c force_03_mod
12 force_03.f03 S624 0
07/08/2024  10:27:57
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
D 342 26 1391 88 1390 7
D 359 22 7
D 361 22 7
D 363 22 7
D 368 26 1421 512 1420 7
D 395 26 1497 720 1496 7
D 422 26 1579 1024 1578 7
D 958 26 4040 104 4037 7
D 982 22 958
D 984 22 958
D 1094 26 4155 272 4154 7
D 1102 26 4162 1328 4161 7
D 1161 26 1391 88 1390 7
D 1167 22 7
D 1169 22 7
D 1171 22 7
D 1173 26 1421 512 1420 7
D 1179 26 1497 720 1496 7
D 1213 26 4350 2344 4349 7
D 1298 26 4456 512 4455 7
D 1306 23 7 1 11 1087 0 0 0 0 0
 0 1087 11 11 1087 1087
D 1443 26 1391 88 1390 7
D 1449 22 7
D 1451 22 7
D 1453 22 7
D 1455 26 1421 512 1420 7
D 1461 26 1497 720 1496 7
D 1467 26 1579 1024 1578 7
D 1495 26 4984 3152 4983 7
D 1512 26 5030 1152 5029 7
D 1521 26 5048 22520 5047 7
D 1529 26 5071 5040 5070 7
D 1538 26 5081 23784 5080 7
D 1550 26 5092 1440 5091 7
D 1559 26 5097 2552 5096 7
D 1568 26 5107 16512 5106 7
D 2060 26 4155 272 4154 7
D 2066 26 4162 1328 4161 7
D 2072 26 1391 88 1390 7
D 2078 22 7
D 2080 22 7
D 2082 22 7
D 2199 26 1391 88 1390 7
D 2205 22 7
D 2207 22 7
D 2209 22 7
D 2211 26 1421 512 1420 7
D 2217 26 1497 720 1496 7
D 2223 26 4350 2344 4349 7
D 2229 26 6660 1472 6659 7
D 2244 26 6677 1928 6676 7
D 2357 26 6819 2520 6818 7
D 2464 26 7189 8 7188 7
D 2473 26 7192 8 7191 7
D 2575 23 1495 1 11 1786 0 0 0 0 0
 0 1786 11 11 1786 1786
D 2578 23 1495 1 11 1786 0 0 0 0 0
 0 1786 11 11 1786 1786
D 2581 23 7 1 11 2060 0 0 1 0 0
 0 2059 11 11 2060 2060
D 2584 23 7 1 2061 2064 1 1 0 0 1
 11 2062 11 11 2062 2063
D 2587 23 7 1 2065 2068 1 1 0 0 1
 11 2066 11 11 2066 2067
D 2590 23 7 1 2069 2072 1 1 0 0 1
 11 2070 11 11 2070 2071
S 626 24 0 0 0 10 1 0 5030 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 force_03_mod
S 634 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 637 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 642 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 643 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 644 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 666 7 22 iso_fortran_env integer_kinds$ac
R 668 7 24 iso_fortran_env logical_kinds$ac
R 670 7 26 iso_fortran_env real_kinds$ac
R 873 14 169 mqc_general mqc_print_scalar_integer
R 881 14 177 mqc_general mqc_print_scalar_real
R 889 14 185 mqc_general mqc_print_scalar_complex
R 916 14 212 mqc_general mqc_print_matrix_array_integer
R 930 14 226 mqc_general mqc_print_matrix_array_real
R 944 14 240 mqc_general mqc_print_matrix_array_complex
R 958 14 254 mqc_general mqc_print_vector_array_integer
R 969 14 265 mqc_general mqc_print_vector_array_real
R 980 14 276 mqc_general mqc_print_vector_array_complex
R 991 14 287 mqc_general mqc_print_r4tensor_array_integer
R 1011 14 307 mqc_general mqc_print_r4tensor_array_real
R 1031 14 327 mqc_general mqc_print_r4tensor_array_complex
R 1054 14 350 mqc_general integer2character
R 1059 14 355 mqc_general real2character
R 1064 14 360 mqc_general complex2character
S 1377 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1379 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 1390 25 4 mqc_algebra mqc_scalar
R 1391 5 5 mqc_algebra scar mqc_scalar
R 1393 5 7 mqc_algebra scar$p mqc_scalar
R 1394 5 8 mqc_algebra scai mqc_scalar
R 1396 5 10 mqc_algebra scai$p mqc_scalar
R 1397 5 11 mqc_algebra scac mqc_scalar
R 1399 5 13 mqc_algebra scac$p mqc_scalar
R 1400 5 14 mqc_algebra data_type mqc_scalar
R 1409 5 23 mqc_algebra random$tbp$0 mqc_scalar
R 1410 5 24 mqc_algebra log$tbp$1 mqc_scalar
R 1411 5 25 mqc_algebra exp$tbp$2 mqc_scalar
R 1412 5 26 mqc_algebra sqrt$tbp$3 mqc_scalar
R 1413 5 27 mqc_algebra abs$tbp$4 mqc_scalar
R 1414 5 28 mqc_algebra cval$tbp$5 mqc_scalar
R 1415 5 29 mqc_algebra ival$tbp$6 mqc_scalar
R 1416 5 30 mqc_algebra rval$tbp$7 mqc_scalar
R 1417 5 31 mqc_algebra print$tbp$8 mqc_scalar
R 1420 25 34 mqc_algebra mqc_vector
R 1421 5 35 mqc_algebra length mqc_vector
R 1422 5 36 mqc_algebra column mqc_vector
R 1423 5 37 mqc_algebra data_type mqc_vector
R 1425 5 39 mqc_algebra vecr mqc_vector
R 1426 5 40 mqc_algebra vecr$sd mqc_vector
R 1427 5 41 mqc_algebra vecr$p mqc_vector
R 1428 5 42 mqc_algebra vecr$o mqc_vector
R 1431 5 45 mqc_algebra veci mqc_vector
R 1432 5 46 mqc_algebra veci$sd mqc_vector
R 1433 5 47 mqc_algebra veci$p mqc_vector
R 1434 5 48 mqc_algebra veci$o mqc_vector
R 1437 5 51 mqc_algebra vecc mqc_vector
R 1438 5 52 mqc_algebra vecc$sd mqc_vector
R 1439 5 53 mqc_algebra vecc$p mqc_vector
R 1440 5 54 mqc_algebra vecc$o mqc_vector
R 1458 5 72 mqc_algebra diagf$tbp$9 mqc_vector
R 1459 5 73 mqc_algebra hphdiag$tbp$10 mqc_vector
R 1460 5 74 mqc_algebra diag$tbp$11 mqc_vector
R 1461 5 75 mqc_algebra power$tbp$12 mqc_vector
R 1462 5 76 mqc_algebra product$tbp$13 mqc_vector
R 1463 5 77 mqc_algebra sum$tbp$14 mqc_vector
R 1464 5 78 mqc_algebra abs$tbp$15 mqc_vector
R 1465 5 79 mqc_algebra exp$tbp$16 mqc_vector
R 1466 5 80 mqc_algebra sqrt$tbp$17 mqc_vector
R 1467 5 81 mqc_algebra sort$tbp$18 mqc_vector
R 1468 5 82 mqc_algebra argsort$tbp$19 mqc_vector
R 1469 5 83 mqc_algebra minloc$tbp$20 mqc_vector
R 1470 5 84 mqc_algebra maxloc$tbp$21 mqc_vector
R 1471 5 85 mqc_algebra minval$tbp$22 mqc_vector
R 1472 5 86 mqc_algebra maxval$tbp$23 mqc_vector
R 1473 5 87 mqc_algebra shift$tbp$24 mqc_vector
R 1474 5 88 mqc_algebra pop$tbp$25 mqc_vector
R 1475 5 89 mqc_algebra unshift$tbp$26 mqc_vector
R 1476 5 90 mqc_algebra push$tbp$27 mqc_vector
R 1477 5 91 mqc_algebra vput$tbp$28 mqc_vector
R 1478 5 92 mqc_algebra put$tbpg$29 mqc_vector
R 1479 5 93 mqc_algebra put$tbpg$30 mqc_vector
R 1480 5 94 mqc_algebra put_int$tbp$31 mqc_vector
R 1481 5 95 mqc_algebra put_sca$tbp$32 mqc_vector
R 1482 5 96 mqc_algebra vat$tbp$33 mqc_vector
R 1483 5 97 mqc_algebra at$tbpg$34 mqc_vector
R 1484 5 98 mqc_algebra at$tbpg$35 mqc_vector
R 1485 5 99 mqc_algebra at_int$tbp$36 mqc_vector
R 1486 5 100 mqc_algebra at_sca$tbp$37 mqc_vector
R 1487 5 101 mqc_algebra dagger$tbp$38 mqc_vector
R 1488 5 102 mqc_algebra transpose$tbp$39 mqc_vector
R 1489 5 103 mqc_algebra norm$tbp$40 mqc_vector
R 1490 5 104 mqc_algebra set$tbp$41 mqc_vector
R 1491 5 105 mqc_algebra init$tbp$42 mqc_vector
R 1492 5 106 mqc_algebra size$tbp$43 mqc_vector
R 1493 5 107 mqc_algebra print$tbp$44 mqc_vector
R 1496 25 110 mqc_algebra mqc_matrix
R 1497 5 111 mqc_algebra ncol mqc_matrix
R 1498 5 112 mqc_algebra nrow mqc_matrix
R 1499 5 113 mqc_algebra data_type mqc_matrix
R 1500 5 114 mqc_algebra storage mqc_matrix
R 1503 5 117 mqc_algebra matr mqc_matrix
R 1504 5 118 mqc_algebra matr$sd mqc_matrix
R 1505 5 119 mqc_algebra matr$p mqc_matrix
R 1506 5 120 mqc_algebra matr$o mqc_matrix
R 1510 5 124 mqc_algebra mati mqc_matrix
R 1511 5 125 mqc_algebra mati$sd mqc_matrix
R 1512 5 126 mqc_algebra mati$p mqc_matrix
R 1513 5 127 mqc_algebra mati$o mqc_matrix
R 1517 5 131 mqc_algebra matc mqc_matrix
R 1518 5 132 mqc_algebra matc$sd mqc_matrix
R 1519 5 133 mqc_algebra matc$p mqc_matrix
R 1520 5 134 mqc_algebra matc$o mqc_matrix
R 1534 5 148 mqc_algebra mput$tbp$45 mqc_matrix
R 1535 5 149 mqc_algebra vput$tbp$46 mqc_matrix
R 1536 5 150 mqc_algebra put$tbpg$47 mqc_matrix
R 1537 5 151 mqc_algebra put$tbpg$48 mqc_matrix
R 1538 5 152 mqc_algebra put$tbpg$49 mqc_matrix
R 1539 5 153 mqc_algebra put$tbpg$50 mqc_matrix
R 1540 5 154 mqc_algebra put_int$tbp$51 mqc_matrix
R 1541 5 155 mqc_algebra put_intsca$tbp$52 mqc_matrix
R 1542 5 156 mqc_algebra put_scaint$tbp$53 mqc_matrix
R 1543 5 157 mqc_algebra put_sca$tbp$54 mqc_matrix
R 1544 5 158 mqc_algebra mat$tbp$55 mqc_matrix
R 1545 5 159 mqc_algebra vat$tbp$56 mqc_matrix
R 1546 5 160 mqc_algebra at$tbpg$57 mqc_matrix
R 1547 5 161 mqc_algebra at$tbpg$58 mqc_matrix
R 1548 5 162 mqc_algebra at$tbpg$59 mqc_matrix
R 1549 5 163 mqc_algebra at$tbpg$60 mqc_matrix
R 1550 5 164 mqc_algebra at_int$tbp$61 mqc_matrix
R 1551 5 165 mqc_algebra at_intsca$tbp$62 mqc_matrix
R 1552 5 166 mqc_algebra at_scaint$tbp$63 mqc_matrix
R 1553 5 167 mqc_algebra at_sca$tbp$64 mqc_matrix
R 1554 5 168 mqc_algebra power$tbp$65 mqc_matrix
R 1555 5 169 mqc_algebra sum$tbp$66 mqc_matrix
R 1556 5 170 mqc_algebra exp$tbp$67 mqc_matrix
R 1557 5 171 mqc_algebra sqrt$tbp$68 mqc_matrix
R 1558 5 172 mqc_algebra rmsmax$tbp$69 mqc_matrix
R 1559 5 173 mqc_algebra diagonal$tbp$70 mqc_matrix
R 1560 5 174 mqc_algebra pinv$tbp$71 mqc_matrix
R 1561 5 175 mqc_algebra trace$tbp$72 mqc_matrix
R 1562 5 176 mqc_algebra cofactor$tbp$73 mqc_matrix
R 1563 5 177 mqc_algebra minor$tbp$74 mqc_matrix
R 1564 5 178 mqc_algebra det$tbp$75 mqc_matrix
R 1565 5 179 mqc_algebra inv$tbp$76 mqc_matrix
R 1566 5 180 mqc_algebra eigensys$tbp$77 mqc_matrix
R 1567 5 181 mqc_algebra svd$tbp$78 mqc_matrix
R 1568 5 182 mqc_algebra diag$tbp$79 mqc_matrix
R 1569 5 183 mqc_algebra dagger$tbp$80 mqc_matrix
R 1570 5 184 mqc_algebra transpose$tbp$81 mqc_matrix
R 1571 5 185 mqc_algebra norm$tbp$82 mqc_matrix
R 1572 5 186 mqc_algebra set$tbp$83 mqc_matrix
R 1573 5 187 mqc_algebra identity$tbp$84 mqc_matrix
R 1574 5 188 mqc_algebra init$tbp$85 mqc_matrix
R 1575 5 189 mqc_algebra print$tbp$86 mqc_matrix
R 1578 25 192 mqc_algebra mqc_r4tensor
R 1579 5 193 mqc_algebra i mqc_r4tensor
R 1580 5 194 mqc_algebra j mqc_r4tensor
R 1581 5 195 mqc_algebra k mqc_r4tensor
R 1582 5 196 mqc_algebra l mqc_r4tensor
R 1583 5 197 mqc_algebra data_type mqc_r4tensor
R 1584 5 198 mqc_algebra storage mqc_r4tensor
R 1585 5 199 mqc_algebra rten mqc_r4tensor
R 1590 5 204 mqc_algebra rten$sd mqc_r4tensor
R 1591 5 205 mqc_algebra rten$p mqc_r4tensor
R 1592 5 206 mqc_algebra rten$o mqc_r4tensor
R 1594 5 208 mqc_algebra iten mqc_r4tensor
R 1599 5 213 mqc_algebra iten$sd mqc_r4tensor
R 1600 5 214 mqc_algebra iten$p mqc_r4tensor
R 1601 5 215 mqc_algebra iten$o mqc_r4tensor
R 1603 5 217 mqc_algebra cten mqc_r4tensor
R 1608 5 222 mqc_algebra cten$sd mqc_r4tensor
R 1609 5 223 mqc_algebra cten$p mqc_r4tensor
R 1610 5 224 mqc_algebra cten$o mqc_r4tensor
R 1617 5 231 mqc_algebra init$tbp$87 mqc_r4tensor
R 1618 5 232 mqc_algebra tput$tbp$88 mqc_r4tensor
R 1619 5 233 mqc_algebra mput$tbp$89 mqc_r4tensor
R 1620 5 234 mqc_algebra vput$tbp$90 mqc_r4tensor
R 1621 5 235 mqc_algebra put$tbpg$91 mqc_r4tensor
R 1622 5 236 mqc_algebra put$tbpg$92 mqc_r4tensor
R 1623 5 237 mqc_algebra put_int$tbp$93 mqc_r4tensor
R 1624 5 238 mqc_algebra put_sca$tbp$94 mqc_r4tensor
R 1625 5 239 mqc_algebra tat$tbp$95 mqc_r4tensor
R 1626 5 240 mqc_algebra mat$tbp$96 mqc_r4tensor
R 1627 5 241 mqc_algebra vat$tbp$97 mqc_r4tensor
R 1628 5 242 mqc_algebra at$tbpg$98 mqc_r4tensor
R 1629 5 243 mqc_algebra at$tbpg$99 mqc_r4tensor
R 1630 5 244 mqc_algebra at_int$tbp$100 mqc_r4tensor
R 1631 5 245 mqc_algebra at_sca$tbp$101 mqc_r4tensor
R 1632 5 246 mqc_algebra print$tbp$102 mqc_r4tensor
R 1818 26 432 mqc_algebra **
R 1823 26 437 mqc_algebra !=
R 1831 26 445 mqc_algebra ==
R 1839 26 453 mqc_algebra <
R 1845 26 459 mqc_algebra >
R 1851 26 465 mqc_algebra <=
R 1857 26 471 mqc_algebra >=
R 1867 26 481 mqc_algebra dot
R 1883 26 497 mqc_algebra ewp
R 1886 26 500 mqc_algebra ewd
R 1888 26 502 mqc_algebra x
R 1890 26 504 mqc_algebra outer
R 1929 14 543 mqc_algebra put_intsca$tbp
R 1930 14 544 mqc_algebra put_scaint$tbp
R 1936 14 550 mqc_algebra at_intsca$tbp
R 1937 14 551 mqc_algebra at_scaint$tbp
R 1982 14 596 mqc_algebra put_int$tbp
R 1983 14 597 mqc_algebra put_sca$tbp
R 1986 14 600 mqc_algebra at_int$tbp
R 1987 14 601 mqc_algebra at_sca$tbp
R 2035 14 649 mqc_algebra mqc_input_integer_scalar
R 2039 14 653 mqc_algebra mqc_input_real_scalar
R 2043 14 657 mqc_algebra mqc_input_complex_scalar
R 2047 14 661 mqc_algebra mqc_output_mqcscalar_scalar
R 2051 14 665 mqc_algebra mqc_output_integer_scalar
R 2055 14 669 mqc_algebra mqc_output_real_scalar
R 2059 14 673 mqc_algebra mqc_output_complex_scalar
R 2067 14 681 mqc_algebra mqc_print_scalar_algebra1
R 2132 14 746 mqc_algebra mqc_scalar_get_intrinsic_real
R 2136 14 750 mqc_algebra mqc_scalar_get_intrinsic_integer
R 2161 14 775 mqc_algebra mqc_scalaradd
R 2166 14 780 mqc_algebra mqc_scalarsubtract
R 2171 14 785 mqc_algebra mqc_scalarmultiply
R 2176 14 790 mqc_algebra mqc_scalardivide
R 2371 14 985 mqc_algebra mqc_scalar_complex_conjugate
R 2384 14 998 mqc_algebra mqc_integerscalarmultiply
R 2389 14 1003 mqc_algebra mqc_scalarintegermultiply
R 2394 14 1008 mqc_algebra mqc_realscalarmultiply
R 2399 14 1013 mqc_algebra mqc_scalarrealmultiply
R 2404 14 1018 mqc_algebra mqc_complexscalarmultiply
R 2409 14 1023 mqc_algebra mqc_scalarcomplexmultiply
R 2414 14 1028 mqc_algebra mqc_integerscalardivide
R 2419 14 1033 mqc_algebra mqc_scalarintegerdivide
R 2424 14 1038 mqc_algebra mqc_realscalardivide
R 2429 14 1043 mqc_algebra mqc_scalarrealdivide
R 2434 14 1048 mqc_algebra mqc_complexscalardivide
R 2439 14 1053 mqc_algebra mqc_scalarcomplexdivide
R 2444 14 1058 mqc_algebra mqc_integerscalaradd
R 2449 14 1063 mqc_algebra mqc_scalarintegeradd
R 2454 14 1068 mqc_algebra mqc_realscalaradd
R 2459 14 1073 mqc_algebra mqc_scalarrealadd
R 2464 14 1078 mqc_algebra mqc_complexscalaradd
R 2469 14 1083 mqc_algebra mqc_scalarcomplexadd
R 2474 14 1088 mqc_algebra mqc_integerscalarsubtract
R 2479 14 1093 mqc_algebra mqc_scalarintegersubtract
R 2484 14 1098 mqc_algebra mqc_realscalarsubtract
R 2489 14 1103 mqc_algebra mqc_scalarrealsubtract
R 2494 14 1108 mqc_algebra mqc_complexscalarsubtract
R 2499 14 1113 mqc_algebra mqc_scalarcomplexsubtract
R 2511 14 1125 mqc_algebra mqcscalar2character
R 2523 14 1137 mqc_algebra mqc_length_vector
R 2577 14 1191 mqc_algebra mqc_set_vector2integerarray
R 2582 14 1196 mqc_algebra mqc_set_vector2realarray
R 2587 14 1201 mqc_algebra mqc_set_vector2complexarray
R 2592 14 1206 mqc_algebra mqc_set_array2vector_integer
R 2600 14 1214 mqc_algebra mqc_set_array2vector_real
R 2608 14 1222 mqc_algebra mqc_set_array2vector_complex
R 2616 14 1230 mqc_algebra mqc_set_vector2vector
R 2620 14 1234 mqc_algebra mqc_vectorvectorsum
R 2625 14 1239 mqc_algebra mqc_vectorvectordifference
R 2630 14 1244 mqc_algebra mqc_scalarvectorsum
R 2635 14 1249 mqc_algebra mqc_vectorscalarsum
R 2640 14 1254 mqc_algebra mqc_scalarvectordifference
R 2649 14 1263 mqc_algebra mqc_vector_transpose
R 2653 14 1267 mqc_algebra mqc_vector_conjugate_transpose
R 2658 14 1272 mqc_algebra mqc_vectorvectordotproduct
R 2678 14 1292 mqc_algebra mqc_print_vector_algebra1
R 2732 14 1346 mqc_algebra mqc_scalarvectorproduct
R 2737 14 1351 mqc_algebra mqc_vectorscalarproduct
R 2742 14 1356 mqc_algebra mqc_vectorscalardivide
R 2747 14 1361 mqc_algebra mqc_realvectorproduct
R 2752 14 1366 mqc_algebra mqc_vectorrealproduct
R 2757 14 1371 mqc_algebra mqc_vectorrealdivide
R 2762 14 1376 mqc_algebra mqc_integervectorproduct
R 2767 14 1381 mqc_algebra mqc_vectorintegerproduct
R 2772 14 1386 mqc_algebra mqc_vectorintegerdivide
R 2777 14 1391 mqc_algebra mqc_complexvectorproduct
R 2782 14 1396 mqc_algebra mqc_vectorcomplexproduct
R 2787 14 1401 mqc_algebra mqc_vectorcomplexdivide
R 2891 14 1505 mqc_algebra mqc_vector_sum
R 2899 14 1513 mqc_algebra mqc_vector_complex_conjugate
R 3073 14 1687 mqc_algebra mqc_elementmatrixproduct
R 3113 14 1727 mqc_algebra mqc_set_integerarray2matrix
R 3124 14 1738 mqc_algebra mqc_set_realarray2matrix
R 3135 14 1749 mqc_algebra mqc_set_complexarray2matrix
R 3146 14 1760 mqc_algebra mqc_set_matrix2integerarray
R 3151 14 1765 mqc_algebra mqc_set_matrix2realarray
R 3156 14 1770 mqc_algebra mqc_set_matrix2complexarray
R 3161 14 1775 mqc_algebra mqc_set_matrix2matrix
R 3169 14 1783 mqc_algebra mqc_print_matrix_algebra1
R 3199 14 1813 mqc_algebra mqc_matrix_size
R 3227 14 1841 mqc_algebra mqc_matrix_transpose
R 3231 14 1845 mqc_algebra mqc_matrix_conjugate_transpose
R 3308 14 1922 mqc_algebra mqc_matrixmatrixsum
R 3313 14 1927 mqc_algebra mqc_matrixmatrixsubtract
R 3318 14 1932 mqc_algebra mqc_matrixmatrixdotproduct
R 3323 14 1937 mqc_algebra mqc_matrixvectordotproduct
R 3328 14 1942 mqc_algebra mqc_vectormatrixdotproduct
R 3333 14 1947 mqc_algebra mqc_matrixscalarproduct
R 3338 14 1952 mqc_algebra mqc_scalarmatrixproduct
R 3343 14 1957 mqc_algebra mqc_integermatrixproduct
R 3348 14 1962 mqc_algebra mqc_matrixintegerproduct
R 3353 14 1967 mqc_algebra mqc_realmatrixproduct
R 3358 14 1972 mqc_algebra mqc_matrixrealproduct
R 3363 14 1977 mqc_algebra mqc_complexmatrixproduct
R 3368 14 1982 mqc_algebra mqc_matrixcomplexproduct
R 3373 14 1987 mqc_algebra mqc_matrixscalardivide
R 3380 14 1994 mqc_algebra mqc_matrix_matrix_contraction
R 3555 14 2169 mqc_algebra mqc_matrix_complex_conjugate
R 3571 14 2185 mqc_algebra mqc_matrix_sum
R 3634 14 2248 mqc_algebra mqc_print_r4tensor_algebra1
R 3638 14 2252 mqc_algebra mqc_set_integerarray2tensor
R 3655 14 2269 mqc_algebra mqc_set_realarray2tensor
R 3672 14 2286 mqc_algebra mqc_set_complexarray2tensor
R 3689 14 2303 mqc_algebra mqc_set_tensor2integerarray
R 3694 14 2308 mqc_algebra mqc_set_tensor2realarray
R 3699 14 2313 mqc_algebra mqc_set_tensor2complexarray
R 3757 14 2371 mqc_algebra mqc_r4tensor_size
R 3784 14 2398 mqc_algebra mqc_r4tensor_r4tensor_contraction
R 3789 14 2403 mqc_algebra mqc_r4tensor_r4tensor_sum
R 3794 14 2408 mqc_algebra mqc_r4tensor_r4tensor_difference
R 3947 14 2561 mqc_algebra mqc_r4tensorscalardivide
R 3954 14 2568 mqc_algebra mqc_scalarr4tensorproduct
R 3961 14 2575 mqc_algebra mqc_r4tensorscalarproduct
R 3967 14 2581 mqc_algebra mqc_r4tensor_complex_conjugate
R 3980 14 2594 mqc_algebra put_int$tbp
R 3981 14 2595 mqc_algebra put_sca$tbp
R 3985 14 2599 mqc_algebra at_int$tbp
R 3986 14 2600 mqc_algebra at_sca$tbp
R 3991 14 2605 mqc_algebra put_int$tbp
R 3992 14 2606 mqc_algebra put_sca$tbp
R 3996 14 2610 mqc_algebra at_int$tbp
R 3997 14 2611 mqc_algebra at_sca$tbp
S 4034 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 4037 25 3 mqc_datastructures mqc_linkedlist
R 4040 5 6 mqc_datastructures val mqc_linkedlist
R 4042 5 8 mqc_datastructures val$td mqc_linkedlist
R 4043 5 9 mqc_datastructures val$p mqc_linkedlist
R 4044 5 10 mqc_datastructures previous mqc_linkedlist
R 4046 5 12 mqc_datastructures previous$p mqc_linkedlist
R 4047 5 13 mqc_datastructures next mqc_linkedlist
R 4049 5 15 mqc_datastructures next$p mqc_linkedlist
S 4151 3 0 0 0 22 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 24541 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1 20
S 4152 3 0 0 0 19 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19
R 4154 25 1 mqc_files mqc_fileinfo
R 4155 5 2 mqc_files filename mqc_fileinfo
R 4156 5 3 mqc_files currentlyopen mqc_fileinfo
R 4157 5 4 mqc_files unitnumber mqc_fileinfo
R 4158 5 5 mqc_files isopen$tbp$0 mqc_fileinfo
R 4161 25 8 mqc_files mqc_text_fileinfo
R 4162 5 9 mqc_files mqc_fileinfo mqc_text_fileinfo
R 4163 5 10 mqc_files buffer mqc_text_fileinfo
R 4164 5 11 mqc_files buffer_caps mqc_text_fileinfo
R 4165 5 12 mqc_files buffer_loaded mqc_text_fileinfo
R 4166 5 13 mqc_files buffer_cursor mqc_text_fileinfo
R 4167 5 14 mqc_files inside_quotes mqc_text_fileinfo
R 4168 5 15 mqc_files skip_multiple_delimits mqc_text_fileinfo
R 4169 5 16 mqc_files isopen$tbp$1 mqc_text_fileinfo
R 4170 5 17 mqc_files writeline$tbp$2 mqc_text_fileinfo
R 4171 5 18 mqc_files getnextinteger$tbp$3 mqc_text_fileinfo
R 4172 5 19 mqc_files getnextstring$tbp$4 mqc_text_fileinfo
R 4173 5 20 mqc_files getbuffer$tbp$5 mqc_text_fileinfo
R 4174 5 21 mqc_files loadbuffer$tbp$6 mqc_text_fileinfo
R 4175 5 22 mqc_files rewind$tbp$7 mqc_text_fileinfo
R 4176 5 23 mqc_files closefile$tbp$8 mqc_text_fileinfo
R 4177 5 24 mqc_files openfile$tbp$9 mqc_text_fileinfo
R 4349 25 1 mqc_molecule mqc_molecule_data
R 4350 5 2 mqc_molecule natoms mqc_molecule_data
R 4351 5 3 mqc_molecule atomic_numbers mqc_molecule_data
R 4352 5 4 mqc_molecule atomic_masses mqc_molecule_data
R 4353 5 5 mqc_molecule nuclear_charges mqc_molecule_data
R 4354 5 6 mqc_molecule cartesian_coordinates mqc_molecule_data
R 4356 5 8 mqc_molecule updatemoldata$tbp$0 mqc_molecule_data
R 4357 5 9 mqc_molecule getnumatoms$tbp$1 mqc_molecule_data
R 4358 5 10 mqc_molecule getnucrep$tbp$2 mqc_molecule_data
R 4359 5 11 mqc_molecule print$tbp$3 mqc_molecule_data
R 4435 14 87 mqc_molecule mqc_print_nuclear_geometry
R 4455 25 3 mqc_algebra2 mqc_variable
R 4456 5 4 mqc_algebra2 rank mqc_variable
R 4457 5 5 mqc_algebra2 datatype mqc_variable
R 4458 5 6 mqc_algebra2 storageformat mqc_variable
R 4459 5 7 mqc_algebra2 dimensions mqc_variable
R 4461 5 9 mqc_algebra2 realarray mqc_variable
R 4462 5 10 mqc_algebra2 realarray$sd mqc_variable
R 4463 5 11 mqc_algebra2 realarray$p mqc_variable
R 4464 5 12 mqc_algebra2 realarray$o mqc_variable
R 4467 5 15 mqc_algebra2 integerarray mqc_variable
R 4468 5 16 mqc_algebra2 integerarray$sd mqc_variable
R 4469 5 17 mqc_algebra2 integerarray$p mqc_variable
R 4470 5 18 mqc_algebra2 integerarray$o mqc_variable
R 4472 5 20 mqc_algebra2 initialized mqc_variable
R 4481 14 29 mqc_algebra2 mqc_variable_put_mqc$tbp
R 4483 14 31 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp
R 4485 14 33 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp
R 4492 5 40 mqc_algebra2 submatrix$tbp$0 mqc_variable
R 4493 5 41 mqc_algebra2 det$tbp$1 mqc_variable
R 4494 5 42 mqc_algebra2 diag$tbp$2 mqc_variable
R 4495 5 43 mqc_algebra2 eigen$tbp$3 mqc_variable
R 4496 5 44 mqc_algebra2 column$tbp$4 mqc_variable
R 4497 5 45 mqc_algebra2 rpower$tbp$5 mqc_variable
R 4498 5 46 mqc_algebra2 ipower$tbp$6 mqc_variable
R 4499 5 47 mqc_algebra2 isconformable$tbp$7 mqc_variable
R 4500 5 48 mqc_algebra2 print$tbp$8 mqc_variable
R 4501 5 49 mqc_algebra2 gettype$tbp$9 mqc_variable
R 4502 5 50 mqc_algebra2 getrank$tbp$10 mqc_variable
R 4503 5 51 mqc_algebra2 getval$tbp$11 mqc_variable
R 4504 5 52 mqc_algebra2 put$tbpg$12 mqc_variable
R 4505 5 53 mqc_algebra2 put$tbpg$13 mqc_variable
R 4506 5 54 mqc_algebra2 put$tbpg$14 mqc_variable
R 4507 5 55 mqc_algebra2 putmqc$tbp$15 mqc_variable
R 4508 5 56 mqc_algebra2 mqc_variable_put_intrinsicreal$tbp$16 mqc_variable
R 4509 5 57 mqc_algebra2 mqc_variable_put_intrinsicinteger$tbp$17 mqc_variable
R 4510 5 58 mqc_algebra2 mqc_variable_put_mqc$tbp$18 mqc_variable
R 4511 5 59 mqc_algebra2 clear$tbpg$19 mqc_variable
R 4512 5 60 mqc_algebra2 clear$tbpg$20 mqc_variable
R 4513 5 61 mqc_algebra2 clear$tbpg$21 mqc_variable
R 4514 5 62 mqc_algebra2 mqc_variable_clear_real$tbp$22 mqc_variable
R 4515 5 63 mqc_algebra2 mqc_variable_clear_integer$tbp$23 mqc_variable
R 4516 5 64 mqc_algebra2 mqc_variable_clear_mqc$tbp$24 mqc_variable
R 4517 5 65 mqc_algebra2 init$tbp$25 mqc_variable
R 4570 26 118 mqc_algebra2 conformable
R 4632 14 180 mqc_algebra2 mqc_variable_getsize
R 4665 14 213 mqc_algebra2 mqc_print_mqcvariable
R 4782 14 330 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_integer
R 4786 14 334 mqc_algebra2 mqc_variable_setval_intrinsicscalar2mqcscalar_real
R 4790 14 338 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_integer
R 4798 14 346 mqc_algebra2 mqc_variable_setval_intrinsicvector2mqcvector_real
R 4806 14 354 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_integer
R 4817 14 365 mqc_algebra2 mqc_variable_setval_intrinsicmatrix2mqcmatrix_real
R 4828 14 376 mqc_algebra2 mqc_variable_setval_intrinsicrank42mqcrank4_real
R 4845 14 393 mqc_algebra2 mqc_variable_mqc2intrinsicintegerscalar
R 4849 14 397 mqc_algebra2 mqc_variable_mqc2intrinsicrealscalar
R 4853 14 401 mqc_algebra2 mqc_variable_mqc2intrinsicinteger1array
R 4858 14 406 mqc_algebra2 mqc_variable_mqc2intrinsicreal1array
R 4863 14 411 mqc_algebra2 mqc_variable_mqc2intrinsicinteger2array
R 4868 14 416 mqc_algebra2 mqc_variable_mqc2intrinsicreal2array
R 4873 14 421 mqc_algebra2 mqc_variable_mqc2intrinsicreal4array
R 4886 14 434 mqc_algebra2 mqc_variable_int_scalar
R 4890 14 438 mqc_algebra2 mqc_variable_float_scalar
R 4894 14 442 mqc_algebra2 mqc_variable_matrix_transpose
R 4899 14 447 mqc_algebra2 mqc_variable_addition
R 4904 14 452 mqc_algebra2 mqc_variable_subtraction
R 4909 14 457 mqc_algebra2 mqc_variable_multiplication
R 4914 14 462 mqc_algebra2 mqc_variable_division
R 4929 14 477 mqc_algebra2 mqc_variable_array_sum
R 4940 14 488 mqc_algebra2 mqc_variable_contraction_full
R 4945 14 493 mqc_algebra2 mqc_variable_dot_product
R 4960 14 508 mqc_algebra2 mqc_variable_matrix_multiplication
R 4983 25 4 mqc_est mqc_scf_integral
R 4984 5 5 mqc_est alpha mqc_scf_integral
R 4985 5 6 mqc_est beta mqc_scf_integral
R 4986 5 7 mqc_est alphabeta mqc_scf_integral
R 4987 5 8 mqc_est betaalpha mqc_scf_integral
R 4988 5 9 mqc_est array_name mqc_scf_integral
R 4989 5 10 mqc_est array_type mqc_scf_integral
R 4991 5 12 mqc_est energy_list mqc_scf_integral
R 4992 5 13 mqc_est energy_list$sd mqc_scf_integral
R 4993 5 14 mqc_est energy_list$p mqc_scf_integral
R 4994 5 15 mqc_est energy_list$o mqc_scf_integral
R 4998 5 19 mqc_est swapodb$tbp$0 mqc_scf_integral
R 4999 5 20 mqc_est combine$tbp$1 mqc_scf_integral
R 5000 5 21 mqc_est swap$tbp$2 mqc_scf_integral
R 5001 5 22 mqc_est orbitals$tbp$3 mqc_scf_integral
R 5002 5 23 mqc_est deleteelist$tbp$4 mqc_scf_integral
R 5003 5 24 mqc_est getelist$tbp$5 mqc_scf_integral
R 5004 5 25 mqc_est setelist$tbp$6 mqc_scf_integral
R 5005 5 26 mqc_est at$tbp$7 mqc_scf_integral
R 5006 5 27 mqc_est powerf$tbp$8 mqc_scf_integral
R 5007 5 28 mqc_est power$tbp$9 mqc_scf_integral
R 5008 5 29 mqc_est norm$tbp$10 mqc_scf_integral
R 5009 5 30 mqc_est det$tbp$11 mqc_scf_integral
R 5010 5 31 mqc_est trace$tbp$12 mqc_scf_integral
R 5011 5 32 mqc_est inv$tbp$13 mqc_scf_integral
R 5012 5 33 mqc_est eigensys$tbp$14 mqc_scf_integral
R 5013 5 34 mqc_est svd$tbp$15 mqc_scf_integral
R 5014 5 35 mqc_est diag$tbp$16 mqc_scf_integral
R 5015 5 36 mqc_est init$tbp$17 mqc_scf_integral
R 5016 5 37 mqc_est identity$tbp$18 mqc_scf_integral
R 5017 5 38 mqc_est getblock$tbp$19 mqc_scf_integral
R 5018 5 39 mqc_est addlabel$tbp$20 mqc_scf_integral
R 5019 5 40 mqc_est getlabel$tbp$21 mqc_scf_integral
R 5020 5 41 mqc_est blocksize$tbp$22 mqc_scf_integral
R 5021 5 42 mqc_est type$tbp$23 mqc_scf_integral
R 5022 5 43 mqc_est hasbetaalpha$tbp$24 mqc_scf_integral
R 5023 5 44 mqc_est hasalphabeta$tbp$25 mqc_scf_integral
R 5024 5 45 mqc_est hasbeta$tbp$26 mqc_scf_integral
R 5025 5 46 mqc_est hasalpha$tbp$27 mqc_scf_integral
R 5026 5 47 mqc_est print$tbp$28 mqc_scf_integral
R 5029 25 50 mqc_est mqc_scf_eigenvalues
R 5030 5 51 mqc_est alpha mqc_scf_eigenvalues
R 5031 5 52 mqc_est beta mqc_scf_eigenvalues
R 5032 5 53 mqc_est array_name mqc_scf_eigenvalues
R 5033 5 54 mqc_est array_type mqc_scf_eigenvalues
R 5035 5 56 mqc_est at$tbp$29 mqc_scf_eigenvalues
R 5036 5 57 mqc_est power$tbp$30 mqc_scf_eigenvalues
R 5037 5 58 mqc_est getblock$tbp$31 mqc_scf_eigenvalues
R 5038 5 59 mqc_est addlabel$tbp$32 mqc_scf_eigenvalues
R 5039 5 60 mqc_est getlabel$tbp$33 mqc_scf_eigenvalues
R 5040 5 61 mqc_est blocksize$tbp$34 mqc_scf_eigenvalues
R 5041 5 62 mqc_est type$tbp$35 mqc_scf_eigenvalues
R 5042 5 63 mqc_est hasbeta$tbp$36 mqc_scf_eigenvalues
R 5043 5 64 mqc_est hasalpha$tbp$37 mqc_scf_eigenvalues
R 5044 5 65 mqc_est print$tbp$38 mqc_scf_eigenvalues
R 5047 25 68 mqc_est mqc_wavefunction
R 5048 5 69 mqc_est mo_coefficients mqc_wavefunction
R 5049 5 70 mqc_est mo_energies mqc_wavefunction
R 5050 5 71 mqc_est mo_symmetries mqc_wavefunction
R 5051 5 72 mqc_est core_hamiltonian mqc_wavefunction
R 5052 5 73 mqc_est fock_matrix mqc_wavefunction
R 5053 5 74 mqc_est density_matrix mqc_wavefunction
R 5054 5 75 mqc_est scf_density_matrix mqc_wavefunction
R 5055 5 76 mqc_est overlap_matrix mqc_wavefunction
R 5056 5 77 mqc_est nalpha mqc_wavefunction
R 5057 5 78 mqc_est nbeta mqc_wavefunction
R 5058 5 79 mqc_est nelectrons mqc_wavefunction
R 5059 5 80 mqc_est nbasis mqc_wavefunction
R 5060 5 81 mqc_est charge mqc_wavefunction
R 5061 5 82 mqc_est multiplicity mqc_wavefunction
R 5062 5 83 mqc_est basis mqc_wavefunction
R 5063 5 84 mqc_est symmetry mqc_wavefunction
R 5064 5 85 mqc_est wf_type mqc_wavefunction
R 5065 5 86 mqc_est wf_complex mqc_wavefunction
R 5067 5 88 mqc_est print$tbp$39 mqc_wavefunction
R 5070 25 91 mqc_est mqc_basis_set
R 5071 5 92 mqc_est sh2atmp mqc_basis_set
R 5072 5 93 mqc_est shltyp mqc_basis_set
R 5073 5 94 mqc_est nprmsh mqc_basis_set
R 5074 5 95 mqc_est prmexp mqc_basis_set
R 5075 5 96 mqc_est concoef mqc_basis_set
R 5076 5 97 mqc_est concotwo mqc_basis_set
R 5077 5 98 mqc_est shcoor mqc_basis_set
R 5080 25 101 mqc_est mqc_pscf_wavefunction
R 5081 5 102 mqc_est mqc_wavefunction mqc_pscf_wavefunction
R 5082 5 103 mqc_est ncore mqc_pscf_wavefunction
R 5083 5 104 mqc_est nval mqc_pscf_wavefunction
R 5084 5 105 mqc_est nactive mqc_pscf_wavefunction
R 5085 5 106 mqc_est nfrz mqc_pscf_wavefunction
R 5086 5 107 mqc_est pscf_amplitudes mqc_pscf_wavefunction
R 5087 5 108 mqc_est pscf_energies mqc_pscf_wavefunction
R 5088 5 109 mqc_est print$tbp$40 mqc_pscf_wavefunction
R 5091 25 112 mqc_est mqc_determinant_string
R 5092 5 113 mqc_est alpha mqc_determinant_string
R 5093 5 114 mqc_est beta mqc_determinant_string
R 5096 25 117 mqc_est mqc_determinant
R 5097 5 118 mqc_est strings mqc_determinant
R 5098 5 119 mqc_est order mqc_determinant
R 5099 5 120 mqc_est ndets mqc_determinant
R 5100 5 121 mqc_est nalpstr mqc_determinant
R 5101 5 122 mqc_est nbetstr mqc_determinant
R 5102 5 123 mqc_est nsubsalpha mqc_determinant
R 5103 5 124 mqc_est nsubsbeta mqc_determinant
R 5106 25 127 mqc_est mqc_twoeris
R 5107 5 128 mqc_est alpha mqc_twoeris
R 5108 5 129 mqc_est beta mqc_twoeris
R 5109 5 130 mqc_est alphabeta mqc_twoeris
R 5110 5 131 mqc_est betaalpha mqc_twoeris
R 5111 5 132 mqc_est aaab mqc_twoeris
R 5112 5 133 mqc_est aaba mqc_twoeris
R 5113 5 134 mqc_est abaa mqc_twoeris
R 5114 5 135 mqc_est baaa mqc_twoeris
R 5115 5 136 mqc_est abab mqc_twoeris
R 5116 5 137 mqc_est baab mqc_twoeris
R 5117 5 138 mqc_est baba mqc_twoeris
R 5118 5 139 mqc_est abba mqc_twoeris
R 5119 5 140 mqc_est bbba mqc_twoeris
R 5120 5 141 mqc_est bbab mqc_twoeris
R 5121 5 142 mqc_est babb mqc_twoeris
R 5122 5 143 mqc_est abbb mqc_twoeris
R 5123 5 144 mqc_est integraltype mqc_twoeris
R 5124 5 145 mqc_est storagetype mqc_twoeris
R 5126 5 147 mqc_est type$tbp$41 mqc_twoeris
R 5127 5 148 mqc_est getblock$tbp$42 mqc_twoeris
R 5128 5 149 mqc_est hasspinblock$tbp$43 mqc_twoeris
R 5129 5 150 mqc_est blocksize$tbp$44 mqc_twoeris
R 5130 5 151 mqc_est at$tbp$45 mqc_twoeris
R 5131 5 152 mqc_est print$tbp$46 mqc_twoeris
R 5220 14 241 mqc_est mqc_print_wavefunction
R 5228 14 249 mqc_est mqc_print_integral
R 5236 14 257 mqc_est mqc_print_eigenvalues
R 5243 14 264 mqc_est mqc_print_twoeris
R 5460 14 481 mqc_est mqc_integral_output_array
R 5464 14 485 mqc_est mqc_eigenvalues_output_array
R 5468 14 489 mqc_est mqc_2eris_output_array
R 5474 14 495 mqc_est mqc_integral_matrix_multiply
R 5480 14 501 mqc_est mqc_matrix_integral_multiply
R 5485 14 506 mqc_est mqc_integral_sum
R 5490 14 511 mqc_est mqc_integral_difference
R 5495 14 516 mqc_est mqc_matrix_integral_difference
R 5501 14 522 mqc_est mqc_integral_integral_multiply
R 5506 14 527 mqc_est mqc_scalar_integral_multiply
R 5513 14 534 mqc_est mqc_integral_scalar_multiply
R 5521 14 542 mqc_est mqc_integral_eigenvalues_multiply
R 5527 14 548 mqc_est mqc_eigenvalues_integral_multiply
R 5533 14 554 mqc_est mqc_eigenvalues_eigenvalues_multiply
R 5538 14 559 mqc_est mqc_eigenvalue_eigenvalue_dotproduct
R 5543 14 564 mqc_est mqc_integral_transpose
R 5548 14 569 mqc_est mqc_integral_conjugate_transpose
R 5575 14 596 mqc_est mqc_scf_integral_contraction
R 5582 14 603 mqc_est mqc_eri_integral_contraction
R 5592 14 613 mqc_est mqc_eri_r4tensor_contraction
R 5632 14 653 mqc_est mqc_scf_integral_conjg
S 6658 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 6659 25 1 mqc_gaussian mqc_gaussian_fchk_file
R 6660 5 2 mqc_gaussian mqc_text_fileinfo mqc_gaussian_fchk_file
R 6661 5 3 mqc_gaussian title mqc_gaussian_fchk_file
R 6662 5 4 mqc_gaussian jobtype mqc_gaussian_fchk_file
R 6663 5 5 mqc_gaussian method mqc_gaussian_fchk_file
R 6664 5 6 mqc_gaussian basisset mqc_gaussian_fchk_file
R 6665 5 7 mqc_gaussian closefile$tbp$0 mqc_gaussian_fchk_file
R 6666 5 8 mqc_gaussian rewind$tbp$1 mqc_gaussian_fchk_file
R 6667 5 9 mqc_gaussian loadbuffer$tbp$2 mqc_gaussian_fchk_file
R 6668 5 10 mqc_gaussian getbuffer$tbp$3 mqc_gaussian_fchk_file
R 6669 5 11 mqc_gaussian getnextstring$tbp$5 mqc_gaussian_fchk_file
R 6670 5 12 mqc_gaussian getnextinteger$tbp$6 mqc_gaussian_fchk_file
R 6671 5 13 mqc_gaussian writeline$tbp$7 mqc_gaussian_fchk_file
R 6672 5 14 mqc_gaussian isopen$tbp$8 mqc_gaussian_fchk_file
R 6673 5 15 mqc_gaussian openfile$tbp$10 mqc_gaussian_fchk_file
R 6676 25 18 mqc_gaussian mqc_gaussian_unformatted_matrix_file
R 6677 5 19 mqc_gaussian mqc_fileinfo mqc_gaussian_unformatted_matrix_file
R 6678 5 20 mqc_gaussian declared mqc_gaussian_unformatted_matrix_file
R 6679 5 21 mqc_gaussian header_read mqc_gaussian_unformatted_matrix_file
R 6680 5 22 mqc_gaussian header_written mqc_gaussian_unformatted_matrix_file
R 6681 5 23 mqc_gaussian gaussianscalars_read mqc_gaussian_unformatted_matrix_file
R 6682 5 24 mqc_gaussian readwritemode mqc_gaussian_unformatted_matrix_file
R 6683 5 25 mqc_gaussian labfil mqc_gaussian_unformatted_matrix_file
R 6684 5 26 mqc_gaussian gvers mqc_gaussian_unformatted_matrix_file
R 6685 5 27 mqc_gaussian title mqc_gaussian_unformatted_matrix_file
R 6686 5 28 mqc_gaussian natoms mqc_gaussian_unformatted_matrix_file
R 6688 5 30 mqc_gaussian natoms$p mqc_gaussian_unformatted_matrix_file
R 6689 5 31 mqc_gaussian nbasis mqc_gaussian_unformatted_matrix_file
R 6691 5 33 mqc_gaussian nbasis$p mqc_gaussian_unformatted_matrix_file
R 6692 5 34 mqc_gaussian nbasisuse mqc_gaussian_unformatted_matrix_file
R 6694 5 36 mqc_gaussian nbasisuse$p mqc_gaussian_unformatted_matrix_file
R 6695 5 37 mqc_gaussian icharge mqc_gaussian_unformatted_matrix_file
R 6697 5 39 mqc_gaussian icharge$p mqc_gaussian_unformatted_matrix_file
R 6698 5 40 mqc_gaussian multiplicity mqc_gaussian_unformatted_matrix_file
R 6700 5 42 mqc_gaussian multiplicity$p mqc_gaussian_unformatted_matrix_file
R 6701 5 43 mqc_gaussian nelectrons mqc_gaussian_unformatted_matrix_file
R 6703 5 45 mqc_gaussian nelectrons$p mqc_gaussian_unformatted_matrix_file
R 6704 5 46 mqc_gaussian icgu mqc_gaussian_unformatted_matrix_file
R 6706 5 48 mqc_gaussian icgu$p mqc_gaussian_unformatted_matrix_file
R 6707 5 49 mqc_gaussian nfc mqc_gaussian_unformatted_matrix_file
R 6709 5 51 mqc_gaussian nfc$p mqc_gaussian_unformatted_matrix_file
R 6710 5 52 mqc_gaussian nfv mqc_gaussian_unformatted_matrix_file
R 6712 5 54 mqc_gaussian nfv$p mqc_gaussian_unformatted_matrix_file
R 6713 5 55 mqc_gaussian itran mqc_gaussian_unformatted_matrix_file
R 6715 5 57 mqc_gaussian itran$p mqc_gaussian_unformatted_matrix_file
R 6716 5 58 mqc_gaussian idum9 mqc_gaussian_unformatted_matrix_file
R 6718 5 60 mqc_gaussian idum9$p mqc_gaussian_unformatted_matrix_file
R 6719 5 61 mqc_gaussian nshlao mqc_gaussian_unformatted_matrix_file
R 6721 5 63 mqc_gaussian nshlao$p mqc_gaussian_unformatted_matrix_file
R 6722 5 64 mqc_gaussian nprmao mqc_gaussian_unformatted_matrix_file
R 6724 5 66 mqc_gaussian nprmao$p mqc_gaussian_unformatted_matrix_file
R 6725 5 67 mqc_gaussian nshldb mqc_gaussian_unformatted_matrix_file
R 6727 5 69 mqc_gaussian nshldb$p mqc_gaussian_unformatted_matrix_file
R 6728 5 70 mqc_gaussian nprmdb mqc_gaussian_unformatted_matrix_file
R 6730 5 72 mqc_gaussian nprmdb$p mqc_gaussian_unformatted_matrix_file
R 6731 5 73 mqc_gaussian nbtot mqc_gaussian_unformatted_matrix_file
R 6733 5 75 mqc_gaussian nbtot$p mqc_gaussian_unformatted_matrix_file
R 6735 5 77 mqc_gaussian atomicnumbers mqc_gaussian_unformatted_matrix_file
R 6736 5 78 mqc_gaussian atomicnumbers$sd mqc_gaussian_unformatted_matrix_file
R 6737 5 79 mqc_gaussian atomicnumbers$p mqc_gaussian_unformatted_matrix_file
R 6738 5 80 mqc_gaussian atomicnumbers$o mqc_gaussian_unformatted_matrix_file
R 6740 5 82 mqc_gaussian atomtypes mqc_gaussian_unformatted_matrix_file
R 6742 5 84 mqc_gaussian atomtypes$sd mqc_gaussian_unformatted_matrix_file
R 6743 5 85 mqc_gaussian atomtypes$p mqc_gaussian_unformatted_matrix_file
R 6744 5 86 mqc_gaussian atomtypes$o mqc_gaussian_unformatted_matrix_file
R 6746 5 88 mqc_gaussian basisfunction2atom mqc_gaussian_unformatted_matrix_file
R 6748 5 90 mqc_gaussian basisfunction2atom$sd mqc_gaussian_unformatted_matrix_file
R 6749 5 91 mqc_gaussian basisfunction2atom$p mqc_gaussian_unformatted_matrix_file
R 6750 5 92 mqc_gaussian basisfunction2atom$o mqc_gaussian_unformatted_matrix_file
R 6752 5 94 mqc_gaussian ibasisfunctiontype mqc_gaussian_unformatted_matrix_file
R 6754 5 96 mqc_gaussian ibasisfunctiontype$sd mqc_gaussian_unformatted_matrix_file
R 6755 5 97 mqc_gaussian ibasisfunctiontype$p mqc_gaussian_unformatted_matrix_file
R 6756 5 98 mqc_gaussian ibasisfunctiontype$o mqc_gaussian_unformatted_matrix_file
R 6758 5 100 mqc_gaussian igaussianscalars mqc_gaussian_unformatted_matrix_file
R 6760 5 102 mqc_gaussian igaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6761 5 103 mqc_gaussian igaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6762 5 104 mqc_gaussian igaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6765 5 107 mqc_gaussian atomiccharges mqc_gaussian_unformatted_matrix_file
R 6766 5 108 mqc_gaussian atomiccharges$sd mqc_gaussian_unformatted_matrix_file
R 6767 5 109 mqc_gaussian atomiccharges$p mqc_gaussian_unformatted_matrix_file
R 6768 5 110 mqc_gaussian atomiccharges$o mqc_gaussian_unformatted_matrix_file
R 6770 5 112 mqc_gaussian atomicweights mqc_gaussian_unformatted_matrix_file
R 6772 5 114 mqc_gaussian atomicweights$sd mqc_gaussian_unformatted_matrix_file
R 6773 5 115 mqc_gaussian atomicweights$p mqc_gaussian_unformatted_matrix_file
R 6774 5 116 mqc_gaussian atomicweights$o mqc_gaussian_unformatted_matrix_file
R 6776 5 118 mqc_gaussian cartesians mqc_gaussian_unformatted_matrix_file
R 6778 5 120 mqc_gaussian cartesians$sd mqc_gaussian_unformatted_matrix_file
R 6779 5 121 mqc_gaussian cartesians$p mqc_gaussian_unformatted_matrix_file
R 6780 5 122 mqc_gaussian cartesians$o mqc_gaussian_unformatted_matrix_file
R 6782 5 124 mqc_gaussian gaussianscalars mqc_gaussian_unformatted_matrix_file
R 6784 5 126 mqc_gaussian gaussianscalars$sd mqc_gaussian_unformatted_matrix_file
R 6785 5 127 mqc_gaussian gaussianscalars$p mqc_gaussian_unformatted_matrix_file
R 6786 5 128 mqc_gaussian gaussianscalars$o mqc_gaussian_unformatted_matrix_file
R 6788 5 130 mqc_gaussian isopen$tbp$11 mqc_gaussian_unformatted_matrix_file
R 6789 5 131 mqc_gaussian updateheader$tbp$12 mqc_gaussian_unformatted_matrix_file
R 6790 5 132 mqc_gaussian write2eris$tbp$13 mqc_gaussian_unformatted_matrix_file
R 6791 5 133 mqc_gaussian writeestobj$tbp$14 mqc_gaussian_unformatted_matrix_file
R 6792 5 134 mqc_gaussian writebasisdata$tbp$15 mqc_gaussian_unformatted_matrix_file
R 6793 5 135 mqc_gaussian writearray$tbp$16 mqc_gaussian_unformatted_matrix_file
R 6794 5 136 mqc_gaussian writearray2$tbp$17 mqc_gaussian_unformatted_matrix_file
R 6795 5 137 mqc_gaussian get2eris$tbp$18 mqc_gaussian_unformatted_matrix_file
R 6796 5 138 mqc_gaussian getestobj$tbp$19 mqc_gaussian_unformatted_matrix_file
R 6797 5 139 mqc_gaussian getmoldata$tbp$20 mqc_gaussian_unformatted_matrix_file
R 6798 5 140 mqc_gaussian getbasisdata$tbp$21 mqc_gaussian_unformatted_matrix_file
R 6799 5 141 mqc_gaussian getbasisarray$tbp$22 mqc_gaussian_unformatted_matrix_file
R 6800 5 142 mqc_gaussian getbasisinfo$tbp$23 mqc_gaussian_unformatted_matrix_file
R 6801 5 143 mqc_gaussian getatominfo$tbp$24 mqc_gaussian_unformatted_matrix_file
R 6802 5 144 mqc_gaussian getarray$tbp$25 mqc_gaussian_unformatted_matrix_file
R 6803 5 145 mqc_gaussian getvalreal$tbp$26 mqc_gaussian_unformatted_matrix_file
R 6804 5 146 mqc_gaussian getval$tbp$27 mqc_gaussian_unformatted_matrix_file
R 6805 5 147 mqc_gaussian getatomweights$tbp$28 mqc_gaussian_unformatted_matrix_file
R 6806 5 148 mqc_gaussian getatomcarts$tbp$29 mqc_gaussian_unformatted_matrix_file
R 6807 5 149 mqc_gaussian getatomicnumbers$tbp$30 mqc_gaussian_unformatted_matrix_file
R 6808 5 150 mqc_gaussian iscomplex$tbp$31 mqc_gaussian_unformatted_matrix_file
R 6809 5 151 mqc_gaussian isgeneral$tbp$32 mqc_gaussian_unformatted_matrix_file
R 6810 5 152 mqc_gaussian isunrestricted$tbp$33 mqc_gaussian_unformatted_matrix_file
R 6811 5 153 mqc_gaussian isrestricted$tbp$34 mqc_gaussian_unformatted_matrix_file
R 6812 5 154 mqc_gaussian create$tbp$35 mqc_gaussian_unformatted_matrix_file
R 6813 5 155 mqc_gaussian load$tbp$36 mqc_gaussian_unformatted_matrix_file
R 6814 5 156 mqc_gaussian closefile$tbp$37 mqc_gaussian_unformatted_matrix_file
R 6815 5 157 mqc_gaussian openfile$tbp$38 mqc_gaussian_unformatted_matrix_file
R 6818 25 160 mqc_gaussian mqc_gaussian_molecule_data
R 6819 5 161 mqc_gaussian mqc_molecule_data mqc_gaussian_molecule_data
R 6820 5 162 mqc_gaussian charge mqc_gaussian_molecule_data
R 6821 5 163 mqc_gaussian multiplicity mqc_gaussian_molecule_data
R 6822 5 164 mqc_gaussian print$tbp$41 mqc_gaussian_molecule_data
R 6823 5 165 mqc_gaussian getnucrep$tbp$42 mqc_gaussian_molecule_data
R 6824 5 166 mqc_gaussian getnumatoms$tbp$43 mqc_gaussian_molecule_data
R 6825 5 167 mqc_gaussian updatemoldata$tbp$44 mqc_gaussian_molecule_data
R 7188 25 6 iso_c_binding c_ptr
R 7189 5 7 iso_c_binding val c_ptr
R 7191 25 9 iso_c_binding c_funptr
R 7192 5 10 iso_c_binding val c_funptr
R 7226 6 44 iso_c_binding c_null_ptr$ac
R 7228 6 46 iso_c_binding c_null_funptr$ac
R 7229 26 47 iso_c_binding ==
R 7231 26 49 iso_c_binding !=
S 7706 16 0 0 0 7 1 626 6695 4 400000 A 0 0 0 0 B 0 20 0 0 0 0 0 0 7707 2055 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 iout
S 7707 3 0 0 0 7 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 7708 19 0 0 0 7 1 626 5622 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1137 22 0 0 0 0 0 626 0 0 0 0 mqc_print
O 7708 22 4435 4665 3634 3169 2678 2067 5243 5236 5228 5220 1031 1011 991 944 930 916 980 969 958 889 881 873
S 7709 19 0 0 0 7 1 626 6244 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1141 4 0 0 0 0 0 626 0 0 0 0 num2char
O 7709 4 2511 1064 1059 1054
S 7710 19 0 0 0 10 1 626 9619 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 at
S 7711 19 0 0 0 10 1 626 9677 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 626 0 0 0 0 put
S 7712 19 0 0 0 10 1 626 11932 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1317 6 0 0 0 0 0 626 0 0 0 0 contraction
O 7712 6 5592 5582 5575 4940 3784 3380
S 7713 19 0 0 0 10 1 626 2344 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1149 5 0 0 0 0 0 626 0 0 0 0 conjg
O 7713 5 5632 3967 3555 2899 2371
S 7714 19 0 0 0 10 1 626 2153 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1151 2 0 0 0 0 0 626 0 0 0 0 float
O 7714 2 4890 2132
S 7715 19 0 0 0 7 1 626 2585 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1153 2 0 0 0 0 0 626 0 0 0 0 int
O 7715 2 4886 2136
S 7716 19 0 0 0 7 1 626 2687 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1312 10 0 0 0 0 0 626 0 0 0 0 matmul
O 7716 10 5533 5527 5521 5501 5480 5474 4960 3328 3323 3318
S 7717 19 0 0 0 10 1 626 2794 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1314 4 0 0 0 0 0 626 0 0 0 0 transpose
O 7717 4 5543 4894 3227 2649
S 7718 19 0 0 0 10 1 626 12635 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1163 3 0 0 0 0 0 626 0 0 0 0 dagger
O 7718 3 5548 3231 2653
S 7719 19 0 0 0 10 1 626 2671 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1313 3 0 0 0 0 0 626 0 0 0 0 dot_product
O 7719 3 5538 4945 2658
S 7720 19 0 0 0 10 1 626 2783 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1168 3 0 0 0 0 0 626 0 0 0 0 sum
O 7720 3 4929 3571 2891
S 7721 19 0 0 0 10 1 626 2875 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1172 4 0 0 0 0 0 626 0 0 0 0 size
O 7721 4 4632 3757 3199 2523
S 7722 26 0 0 0 0 1 626 14009 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1216 44 0 0 0 0 0 626 0 0 0 0 =
O 7722 44 4873 4868 4863 4858 4853 4849 4845 4828 4817 4806 4798 4790 4786 4782 3699 3694 3689 3672 3655 3638 3135 3124 3113 3156 3151 3146 3161 2608 2600 2592 2587 2582 2577 2616 2059 2055 2051 2047 2043 2039 2035 5468 5464 5460
S 7723 26 0 0 0 0 1 626 14186 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1230 14 0 0 0 0 0 626 0 0 0 0 +
O 7723 14 4899 3789 3308 2635 2630 2620 2469 2464 2459 2454 2449 2444 2161 5485
S 7724 26 0 0 0 0 1 626 14322 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1244 14 0 0 0 0 0 626 0 0 0 0 -
O 7724 14 4904 3794 3313 2640 2625 2499 2494 2489 2484 2479 2474 2166 5495 5490
S 7725 26 0 0 0 0 1 626 14493 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1273 29 0 0 0 0 0 626 0 0 0 0 *
O 7725 29 4909 3073 2782 2777 2767 2762 2752 2747 3961 3954 3368 3363 3358 3353 3348 3343 3333 3338 2737 2732 2409 2404 2399 2394 2389 2384 2171 5513 5506
S 7726 26 0 0 0 0 1 626 14956 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1287 14 0 0 0 0 0 626 0 0 0 0 /
O 7726 14 4914 2787 2772 2757 3947 3373 2742 2439 2434 2429 2424 2419 2414 2176
S 7727 19 0 0 0 10 1 626 17005 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1306 11 0 0 0 0 0 626 0 0 0 0 put$tbpg
O 7727 11 3992 3991 3981 3980 1930 1929 1983 1982 4481 4483 4485
S 7728 19 0 0 0 10 1 626 17062 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1298 8 0 0 0 0 0 626 0 0 0 0 at$tbpg
O 7728 8 3986 3985 1937 1936 1987 1986 3997 3996
S 7729 23 5 0 0 10 7734 626 49358 0 0 A 0 0 0 0 B 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipole_expectation_value
S 7730 1 3 1 0 1495 1 7729 49383 4 3000 A 0 0 0 0 B 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 bra
S 7731 7 3 1 0 2575 1 7729 49387 800004 3000 A 0 0 0 0 B 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipole
S 7732 1 3 1 0 1495 1 7729 49394 4 3000 A 0 0 0 0 B 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ket
S 7733 7 3 0 0 2578 1 7729 49398 800004 1003000 A 0 0 0 0 B 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dipoleev
S 7734 14 5 0 0 2578 1 7729 49358 4 1400000 A 0 0 0 0 B 0 29 0 0 0 0 0 3107 3 0 0 7733 0 0 0 0 0 0 0 0 0 29 0 626 0 0 0 0 dipole_expectation_value dipole_expectation_value dipoleev
F 7734 3 7730 7731 7732
S 7735 23 5 0 0 0 7742 626 49407 0 0 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 singledet
S 7736 6 3 0 0 7 1 7735 49417 800004 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nocc
S 7737 6 3 0 0 7 1 7735 49422 800004 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nvirt
S 7738 1 3 0 0 7 1 7735 49428 4 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nov
S 7739 1 3 0 0 7 1 7735 49432 4 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nmos
S 7740 1 3 0 0 7 1 7735 49437 4 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 idetref
S 7741 7 3 0 0 2581 1 7735 49445 800204 3000 A 0 0 0 0 B 0 49 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 idetsingles
S 7742 14 5 0 0 0 1 7735 49407 200 400000 A 0 0 0 0 B 0 49 0 0 0 0 0 3111 6 0 0 0 0 0 0 0 0 0 0 0 0 49 0 626 0 0 0 0 singledet singledet 
F 7742 6 7736 7737 7738 7739 7740 7741
S 7743 6 1 0 0 7 1 7735 49457 40800006 3000 A 0 0 0 0 B 0 53 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2059
S 7744 23 5 0 0 0 7750 626 49466 0 0 A 0 0 0 0 B 0 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det_to_swap_1
S 7745 1 3 1 0 7 1 7744 49480 4 3000 A 0 0 0 0 B 0 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 idetin
S 7746 1 3 0 0 7 1 7744 49487 4 3000 A 0 0 0 0 B 0 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_1
S 7747 1 3 0 0 7 1 7744 49494 4 3000 A 0 0 0 0 B 0 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_1
S 7748 1 3 1 0 7 1 7744 35203 4 3000 A 0 0 0 0 B 0 74 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nelec
S 7749 1 3 1 0 7 1 7744 31801 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbasis
S 7750 14 5 0 0 0 1 7744 49466 0 400000 A 0 0 0 0 B 0 74 0 0 0 0 0 3118 5 0 0 0 0 0 0 0 0 0 0 0 0 74 0 626 0 0 0 0 det_to_swap_1 det_to_swap_1 
F 7750 5 7745 7746 7747 7748 7749
S 7751 23 5 0 0 0 7759 626 49500 0 0 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det_to_swap_2
S 7752 1 3 1 0 7 1 7751 49480 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 idetin
S 7753 1 3 0 0 7 1 7751 49487 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_1
S 7754 1 3 0 0 7 1 7751 49514 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_2
S 7755 1 3 0 0 7 1 7751 49494 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_1
S 7756 1 3 0 0 7 1 7751 49521 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_2
S 7757 1 3 1 0 7 1 7751 35203 4 3000 A 0 0 0 0 B 0 116 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nelec
S 7758 1 3 1 0 7 1 7751 31801 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbasis
S 7759 14 5 0 0 0 1 7751 49500 0 400000 A 0 0 0 0 B 0 116 0 0 0 0 0 3124 7 0 0 0 0 0 0 0 0 0 0 0 0 116 0 626 0 0 0 0 det_to_swap_2 det_to_swap_2 
F 7759 7 7752 7753 7754 7755 7756 7757 7758
S 7760 23 5 0 0 0 7770 626 49527 0 0 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det_to_swap_3
S 7761 1 3 1 0 7 1 7760 49480 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 idetin
S 7762 1 3 0 0 7 1 7760 49487 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_1
S 7763 1 3 0 0 7 1 7760 49514 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_2
S 7764 1 3 0 0 7 1 7760 49541 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 virt_3
S 7765 1 3 0 0 7 1 7760 49494 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_1
S 7766 1 3 0 0 7 1 7760 49521 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_2
S 7767 1 3 0 0 7 1 7760 49548 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 occ_3
S 7768 1 3 1 0 7 1 7760 35203 4 3000 A 0 0 0 0 B 0 175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nelec
S 7769 1 3 1 0 7 1 7760 31801 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbasis
S 7770 14 5 0 0 0 1 7760 49527 0 400000 A 0 0 0 0 B 0 175 0 0 0 0 0 3132 9 0 0 0 0 0 0 0 0 0 0 0 0 175 0 626 0 0 0 0 det_to_swap_3 det_to_swap_3 
F 7770 9 7761 7762 7763 7764 7765 7766 7767 7768 7769
S 7771 23 5 0 0 7 7778 626 49554 0 0 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 no_overlap
S 7772 1 3 0 0 1538 1 7771 33592 4 3000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wavefunction
S 7773 1 3 0 0 1495 1 7771 49565 4 3000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_1
S 7774 1 3 0 0 1495 1 7771 49575 4 3000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_2
S 7775 1 3 0 0 7 1 7771 31777 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nalpha
S 7776 1 3 0 0 7 1 7771 31784 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbeta
S 7777 1 3 0 0 10 1 7771 49585 4 1003000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nij
S 7778 14 5 0 0 10 1 7771 49554 4 1400000 A 0 0 0 0 B 0 250 0 0 0 0 0 3142 5 0 0 7777 0 0 0 0 0 0 0 0 0 250 0 626 0 0 0 0 no_overlap no_overlap nij
F 7778 5 7772 7773 7774 7775 7776
S 7779 23 5 0 0 7 7792 626 49589 0 0 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 no_overlap_vec
S 7780 1 3 0 0 1538 1 7779 49604 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wavefunction_1
S 7781 1 3 0 0 1538 1 7779 49619 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wavefunction_2
S 7782 1 3 0 0 1495 1 7779 49565 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_1
S 7783 1 3 0 0 1495 1 7779 49575 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_2
S 7784 1 3 0 0 1559 1 7779 49634 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det
S 7785 7 3 1 0 2584 1 7779 49638 20000004 10003000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 swap_det
S 7786 1 3 1 0 7 1 7779 31801 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbasis
S 7787 1 3 1 0 7 1 7779 31777 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nalpha
S 7788 1 3 1 0 7 1 7779 31784 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbeta
S 7789 1 3 1 0 7 1 7779 49417 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nocc
S 7790 1 3 1 0 7 1 7779 49422 4 3000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nvirt
S 7791 1 3 0 0 368 1 7779 49647 4 1003000 A 0 0 0 0 B 0 266 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nfi_vec
S 7792 14 5 0 0 368 1 7779 49589 20000004 1400000 A 0 0 0 0 B 0 266 0 0 0 0 0 3148 11 0 0 7791 0 0 0 0 0 0 0 0 0 266 0 626 0 0 0 0 no_overlap_vec no_overlap_vec nfi_vec
F 7792 11 7780 7781 7782 7783 7784 7785 7786 7787 7788 7789 7790
S 7793 6 1 0 0 7 1 7779 41811 40800006 3000 A 0 0 0 0 B 0 282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_1_2
S 7794 6 1 0 0 7 1 7779 41819 40800006 3000 A 0 0 0 0 B 0 282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_2_2
S 7795 6 1 0 0 7 1 7779 41827 40800006 3000 A 0 0 0 0 B 0 282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_3_2
S 7796 6 1 0 0 7 1 7779 49655 40800006 3000 A 0 0 0 0 B 0 282 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2066
S 7797 23 5 0 0 7 7812 626 49664 0 0 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 no_overlap_mat
S 7798 1 3 0 0 1538 1 7797 49604 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wavefunction_1
S 7799 1 3 0 0 1538 1 7797 49619 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wavefunction_2
S 7800 1 3 0 0 1495 1 7797 49565 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_1
S 7801 1 3 0 0 1495 1 7797 49575 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 mocoeff_2
S 7802 1 3 0 0 1559 1 7797 49679 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det_bra
S 7803 1 3 0 0 1559 1 7797 49687 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 det_ket
S 7804 7 3 1 0 2587 1 7797 49695 20000004 10003000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 swap_det_bra
S 7805 7 3 1 0 2590 1 7797 49708 20000004 10003000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 swap_det_ket
S 7806 1 3 1 0 7 1 7797 31801 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbasis
S 7807 1 3 1 0 7 1 7797 31777 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nalpha
S 7808 1 3 1 0 7 1 7797 31784 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nbeta
S 7809 1 3 1 0 7 1 7797 49417 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nocc
S 7810 1 3 1 0 7 1 7797 49422 4 3000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nvirt
S 7811 1 3 0 0 395 1 7797 49721 4 1003000 A 0 0 0 0 B 0 390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 nfi_mat
S 7812 14 5 0 0 395 1 7797 49664 20000004 1400000 A 0 0 0 0 B 0 390 0 0 0 0 0 3160 13 0 0 7811 0 0 0 0 0 0 0 0 0 390 0 626 0 0 0 0 no_overlap_mat no_overlap_mat nfi_mat
F 7812 13 7798 7799 7800 7801 7802 7803 7804 7805 7806 7807 7808 7809 7810
S 7813 6 1 0 0 7 1 7797 41811 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_1_2
S 7814 6 1 0 0 7 1 7797 41819 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_2_2
S 7815 6 1 0 0 7 1 7797 41827 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_3_2
S 7816 6 1 0 0 7 1 7797 49729 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2070
S 7817 6 1 0 0 7 1 7797 41844 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_5_2
S 7818 6 1 0 0 7 1 7797 41852 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_6_2
S 7819 6 1 0 0 7 1 7797 41860 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_7_2
S 7820 6 1 0 0 7 1 7797 49738 40800006 3000 A 0 0 0 0 B 0 407 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2077
A 14 2 0 0 0 6 634 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 31 2 0 0 0 6 637 0 0 0 31 0 0 0 0 0 0 0 0 0 0 0
A 33 2 0 0 0 6 642 0 0 0 33 0 0 0 0 0 0 0 0 0 0 0
A 55 2 0 0 0 7 643 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0
A 56 2 0 0 0 7 644 0 0 0 56 0 0 0 0 0 0 0 0 0 0 0
A 62 1 0 1 0 63 666 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 68 1 0 1 0 69 668 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 72 1 0 3 0 75 670 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1086 2 0 0 731 19 1379 0 0 0 1086 0 0 0 0 0 0 0 0 0 0 0
A 1087 2 0 0 880 7 4034 0 0 0 1087 0 0 0 0 0 0 0 0 0 0 0
A 1112 2 0 0 487 22 4151 0 0 0 1112 0 0 0 0 0 0 0 0 0 0 0
A 1113 2 0 0 490 19 4152 0 0 0 1113 0 0 0 0 0 0 0 0 0 0 0
A 1358 2 0 0 0 7 1377 0 0 0 1358 0 0 0 0 0 0 0 0 0 0 0
A 1786 2 0 0 1408 7 6658 0 0 0 1786 0 0 0 0 0 0 0 0 0 0 0
A 1954 1 0 0 1724 2464 7226 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1957 1 0 0 1577 2473 7228 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2055 2 0 0 1999 7 7707 0 0 0 2055 0 0 0 0 0 0 0 0 0 0 0
A 2057 1 0 0 1820 7 7736 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2058 1 0 0 1231 7 7737 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2059 4 0 0 189 7 2057 0 2058 0 0 0 0 3 0 0 0 0 0 0 0 0
A 2060 1 0 0 1413 7 7743 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2061 1 0 0 1974 7 7795 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2062 1 0 0 1972 7 7793 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2063 1 0 0 1975 7 7796 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2064 1 0 0 1973 7 7794 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2065 1 0 0 1994 7 7815 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2066 1 0 0 1992 7 7813 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2067 1 0 0 1995 7 7816 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2068 1 0 0 1993 7 7814 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2069 1 0 0 2055 7 7819 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2070 1 0 0 1996 7 7817 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2071 1 0 0 2000 7 7820 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2072 1 0 0 1998 7 7818 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
V 1954 2464 7 0
S 0 2464 0 0 0
A 0 6 0 0 1 2 0
J 132 1 1
V 1957 2473 7 0
S 0 2473 0 0 0
A 0 6 0 0 1 2 0
T 1390 342 0 0 0 0
A 1393 7 359 0 1 2 1
A 1396 7 361 0 1 2 1
A 1399 7 363 0 1 2 0
T 1420 368 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 1496 395 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 1578 422 0 3 0 0
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 4037 958 0 3 0 0
A 4046 7 982 0 1 2 1
A 4049 7 984 0 1 2 0
T 4154 1094 0 3 0 0
A 4155 22 0 0 1 1112 1
A 4156 19 0 0 1 1113 1
A 4157 7 0 0 1 10 0
T 4161 1102 0 3 0 0
A 4163 22 0 0 1 1112 1
A 4164 22 0 0 1 1112 1
A 4165 19 0 0 1 1113 1
A 4166 7 0 0 1 10 1
A 4167 19 0 0 1 1113 1
A 4168 19 0 0 1 1086 1
T 4162 1094 0 3 0 0
A 4155 22 0 0 1 1112 1
A 4156 19 0 0 1 1113 1
A 4157 7 0 0 1 10 0
T 4349 1213 0 3 0 0
T 4350 1161 0 3 0 1
A 1393 7 1167 0 1 2 1
A 1396 7 1169 0 1 2 1
A 1399 7 1171 0 1 2 0
T 4351 1173 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4352 1173 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4353 1173 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4354 1179 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4455 1298 0 3 0 0
A 4456 7 0 0 1 1358 1
R 4459 1306 0 1
A 0 7 0 1087 1 10 0
A 4472 19 0 0 1 1113 0
T 4983 1495 0 3 0 0
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5029 1512 0 3 0 0
T 5030 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5031 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5047 1521 0 3 0 0
T 5048 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5049 1512 0 3 0 1
T 5030 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5031 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5050 1512 0 3 0 1
T 5030 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5031 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5051 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5052 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5053 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5054 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5055 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5056 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5057 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5058 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5059 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5060 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5061 1443 0 3 0 0
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5070 1529 0 3 0 0
T 5071 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5072 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5073 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5074 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5075 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5076 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5077 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5080 1538 0 3 0 0
T 5086 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5087 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5081 1521 0 3 0 0
T 5048 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5049 1512 0 3 0 1
T 5030 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5031 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5050 1512 0 3 0 1
T 5030 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5031 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5051 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5052 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5053 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5054 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5055 1495 0 3 0 1
T 4984 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4985 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4986 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 4987 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5056 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5057 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5058 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5059 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5060 1443 0 3 0 1
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5061 1443 0 3 0 0
A 1393 7 1449 0 1 2 1
A 1396 7 1451 0 1 2 1
A 1399 7 1453 0 1 2 0
T 5091 1550 0 3 0 0
T 5092 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5093 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5096 1559 0 3 0 0
T 5097 1550 0 3 0 1
T 5092 1461 0 3 0 1
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5093 1461 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
T 5102 1455 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5103 1455 0 3 0 0
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 5106 1568 0 3 0 0
T 5107 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5108 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5109 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5110 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5111 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5112 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5113 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5114 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5115 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5116 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5117 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5118 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5119 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5120 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5121 1467 0 3 0 1
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 5122 1467 0 3 0 0
A 1579 7 0 0 1 10 1
A 1580 7 0 0 1 10 1
A 1581 7 0 0 1 10 1
A 1582 7 0 0 1 10 0
T 6659 2229 0 3 0 0
T 6660 2066 0 3 0 0
A 4163 22 0 0 1 1112 1
A 4164 22 0 0 1 1112 1
A 4165 19 0 0 1 1113 1
A 4166 7 0 0 1 10 1
A 4167 19 0 0 1 1113 1
A 4168 19 0 0 1 1086 1
T 4162 2060 0 3 0 0
A 4155 22 0 0 1 1112 1
A 4156 19 0 0 1 1113 1
A 4157 7 0 0 1 10 0
T 6676 2244 0 3 0 0
A 6678 19 0 0 1 1113 1
A 6679 19 0 0 1 1113 1
A 6680 19 0 0 1 1113 1
A 6681 19 0 0 1 1113 1
A 6682 22 0 0 1 1112 1
A 6683 22 0 0 1 1112 1
A 6684 22 0 0 1 1112 1
A 6685 22 0 0 1 1112 1
T 6677 2060 0 3 0 0
A 4155 22 0 0 1 1112 1
A 4156 19 0 0 1 1113 1
A 4157 7 0 0 1 10 0
T 6818 2357 0 3 0 0
T 6820 2072 0 3 0 1
A 1393 7 2078 0 1 2 1
A 1396 7 2080 0 1 2 1
A 1399 7 2082 0 1 2 0
T 6821 2072 0 3 0 1
A 1393 7 2078 0 1 2 1
A 1396 7 2080 0 1 2 1
A 1399 7 2082 0 1 2 0
T 6819 2223 0 3 0 0
T 4350 2199 0 3 0 1
A 1393 7 2205 0 1 2 1
A 1396 7 2207 0 1 2 1
A 1399 7 2209 0 1 2 0
T 4351 2211 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4352 2211 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4353 2211 0 3 0 1
A 1421 7 0 0 1 10 1
A 1422 19 0 0 1 1086 0
T 4354 2217 0 3 0 0
A 1497 7 0 0 1 10 1
A 1498 7 0 0 1 10 0
Z
