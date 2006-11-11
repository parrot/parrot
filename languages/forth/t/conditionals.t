#!../../parrot test.pir

1 IF ." true" ELSE ." false" THEN
true

0 IF ." true" ELSE ." false" THEN
false

4 0 IF 1 - ELSE 2 4 + - THEN
-2
