//Tests when the label is a negative value
lbi r7, 10
jal -555      //PC <- PC + 2 - 555
	      //r7 <- PC + 2

