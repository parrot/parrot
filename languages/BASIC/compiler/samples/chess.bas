' Chessboard.bas
'  ###  /\  +  www WWW  +   /\ ###  p
'  |R| {K  [B] (Q) |X| [B] {K  |R|  I
'  === === === === === === === === ===
sub rook(l1$,l2$,l3$)
	l1$="###"
	l2$="|R|"
	l3$="==="
end sub
sub knight(l1$,l2$,l3$)
	l1$=" /\\"
	l2$="{K"
	l3$="==="
end sub
sub bishop(l1$,l2$,l3$)
	l1$=" + "
	l2$="[B]"
	l3$="==="
end sub
sub queen(l1$,l2$,l3$)
	l1$="www"
	l2$="(Q)"
	l3$="==="
end sub
sub king(l1$,l2$,l3$)
	l1$="WWW"
	l2$="|X|"
	l3$="==="
end sub
sub pawn(l1$,l2$,l3$)
	l1$=" p "
	l2$=" I "
	l3$="==="
end sub
sub blank(l1$,l2$,l3$)
	l1$="   "
	l2$="   "
	l3$="   "
end sub
sub piece(x,y,color)
	call queen(one$, two$, three$) 
	locate y*3+1, x*5+2
	print one$
	locate y*3+2, x*5+2
	print two$
	locate y*3+3, x*5+2
	print three$
end sub
sub drawsquare(x,y,squarecolor,piece$)
	if squarecolor=1 then background=4 else background=6
	p$=left$(piece$, 1)
	if p$="*" then foreground=15 else foreground=0
	p$=right$(piece$,1)
	if p$="." then call blank(one$, two$, three$)
	if p$="P" then call pawn(one$, two$, three$)
	if p$="T" then call rook(one$, two$, three$)
	if p$="F" then call bishop(one$, two$, three$)
	if p$="C" then call knight(one$, two$, three$)
	if p$="D" then call queen(one$, two$, three$)
	if p$="R" then call king(one$, two$, three$)

	if y=0 then posx$=chr$(65+x) else posx$=" "
	if x=0 then posy$=str$(8-y) else posy$=" "
	locate y*3+1, x*5+1
	color foreground, background
	print " ";one$;
	color 11, background
	print posx$;
	color foreground, background
	locate y*3+2, x*5+1
	print " ";two$;" ";
	locate y*3+3, x*5+1
	color 11, background
	print posy$;
	color foreground, background
	print three$;" ";
end sub
sub drawboard()
	locate 0,0
	c=0
	piece$=".."
	for i = 0 to 7
	for j = 0 to 7
		call drawsquare( i, j, c mod 2, piece$ )
		c=c+1
	next j
	c=c+1
	next i
end sub
sub clearscreen(normalfore, normalback)
	color normalfore, normalback
	for i=1 to 24
	locate i, 41
	print string$(38, " ");
	next i
	locate 22,42 
	print "LV = Change Levels, NG = New Game";
	locate 23,42
	print "AV = Calc Move, AP = Autoplay (20)";
	locate 24,42 
	print "Col/row for moves.  e.g. A2A3";
end sub
5  normalback=0
   normalfore=14
10 REM "  ****************************"
20 REM "  ** PROGRAMME D'ECHECS CSS **"
30 REM "  ****************************"
40 REM "     par Dieter Steinwender"
50 REM
60 REM DEFINT A-L, N-Z
70 DIM B(119), S(10, 4)
71 DIM M(10), A$(10), U(10), F$(10)
72 DIM R1(4), R2(4), R3(4), R4(4), R5(4), R6(4), R7(4), G1(10)
73 DIM W(10), P(10)
80 DIM O(15), OA(6), OE(6), L(6), Z(200, 6)
90 DIM ZT(9, 8), BV(8), BL(2, 9), TL(2, 9)
100 DIM T7(2), BA(2), KR(2), KL(2)
110 et = 0
200 cls
    call clearscreen(normalfore, normalback)
    locate 9,42 
    print "Chess logic: Dieter Steinwender"
    locate 10,42
    print "     Modified by Clinton Pierce"
    RESTORE
