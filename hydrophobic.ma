%CDPlusPlus_Builder_Version_1.0.0

[top]
components : hydrophobic

[hydrophobic] 
type : cell
dim : (55,55)
delay : transport
defaultDelayTime : 100
border : wrapped
neighbors :           		   	hydrophobic(0,-1) 	
neighbors :   hydrophobic(-1,0) hydrophobic(0,0) hydrophobic(1,0) 
neighbors :           		    hydrophobic(0,1) 	  	                    					
initialValue : -1
localtransition : hydro-rule

[hydro-rule] 
%Initialize the cells with 1=water and 2=solute molecules - 69% of the cells are to be occupied
rule : {1} 100 { (0,0) = -1 and random < 0.59 }
rule : {2} 100 { (0,0) = -1 and random < 0.10 }
%Initialize to be empty cell
rule : 0 100 { (0,0) = -1 } 
%Rules in case cell is vacant
rule : 1 100 {(0,0) = 0 and statecount(1)>=3}
rule : 2 100 {(0,0) = 0 and statecount(2)>=1}
rule : 0 100 {(0,0) = 0 and statecount(2)<1 and statecount(1)<3}
%Rules in case cell is occupied with water molecule
rule : 2 100 {(0,0) = 1 and statecount(2)>2}
rule : 1 100 {(0,0) = 1 and statecount(2)<2}
%Rules in case cell is occupied with solute molecule
rule : 1 100 {(0,0) = 2 and statecount(1)>=3}
rule : 2 100 {(0,0) = 2 and statecount(1)<3}

%Any others
rule : 0 100 {t}
