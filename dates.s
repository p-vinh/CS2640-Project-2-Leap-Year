# 
#  Name:   Pham, Vinh 
#  Project:  2 
#  Due:        14 October 2022 
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#    The progam prints out the whether the given date is a leap year or not and gives the day of the week
# 


	.data
sunday:	
	.word	0
	.asciiz	" is a Sunday."
monday:	
	.word	1
	.asciiz	" is a Monday."
tuesday:
	.word	2
	.asciiz	" is a Tuesday."
wednesday:
	.word	3
	.asciiz	" is a Wednesday."
thrusday:
	.word	4
	.asciiz	" is a Thrusday."
friday:	
	.word	5
	.asciiz	" is a Friday."
saturday:
	.word	6
	.asciiz	" is a Saturday."

notleap:
	.asciiz " is not a leap year and"
leap:	.asciiz	" is a leap year and"
month:	.asciiz	"Enter the month? "
day:	.asciiz	"Enter the day? "
year:	.asciiz	"Enter the year? "

	.text
main:
	la	$a0, month		# Printing out month
	li	$v0, 4
	syscall
	li	$v0, 5			# Get input
	syscall
	move	$t0, $v0		# month = $t0

	la	$a0, day		# Printing out day
	li	$v0, 4
	syscall
	li	$v0, 5			
	syscall
	move	$t1, $v0		# day = $t1

	la	$a0, year		# Printing out year
	li	$v0, 4
	syscall
	li	$v0, 5			
	syscall
	move	$t2, $v0		# year = $t2





	li	$t3, 4
	rem	$t4, $t2, $t3

	bne	$t4, 0, endif		# if remainder != 0 else endif 
	li	$t3, 100
	rem	$t4, $t2, $t3		# year / 100
	bne	$t4, 2, endif		# if remainder != 1 else endif

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap		
	li	$v0, 4
	syscall
endif:

	li	$t3, 400
	rem	$t4, $t2, $t3
	bne	$t4, 0, else		# if remainder != 0 else endif2
	
	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap		
	li	$v0, 4
	syscall
	b	endif2
else:

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, notleap		
	li	$v0, 4
	syscall

endif2:
	li	$t4, 14			# a = $t3
	sub	$t3, $t4, $t0		# $t3 = 14 - month
	div	$t3, $t3, 12		# $t3 = $t3 / 12

	sub	$t4, $t2, $t3		# y = $t4

	mul	$t3, $t3, 12		# m = $t3 Don't need 'a' because it is no longer needed for calculations
	add	$t3, $t3, $t0
	sub	$t3, $t3, 2


	
	


	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 10		# exit
	syscall