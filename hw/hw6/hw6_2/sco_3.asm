//Tests positive and negative number to see if a carry out will be generated.
lbi r1, -20 //r1 = -20
lbi r2, 127 //r2 = 255
sco r3, r1, r2 //r3 should = 1 a carry out is  generated

