//Test case where new PC value is an invalid addr
lbi r1, -100    //r1 <- 100
lbi r7, 100     //r7 <- 100
jalr r1, -5     //PC <- r1 + 555
	        //r7 <- PC + 2