210 REM: initialisation
270 FOR I = 0 TO 119
280 B(I) = 100
290 NEXT I
300 FOR I = 9 TO 2 STEP -1
310 FOR J = 1 TO 8
320 READ B(I * 10 + J)
330 NEXT J
340 NEXT I
350 DATA  -2,-4,-3,-5,-6,-3,-4,-2
360 DATA  -1,-1,-1,-1,-1,-1,-1,-1
370 DATA   0, 0, 0, 0, 0, 0, 0, 0
380 DATA   0, 0, 0, 0, 0, 0, 0, 0
390 DATA   0, 0, 0, 0, 0, 0, 0, 0
400 DATA   0, 0, 0, 0, 0, 0, 0, 0
410 DATA   1, 1, 1, 1, 1, 1, 1, 1
420 DATA   2, 4, 3, 5, 6, 3, 4, 2
430 F = 1
440 FOR I = 1 TO 4
450 S(0, I) = 1
460 NEXT I
470 S(0, 0) = 0
480 M(0) = 0
510 FOR I = 0 TO 6
520 READ A$(I), U(I)
530 NEXT I
540 DATA ".",0,"P",100,"T",500,"F",350
550 DATA "C",325,"D",900,"R",20000
560 M0 = 48100
590 F$(0) = "."
600 F$(1) = "."
610 F$(2) = "*"
640 FOR I = 0 TO 15
650 READ O(I)
660 NEXT I
670 DATA -9,-11,9,11,-1,10,1,-10,19,21,12,-8,-19,-21,-12,8
690 FOR I = 1 TO 6
700 READ OA(I), OE(I), L(I)
710 NEXT I
720 DATA 0,3,0,4,7,1,0,3,1,8,15,0,0,7,1,0,7,0
750 FOR I = 1 TO 4
760 READ R1(I), R2(I), R3(I), R4(I), R5(I), R6(I), R7(I)
770 NEXT I
780 DATA 96,97,95,97,95,97,98
790 DATA 92,94,93,95,95,93,91
800 DATA 26,27,25,27,25,27,28
810 DATA 22,24,23,25,25,23,21
840 FOR J = 1 TO 8
850 FOR I = 2 TO 9
860 ZT(I, J) = 12 - 4 * (ABS(5.5 - I) + ABS(4.5 - J))
870 NEXT I
880 READ BV(J)
890 NEXT J
900 DATA 0,0,4,6,7,2,0,0
930 MZ = 0
940 G1(0) = 1
950 T0 = 1
1800 T = 0
2000 REM Process player commands
     color normalfore, normalback
     Gosub 4000
     color normalfore, normalback
     for i=12 to 20
     	locate i, 42
	print string$(29, " ");
     next i
2020 locate 12, 42
     color normalfore, normalback
     if autoplay > 0 then
	     E$="AV"
	     autoplay=autoplay+1
	     if autoplay > 20 then
	        	autoplay=0
             end if
     else 
	     PRINT "   Your move"; : INPUT E$
	     for i = 9 to 11
	     	     locate i, 42
     	     	     print string$(31, " ");
	     next i
     end if
2050 IF E$ <> "NG" THEN 2070
2060 GOTO 200
2070 IF E$ <> "FI" THEN 2090
2080 GOTO 15000
2090 IF E$ <> "AP" THEN 2095
     autoplay=1
     GOTO 2000
2095 IF E$ <> "PO" THEN 2120
2100 GOSUB 4000
2110 GOTO 2000
2120 IF E$ <> "PB" THEN 2150
2130 GOSUB 5000
2140 GOTO 2000
2150 IF E$ <> "AV" THEN 2170
2160 GOTO 3500
2170 IF E$ <> "CM" THEN 2210
2180 PRINT "COUPS MULTIPLES: ";
2190 IF MZ = 0 THEN MZ = 1: PRINT "DEBUT": GOTO 2000
2200 MZ = 0: PRINT "FIN": GOTO 2000
2210 IF E$ <> "LC" THEN 2260
2220 Z0 = Z1
2230 GOSUB 6500
2240 Z1 = Z0
2250 GOTO 2000
2260 IF E$ <> "RC" THEN 2330
2270 IF T = 1 THEN 2300
2280 PRINT "  DESOLE: PAS POSSIBLE"
2290 GOTO 2000
2300 GOSUB 9600
2310 PRINT "  OK"
2320 GOTO 2000
2330 IF E$ <> "LV" THEN 3000
2340 locate 12, 42
     PRINT "  Depth (1=Fast)="; T0;
