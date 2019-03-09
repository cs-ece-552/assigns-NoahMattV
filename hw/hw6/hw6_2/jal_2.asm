//test case when given displacement is most negative
lbi r7, 1
jal -1024 //should result in a negative addr when
	  //added to the PC
