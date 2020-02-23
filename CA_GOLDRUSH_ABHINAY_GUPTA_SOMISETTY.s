#Abhinay Gupta Somisetty
#Project CA Gold Rush

.data



Dr:
	.ascii "\n\n"
	.ascii "      ____\n"
	.ascii "     / \n"
	.ascii "    /	\n"
	.ascii "    |	\n"
	.ascii "|   |	|\n"
	.ascii "|---|---|\n"
	.ascii "|---|---|\n"
	.ascii "|_______|\n\0"



axe:
 .ascii "\n\n"
 .ascii "_________________.---.______\n"
 .ascii "(_(______________(_o o_(____()\n"
 .ascii "              .___.'. .'.___.\n"
 .ascii "              \ o    Y    o /\n"
 .ascii "               \ \__   __/ /\n"
 .ascii "                '.__'-'__.'\n"
 .ascii "                    '''\n\0"

Ca:


	.ascii "\n\n"
	.ascii "			                 .			\n"
	.ascii "					.$r 		         \n"
	.ascii "			               z$$$b			 \n"
	.ascii "	            		     z$$$$$$$e		  	\n"
	.ascii "				  .d$$$$$$$$$$$b.	  	\n"
	.ascii "				zd$$$$$$$$$$$$$$$$$$e.		\n"
	.ascii "			  z*************$*************4		\n"
	.ascii "			   F         .*' $ '%c.         L 	\n"
	.ascii "			  d     .z*'     $     '*e.     4 	 \n"
        .ascii "			  F .z*'         $         '*e.  L 	\n"
	.ascii "			 dP'             $             ^*$  	\n"
	.ascii "			 F$              $              .PL  	\n"
	.ascii "			d *              $              4 3	 \n"
	.ascii "		       .F 4.             $              $  L 	\n"
        .ascii "		       d   F             $              F  3 	\n"
	.ascii "		       P   $             $             4%   L	 \n"
	.ascii "		      d    3             $             d    *  	\n"
	.ascii "		      P    4r            $             $    ^L 	\n"
	.ascii "		     '%=====%============*=============%=====*'	 \n\0"


ER:
	.ascii "\n Incorrect input.program will terminate\0"
SB:
	.ascii "\n The sluice is broken. Repair it..Else you won't earn profits.\0" 
G:
	.ascii "\n GAME OVER\0"
FF:
	.ascii "\n You ended the game with total funds:$\0"
FE:
	.ascii "\n Your final endurance :\0"
SR:
	.ascii "\nYou repaired sluice 100%.\0"
TC:
	.ascii "\nGoing to town cost you $\0"
EG:
	.ascii "\nGained endurance:\0"
Ti:
	.ascii "\nCALIFORNIA GOLD RUSH\0"
R:
	.ascii "RULES\n\0"
R1:
	.ascii "1. 20 weeks(5 months)\n\0"
R2:
	.ascii "2. Your endurance drops 10-25% each week.If it reaches 0%, the game ends\n\0"
R3:
	.ascii "3. Panning for gold yeilds 0-100 dollars\n\0"
R4:
	.ascii "4. A sluice yields 0-1000 dollars(durability drops 20-50% each week)\n\0"
R5:
	.ascii "5. Food costs 30-50 dollars.\n\0"
R6:
	.ascii "6. Camping Costs you 50 dollars.\n\0"
R7:
	.ascii "7. Shopping costs you 0-75 dollars.\n\0"
F:
	.ascii "\nYou have funds:\0"
E:
	.ascii "\nYour endurance is at:\0"
S:
	.ascii "\nSluice is at:\0"
Q:
	.ascii "\n\nIt' Sunday! Do you want to 1. Do nothing, 2. Repair sluice (-$100), 3. Go to town, 4. camping 5.Shopping \0"
NL:
	.ascii "\n\0"
W:
	.ascii "\nIt's Week:\0"
P:
	.ascii "\nPanning for gold yielded: \0"
SY:
	.ascii "\nThe sluice yielded: \0"
Food:
	.ascii "\nCost of food you ate: \0"