2350 INPUT T0
2360 T0 = ABS(T0)
2370 GOTO 2000
3000 REM
3010 IF LEN(E$) < 4 THEN 2000
3020 V1 = ASC(E$) - 64 + 10 * (ASC(MID$(E$, 2, 1)) - 47)
3030 N1 = ASC(MID$(E$, 3, 1)) - 64 + 10 * (ASC(MID$(E$, 4, 1)) - 47)
3040 GOSUB 8800
3050 GOSUB 7000
3060 FOR Z1 = 1 TO G - 1
3070 IF Z(Z1, 1) <> V1 THEN 3090
3080 IF Z(Z1, 2) = N1 THEN 3120
3090 NEXT Z1
3100 Locate 11, 42
     color 4,15
     PRINT "Illegal Move!";
     color 0,15
3110 GOTO 2000
3120 IF Z(Z1, 4) = 0 THEN 3170
3140 IF RIGHT$(E$, 1) = "C" THEN Z1 = Z1 + 1
3150 IF RIGHT$(E$, 1) = "F" THEN Z1 = Z1 + 2
3160 IF RIGHT$(E$, 1) = "T" THEN Z1 = Z1 + 3
3170 locate 3,42
     PRINT "Your move was ";
3180 GOSUB 6000			' Posting
3190 GOSUB 9000			' Executing
     GOSUB 4000			' Show board again
3200 GOSUB 7000			' Generating moves
3210 IF MT = 0 THEN 3300
3220 GOSUB 9600			' Reprise?  Take it back?
3230 GOTO 3100
3300 IF MZ = 1 THEN 2000
3500 REM: coup de l'ordinateur  ' Computer's move
3520 GOSUB 8800			' Initilaize the move tree
_STARTASM
 	time $I0
	et=$I0
_ENDASM
3530 GOSUB 10000		' Seek?
_STARTASM
	time $I0
	$N0=$I0
	et=$N0-et
_ENDASM
3540 IF Z2 = 0 THEN 3650
3545 IF W = 1 THEN 3660		' Stalemate
3550 IF W = -32766 THEN 3630	' Player wins?
3560 Z1 = Z2
3570 color 10, normalback
     locate 5,42
     PRINT "My move is ";
3580 GOSUB 6000			' Post computer's move
     color 3, normalback
     locate 6,42
     print "Time "; et; " secs";
3590 GOSUB 9000			' Execute it.
3595 IF W = -2 THEN 3660
3600 IF W < 32765 THEN 3670
3610 PRINT "  ECHEC ET MAT!"	' Check and mate.
     autoplay=0
3620 GOTO 3670
3630 PRINT "  DAMNED, VOUS AVEZ GAGNE!"
     autoplay=0
3640 GOTO 3670
3650 IF T0 = 0 THEN 3670
3660 locate 6,42
     PRINT "  PAT: PARTIE NULLE!"
     autoplay=0
3670 locate 7,42
     PRINT "Positions Analyzed="; C1
3680 GOTO 2000


4000 REM Draw the board
     sqc=0
4020 REM
     call drawboard
4030 FOR I = 9 TO 2 STEP -1
4040 ' PRINT "  "; I - 1; "  ";
4050 FOR J = 1 TO 8
4060 A1 = B(I * 10 + J)
4070 F1 = SGN(A1)
4080 A1 = ABS(A1)
     piece$=F$(F1+1) + A$(A1)
     call drawsquare(j-1, 9-i, sqc mod 2, piece$)
     sqc=sqc+1
4090 ' PRINT F$(F1 + 1); A$(A1); "  ";
4100 NEXT J
     sqc=sqc+1
4110 'PRINT : PRINT
4120 NEXT I
4140 'PRINT "        ";
     ' FOR J = 1 TO 8
     ' PRINT CHR$(64 + J); "   ";
     ' NEXT J
