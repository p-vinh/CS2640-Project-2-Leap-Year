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

notleap:
	.asciiz " is not a leap year"
leap:	.asciiz	" is a leap year"
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
	move	$t0, $v0		# month = $t2

	la	$a0, day		# Printing out day
	li	$v0, 4
	syscall
	li	$v0, 5			
	syscall
	move	$t1, $v0		# day = $t2

	la	$a0, year		# Printing out year
	li	$v0, 4
	syscall
	li	$v0, 5			
	syscall
	move	$t2, $v0		# year = $t2

	li	$t3, 4
	div	$t2, $t3		# year / 4
	mfhi	$t4			# remainder

	bne	$t4, 0, endif		# if remainder != 0 else endif 
	li	$t3, 100
	div	$t2, $t3		# year / 100
	mfhi	$t4			# remainder
	bne	$t4, 2, endif		# if remainder != 1 else endif

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap		
	li	$v0, 4
	syscall
endif:

	li	$t3, 400
	div	$t2, $t3		# year / 400
	mfhi	$t4			# remainder
	bne	$t4, 0, endif2		# if remainder != 0 else endif2
	
	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap		
	li	$v0, 4
	syscall
endif2:

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, notleap		
	li	$v0, 4
	syscall



	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 10		# exit
	syscall