C:
	.ascii "\nCamping costed you 50 dollars.\0"
SH:
	.ascii "\nShopping costed you:\0"
De:
	.ascii "\n=======================\0"
ST:
	.ascii "\nTotal amount you spent on shopping\n\0"

.text
.global _start
_start:
	
	mov $1,%r8		#assume week # is in r8
	mov $100,%rax		#assume endurance is in rax
	mov $100,%rbx		#assume funds isin rbx
	mov $100,%r15		#assume sluice is in r15
	#setting title color and printing the title
	mov $1,%rdx
	call SetForeColor
	mov $De,%rdx
	call PrintCString
	mov $Ti,%rdx
	call PrintCString
	mov $De,%rdx
	call PrintCString
	
	#setting a color and printing an ascii art(axe)
	mov $3,%rdx
	call SetForeColor
	mov $axe,%rdx
	call PrintCString
	
	#setting  colors for rules and printing the rules
	mov $2,%rdx
	call SetForeColor	
	mov $R,%rdx
	call PrintCString
	mov $R1,%rdx
	call PrintCString
	mov $R2,%rdx
	call PrintCString
	mov $R3,%rdx
	call PrintCString
	mov $R4,%rdx
	call PrintCString
	mov $R5,%rdx
	call PrintCString
	mov $R6,%rdx
	call PrintCString
	mov $R7,%rdx
	call PrintCString


	#starting with the loop
	Loop:
		#comparing the number of weeks and allowing the player to continue or exit the game
		cmp $20,%r8
		jle looptrue		#go and check the endurance if weeks is less than 20 

		call End

		#checking if the endurance is greaterthan 0 else end the game
		looptrue:
			cmp $0,%rax
			jg part1
	
			call End

		#starting the game
		part1:
				
			##set color and print the week number,funds endurance and sluice left and choices at the end of the week and read the choice
		
			mov $1,%rdx
			call SetForeColor
			mov $De,%rdx
			call PrintCString
			mov $3,%rdx
			call SetForeColor
			
			mov $W,%rdx
			call PrintCString
			mov %r8,%rdx
			call PrintIn