4180 ' PRINT : PRINT
4190 ' PRINT "   BILAN MATERIEL= "; M(T)
4200 ' PRINT "   CASE E.P.     =  "; : GOSUB 6700
4210 ' PRINT "   STATUT ROQUE  = "; S(T, 1); S(T, 2); S(T, 3); S(T, 4)
4220 ' PRINT "   AU TOUR DE    = ";
4230 ' IF F = 1 THEN PRINT " BLANC": GOTO 4250
4240 ' PRINT " NOIR"
4250 RETURN


5000 REM: entree de la position
5020 T = 0
5030 PRINT "   VIDER L'ECHIQUIER(O/N) "
5040 INPUT E$
5050 IF E$ = "N" THEN 5130
5060 IF E$ <> "O" THEN 5030
5070 FOR I = 2 TO 9
5080 FOR J = 1 TO 8
5090 B(I * 10 + J) = 0
5100 NEXT J
5110 NEXT I
5120 M(0) = 0
5130 PRINT "  BLANC ";
5140 F = 1
5150 GOSUB 5500
5160 PRINT "  NOIR ";
5170 F = -1
5180 GOSUB 5500
5190 PRINT "  AU TOUR DE (B/N) ";
5200 INPUT E$
5210 IF E$ = "N" THEN 5240
5220 IF E$ <> "B" THEN 5190
5230 F = 1
5240 PRINT "  MODIF DU STATUT E.P./ROQUE  (O/N) ";
5250 INPUT E$
5260 IF E$ = "N" THEN 5320
5270 IF E$ <> "O" THEN 5240
5280 PRINT "  COLONNE E.P. "; : INPUT E$
5285 IF E$ = "0" THEN S(0, 0) = 0: GOTO 5300
5290 S(0, 0) = F * 15 + ASC(E$) - 9
5300 PRINT "  STATUT ROQUE ";
5310 INPUT S(0, 1), S(0, 2), S(0, 3), S(0, 4)
5320 GOSUB 4000
5330 RETURN
5500 REM: installation des pieces d'un cote
5520 INPUT E$
5530 IF E$ = "." THEN 5660
5540 IF LEN(E$) <> 3 THEN 5590
5560 FOR I = 0 TO 6
5570 IF LEFT$(E$, 1) = A$(I) THEN A = I: GOTO 5600
5580 NEXT I
5590 PRINT " ENTREE ERRONEE": GOTO 5520
5600 REM
5610 N = ASC(MID$(E$, 2, 1)) - 64 + 10 * (ASC(MID$(E$, 3, 1)) - 47)
5620 M(0) = M(0) - SGN(B(N)) * U(ABS(B(N)))
5630 B(N) = F * A
5640 M(0) = M(0) + F * U(A)
5650 GOTO 5520
5660 RETURN
6000 REM: affichage du coup  (posting the move)
6020 A$ = A$(ABS(B(Z(Z1, 1))))
6030 FOR J = 1 TO 2
6040 RE = INT(Z(Z1, J) / 10)
6050 LI = Z(Z1, J) - 10 * RE
6060 A$ = A$ + CHR$(64 + LI) + CHR$(47 + RE)
6070 NEXT J
6080 IF Z(Z1, 4) = 0 THEN 6100
6090 A$ = A$ + "=" + A$(Z(Z1, 4))
6100 PRINT A$
6110 RETURN
6500 REM: affichage des coups legaux
6520 GOSUB 7000
6530 IF MT = 0 THEN 6560
6540 PRINT "  LE ROI PEUT ETRE PRIS"
6550 RETURN
6560 PRINT G - G1(T); " COUPS PSEUDO-LEGAUX"
6570 FOR Z1 = G1(T) TO G - 1
6580 GOSUB 6000
6590 NEXT Z1
6600 RETURN
6700 REM: affichage d'une case e.p.
6710 IF S(T, 0) = 0 THEN A$ = "0": GOTO 6750
6720 RE = INT(S(T, 0) / 10)
6730 LI = S(T, 0) - 10 * RE
6740 A$ = CHR$(64 + LI) + CHR$(47 + RE)
6750 PRINT A$
6760 RETURN
7000 REM: generation des coups
7020 MT = 0
7030 G = G1(T)
7040 FOR V = 21 TO 98
7050 A = B(V)
7060 IF A = 100 THEN 7490
7070 IF SGN(A) <> F THEN 7490
7080 A = ABS(A)
7110 IF A <> 1 THEN 7360
7120 N = V + (F * 10)
7130 IF B(N) <> 0 THEN 7210
7140 GOSUB 7900
7150 IF (INT(V / 10) - 5.5) * F <> -2.5 THEN 7210
7160 N = V + (F * 20)
7170 IF B(N) <> 0 THEN 7210
7180 GOSUB 8500
7190 Z(G - 1, 6) = (V + N) * .5
7210 REM
7220 FOR I = 1 TO 2
7230 N = V + O(F + I)
7240 IF B(N) = 100 THEN 7330
7250 IF N = S(T, 0) THEN 7300
7260 IF SGN(B(N)) <> -F THEN 7330
7270 IF B(N) = -F * 6 THEN MT = 1: GOTO 7810
7280 GOSUB 7900
7290 GOTO 7330
7300 GOSUB 8500
7310 Z(G - 1, 3) = 1
7320 Z(G - 1, 6) = N - 10 * F
7330 NEXT I
7340 GOTO 7490
7360 REM
7370 FOR I = OA(A) TO OE(A)
7380 LA = L(A)
7390 N = V
7400 N = N + O(I)
7410 IF B(N) = 100 THEN 7480
7420 IF SGN(B(N)) = F THEN 7480
7430 IF B(N) = 0 THEN 7460
7440 IF B(N) = -F * 6 THEN MT = 1: GOTO 7810
7450 LA = 0
7460 GOSUB 8500
7470 IF LA = 1 THEN 7400
7480 NEXT I
7490 NEXT V
7520 FOR I = F + 2 TO F + 3
7530 IF S(T, I) = 0 THEN 7790
7540 FOR J = R1(I) TO R2(I)
7550 IF B(J) <> 0 THEN 7790
7560 NEXT J
7580 FOR J = R3(I) TO R4(I)
7590 FOR K = 0 TO 7
7600 N = J
7610 N = N + O(K)
7620 IF B(N) = 100 THEN 7700
7630 IF SGN(B(N)) = F THEN 7700
7640 IF B(N) = 0 THEN 7610
7650 IF OA(ABS(B(N))) > K THEN 7700
7660 IF OA(ABS(B(N))) < K THEN 7700
7670 IF N = J + O(K) THEN 7790
7680 IF L(ABS(B(N))) <> 1 THEN 7700
7690 GOTO 7790
7700 NEXT K
7710 FOR K = 8 TO 15
7720 IF B(J + O(K)) = -F * 4 THEN 7790
7730 NEXT K
7740 NEXT J
7750 V = R5(I)
7760 N = R6(I)
7770 GOSUB 8500
7780 Z(G - 1, 5) = I
7790 NEXT I
7800 G1(T + 1) = G
7810 RETURN
7900 REM: noter les coups de pion
7920 IF (INT(N / 10) - 5.5) * F <> 3.5 THEN GOSUB 8500: GOTO 7980
7940 FOR I2 = 5 TO 2 STEP -1
7950 GOSUB 8500
7960 Z(G - 1, 4) = I2
7970 NEXT I2
7980 RETURN
8500 REM: placer le coup genere dans la pile des coups  (Put the move in the list?)
8520 Z(G, 1) = V
8530 Z(G, 2) = N
8540 Z(G, 3) = ABS(B(N))
8550 FOR I1 = 4 TO 6
8560 Z(G, I1) = 0
8570 NEXT I1
8580 IF G = 200 THEN 8600
8590 G = G + 1
8600 RETURN
8800 REM: initialisation de l'arbre des coups  (Initilaize the move tree)
8820 IF T = 0 THEN 8880
8830 FOR I = 0 TO 4
8840 S(0, I) = S(1, I)
8850 NEXT I
8860 M(0) = M(1)
8870 T = 0
8880 RETURN
9000 REM: execution du coup  (executing the move)
9020 T = T + 1
9030 S(T, 0) = 0
9040 FOR I = 1 TO 4
9050 S(T, I) = S(T - 1, I)
9060 NEXT I
9070 M(T) = M(T - 1)
9080 V = Z(Z1, 1)
9090 N = Z(Z1, 2)
9100 IF Z(Z1, 6) = 0 THEN 9160
9110 IF Z(Z1, 3) = 0 THEN 9140
9120 B(Z(Z1, 6)) = 0
9130 GOTO 9430
9140 S(T, 0) = Z(Z1, 6)
9150 GOTO 9430
9160 REM
9170 IF V <> R5(F + 2) THEN 9210
9180 S(T, F + 2) = 0
9190 S(T, F + 3) = 0
9200 GOTO 9360
9210 IF V <> R7(F + 2) THEN 9240
9220 S(T, F + 2) = 0
9230 GOTO 9260
9240 IF V <> R7(F + 3) THEN 9260
9250 S(T, F + 3) = 0
9260 IF N <> R7(-F + 2) THEN 9290
9270 S(T, -F + 2) = 0
9280 GOTO 9310
9290 IF N <> R7(-F + 3) THEN 9310
9300 S(T, -F + 3) = 0
9310 REM
9320 IF Z(Z1, 4) = 0 THEN 9430
9330 B(V) = Z(Z1, 4) * F
9340 M(T) = M(T) + F * (U(Z(Z1, 4)) - 100)
9350 GOTO 9430
9360 REM
9370 RO = Z(Z1, 5)
9380 IF RO = 0 THEN 9430
9390 VO = R7(RO)
9400 B(VO) = 0
9410 NA = (R5(RO) + R6(RO)) * .5
9420 B(NA) = 2 * F
9430 REM
9440 B(N) = B(V)
9450 B(V) = 0
9460 M(T) = M(T) + F * U(Z(Z1, 3))
9470 F = -F
9480 RETURN
9600 REM: reprise de coup
9620 F = -F
9630 V = Z(Z1, 1)
9640 N = Z(Z1, 2)
9650 IF Z(Z1, 6) = 0 THEN 9710
9660 IF Z(Z1, 3) = 0 THEN 9820
9670 B(Z(Z1, 6)) = -F
9680 B(V) = F
9690 B(N) = 0
9700 GOTO 9840
9710 REM
9720 RO = Z(Z1, 5)
9730 IF RO = 0 THEN 9790
9740 NA = (R5(RO) + R6(RO)) * .5
9750 B(NA) = 0
9760 VO = R7(RO)
9770 B(VO) = 2 * F
9780 GOTO 9820
9790 REM
9800 IF Z(Z1, 4) = 0 THEN 9820
9810 B(N) = F
9820 B(V) = B(N)
9830 B(N) = -F * Z(Z1, 3)
9840 T = T - 1
9850 RETURN
10000 REM: recherche alpha-beta
10020 Z2 = 0
10030 C1 = 0
10040 W(0) = -32767
10050 W(1) = -32767
10070 IF T < T0 THEN 10110
10080 GOSUB 12000
10090 W(T + 2) = W * F    ' BUG <-- Unchanging
10100 GOTO 10380
10110 GOSUB 7000
10120 IF MT = 0 THEN 10150
10130 W(T + 2) = 32767 - T
10140 GOTO 10380
10150 IF G > G1(T) THEN 10190
10160 W(T + 2) = 0
10170 GOTO 10380
10180 REM
10190 P(T) = G1(T)
10200 W(T + 2) = W(T)
10220 Z1 = P(T)
10230 IF T <> 0 THEN 10250
10240 locate 14,42
      color normalback, normalfore
      print "Examining ";
      GOSUB 6000
