///test case with negative value
lbi r1, -10    //r1 <- 100
lbi r7, 100    //r7 <- 100
jalr r1, 55   //PC <- r1 + 555
	       //r7 <- PC + 2