t
			mov $1,%rdx
			call SetForeColor
			mov $De,%rdx
			call PrintCString

			mov $3,%rdx
			call SetForeColor
			mov $F,%rdx
			call PrintCString
			mov %rbx,%rdx
			call PrintInt

			mov $E,%rdx
			call PrintCString
			mov %rax,%rdx
			call PrintInt

			mov $S,%rdx
			call PrintCString
			mov %r15,%rdx
			call PrintInt

			mov $Q,%rdx
			call PrintCString
			mov $7,%rdx		#input color is white
			call SetForeColor
			call ScanInt
			mov %rdx,%r9		#r9 has the choice
			
			mov $7,%rdx
			call SetForeColor
			#compare the number of choices and if it is more than given options exit the game with a error meassage
			cmp $5,%r9
			jg err

			#if choice is valid perform the task\
			#check for option 1
			cmp $1,%r9
			je case1
			
			#check for option2
			cmp $2,%r9
			je case2
			
			#check for option3
			cmp $3,%r9
			je case3
			
			#check for option3
			cmp $4,%r9
			je case4
			
			#check for option3
			cmp $5,%r9
			je case5
			
			#if do nothing just jump to part 3
			case1:
				jmp part2


			#for choice 2
			case2:
				#cmp $100,%r15
				#jl a3
				mov $100,%r15
			
				sub $100,%rbx
				mov $SR,%rdx
				call PrintCString
				jmp part2

			#for choice 3
			case3:

				mov $151,%rdx
				call Random
				add $50,%rdx
				mov %rdx,%r11			#cost in r11	
				#add $50,%r11

				mov $TC,%rdx
				call PrintCString
				mov %r11,%rdx
				call PrintInt

				mov $50,%rdx
				call Random
				mov %rdx,%r10			#gain in r10
				#mov $7,%rdx
				#call SetForeColor
				#mov %r10,%rdx
				#call PrintInt
				mov $EG,%rdx
				call PrintCString
				mov %r10,%rdx
				call PrintInt
		
				sub %r11,%rbx
				add %r10,%rax
				jmp part2
			#camping costs 100$
			case4:
				mov $Ca,%rdx
				call PrintCString
				sub $50,%rbx
				mov $C,%rdx
				call PrintCString
				mov $F,%rdx
				call PrintCString
				mov %rbx,%rdx
				call PrintInt
				jmp part2
				
			#shopping costs 0-75 $ and shopping expenes are saved in r12
			case5:
				mov $76,%rdx
				call Random
				mov %rdx,%r12
				mov $SH,%rdx
				call PrintCString
				mov %r12,%rdx
				call PrintInt
				#mov %rbx,%rdx
				#call PrintInt
				sub %r12,%rbx
				mov $F,%rdx
				call PrintCString
				mov %rbx,%rdx
				call PrintInt
				jmp part2
				
				
		
			#if input is invalid return a error message and end the program
			err:
				mov $1,%rdx
				call SetForeColor
				mov $ER,%rdx
				call PrintCString
				jmp End
		

		part2:
			mov $NL,%rdx
			call PrintCString
			#set color
			mov $5,%rdx
			call SetForeColor
			
			
			#panning for gold yeilded and add profits to funds
			mov $P,%rdx
			call PrintCString
			mov $101,%rdx
			call Random
			call PrintInt
			mov %rdx,%r13			#profits into r13
			add %r13,%rbx
		
			#check if sluice is greaterthan zero 
			cmp $0,%r15
			jle else		#if sluice is lessthan or equal to zero end the game
			
			
			# sluice yeilded is between 0-1000
			mov $1001,%rdx
			call Random
			mov %rdx,%r13
			mov $SY,%rdx
			call PrintCString
			mov %r13,%rdx
			call PrintInt
			add %r13,%rbx
			jmp part3
			
			#if sluice is not greaterthan zero then sluice is broken.
			else:
				mov $SB,%rdx
				call PrintCString
				jmp part3
	
		part3:
			#calculate the cost of food and drinks using r11 and reduce it from funds. Printing the cup of juice.
		        mov $21,%rdx
	        	call Random

			add $30,%rdx
			mov %rdx,%r11			#move cost of food to r11 which is between $30-50

			mov $6,%rdx
			call SetForeColor
			mov $Dr,%rdx
			call PrintCString


			mov $5,%rdx
			call SetForeColor
			mov $Food,%rdx
			call PrintCString
			mov %r11,%rdx
			call PrintInt
			sub %r11,%rbx

			#part4:
			#calculating damage for endurance 10-25
			mov $16,%rdx
			call Random
			mov %rdx,%r14			#mov damage to r14
			add $10,%r14
			sub %r14,%rax
			
			mov %rax,%rdx
			call PrintInt
			
			#calculating damage for sluice 20-50
	
			mov $31,%rdx
			call Random
			mov %rdx,%r14			#move sluice damage to r14
			add $20,%r14
			sub %r14,%r15

			cmp $0,%rax				#
			jl a1
			
			cmp $0,%r15
			jl a2
					
			
		jmploop:	
			add $1,%r8			# incrementing week
			jmp Loop
			
			
			a2:
				mov $0,%r15
				call jmploop
				
			a1:
				mov $0,%rax
				call End
				
			
	
			
		#end of week,if resources are available it again start from begining	
			
		End:
			#set color and print the final funds, final endurance,final amoount spend for shopping and again set back the color to white
			mov $6,%rdx				
			call SetForeColor
			mov $G,%rdx
			call PrintCString

			#print final funds

			mov $FF,%rdx
			call PrintCString
			mov %rbx,%rdx
			call PrintInt

			#print final endurace

			mov $FE,%rdx
			call PrintCString
			mov %rax,%rdx
			call PrintInt

			#final amount spent for shopping

			mov $SH,%rdx
			call PrintCString
			mov %r12,%rdx
			call PrintInt
			
			mov $NL,%rdx
			call PrintCString
			mov $7,%rdx
			call SetForeColor
			call EndProgram