10250 GOSUB 9000
10260 C1 = C1 + 1
10270 GOTO 10070
10290 IF -W(T + 3) <= W(T + 2) THEN 10350
10300 W(T + 2) = -W(T + 3)
10310 IF T > 0 THEN 10340
10320 Z2 = P(T)
10330 locate 15,42
      color normalback, normalfore
      PRINT "  Better move "; "- value ="; W(2)
10340 IF W(T + 2) >= -W(T + 1) THEN 10380
10350 P(T) = P(T) + 1
10360 IF P(T) < G1(T + 1) THEN 10220
10370 IF W(T + 2) <> -32766 + T THEN 10380
10371 F = -F
10372 GOSUB 7000
10373 F = -F
10374 IF MT = 1 THEN 10380
10375 W(T + 2) = 1 + T
10380 IF T = 0 THEN 10430
10390 Z1 = P(T - 1)
10400 GOSUB 9600
10410 GOTO 10290
10430 W = W(2)
10440 RETURN
12000 REM: fonction d'evaluation
12020 REM: W = 0: RETURN: REM: *** fonction d'evaluation nulle, pour problemes ***
12030 M = 0
12040 W = 0
12050 FOR I = 0 TO 2
12060 T7(I) = 0
12070 BA(I) = 0
12080 FOR J = 0 TO 9
12090 BL(I, J) = 0
12100 TL(I, J) = 0
12110 NEXT J
12120 NEXT I
12140 FOR I = 2 TO 9
12150 FOR J = 1 TO 8
12160 V = I * 10 + J
12170 A = ABS(B(V))
12180 IF A = 0 THEN 12420
12190 FA = SGN(B(V))
12200 M = M + U(A)
12210 ON A GOTO 12220, 12270, 12320, 12360, 12420, 12390
12220 REM
12230 BA(FA + 1) = BA(FA + 1) + 1
12240 BL(FA + 1, J) = BL(FA + 1, J) + 1
12250 w=w+FA * (BV(J)) * (3.5 - FA * (5.5 - I))
12260 GOTO 12420
12270 REM
12280 IF (I - 5.5) * FA <> 2.5 THEN 12300
12290 T7(FA + 1) = T7(FA + 1) + 1
12300 TL(FA + 1, J) = TL(FA + 1, J) + 1
12310 GOTO 12420
12320 REM
12330 IF (I - 5.5) * FA <> -3.5 THEN 12420
12340 W = W - FA * 10
12350 GOTO 12420
12360 REM
12370 W = W + (FA * ZT(I, J))
12380 GOTO 12420
12390 REM
12400 KR(FA + 1) = I
12410 KL(FA + 1) = J
12420 NEXT J
12430 NEXT I
12440 REM
12460 FA = SGN(M(T))
12470 IF FA = 0 THEN 12500
12480 w=w+M(T)+INT(M(T) * BA(FA + 1) / (BA(FA + 1) + 1) * (M0 - M) * .0001)
12500 REM
12510 w=w+INT(ZT(KR(2), KL(2)) * (43000 - M + M(T)) * .001)
12520 w=w-INT(ZT(KR(0), KL(0)) * (43000 - M - M(T)) * .001)
12550 w=w+(T7(2) * T7(2) * 12)
12560 w=w-(T7(0) * T7(0) * 12)
12590 FOR I = 1 TO 8
12600 FOR J = 0 TO 2
12610 FA = J - 1
12620 IF FA = 0 THEN 12880
12630 IF BL(J, I) = 0 THEN 12830
12640 w=w-FA * (BL(J, I) - 1) * 8
12650 IIS = 0
12660 IF BL(J, I - 1) > 0 THEN 12710
12670 IF BL(J, I + 1) > 0 THEN 12710
12690 W = W - FA * 20
12700 IIS = 1
12710 IF BL(2 - J, I) > 0 THEN 12880
12730 w=w-FA * TL(2 - J, I) * TL(2 - J, I) * 3
12740 IF BL(2 - J, I - 1) > 0 THEN 12790
12750 IF BL(2 - J, I + 1) > 0 THEN 12790
12770 W = W + FA * 18
12780 GOTO 12890
12790 REM
12800 IF IIS = 0 THEN 12890
12810 W = W - FA * 10
12820 GOTO 12890
12830 IF BL(2 - J, I) > 0 THEN 12880
12850 w=w+TL(2, I) * TL(2, I) * 8
12860 w=w-TL(0, I) * TL(0, I) * 8
12870 GOTO 12890
12880 NEXT J
12890 NEXT I
12900 RETURN
15000 END
