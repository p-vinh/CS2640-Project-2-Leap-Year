#
#  Name:	Pham, Vinh
#  Project:	2
#  Due:		14 October 2022
#  Course:	cs-2640-04-f22
#
#  Description:
#    The progam prints out the whether the given date is a leap year or not and gives the day of the week
#


	.data
sunday:
	.asciiz	" is a Sunday."
monday:
	.asciiz	" is a Monday."
tuesday:
	.asciiz	" is a Tuesday."
wednesday:
	.asciiz	" is a Wednesday."
thrusday:
	.asciiz	" is a Thrusday."
friday:
	.asciiz	" is a Friday."
saturday:
	.asciiz	" is a Saturday."

notleap:
	.asciiz " is not a leap year and "
leap:	.asciiz	" is a leap year and "
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






	rem	$t4, $t2, 4

	bne	$t4, 0, endif		# if remainder != 0 else goto endif

	rem	$t4, $t2, 100		
	beqz	$t4, endif		# if remainder == 0 else goto endif

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap
	li	$v0, 4
	syscall
	b	endif2
endif:

	rem	$t4, $t2, 400
	bnez	$t4, else		# if remainder != 0 else endif2

	move	$a0, $t2		# Printing out leap
	li	$v0, 1
	syscall
	la	$a0, leap
	li	$v0, 4
	syscall
	b	endif2
else:

	move	$a0, $t2		# Printing out not a leap
	li	$v0, 1
	syscall
	la	$a0, notleap
	li	$v0, 4
	syscall

endif2:

	li	$t4, 14			# a = $t3 (Calculations for a)
	sub	$t3, $t4, $t0
	div	$t3, $t3, 12

	sub	$t4, $t2, $t3		# y = $t4 (Calculation for y)

					# Calculations for m
	mul	$t3, $t3, 12		# m = $t3 Don't need 'a' because it is no longer needed for calculations
	add	$t3, $t3, $t0
	li	$t7, 2
	sub	$t3, $t3, $t8


	add	$t5, $t1, $t4		# Calculation for d
	div	$t6, $t4, 4
	add	$t5, $t5, $t6
	div	$t6, $t4, 100
	sub	$t5, $t5, $t6
	div	$t6, $t4, 400
	add	$t5, $t5, $t6
	mul	$t6, $t3, 31
	div	$t6, $t6, 12
	add	$t5, $t5, $t6
	rem	$t5, $t5, 7
	

	move	$a0, $t0		# Printing out the date
	li	$v0, 1
	syscall
	li	$a0, '/'
	li	$v0, 11
	syscall
	move	$a0, $t1
	li	$v0, 1
	syscall
	li	$a0, '/'
	li	$v0, 11
	syscall
	move	$a0, $t2
	li	$v0, 1
	syscall


# changes i would do - turn this into an array search instead

	bnez	$t5, endif3		# Looking for the day of the week
	la	$a0, sunday
	li	$v0, 4
	syscall
endif3:
	bne	$t5, 1, endif4
	la	$a0, monday
	li	$v0, 4
	syscall
endif4:
	bne	$t5, 2, endif5
	la	$a0, tuesday
	li	$v0, 4
	syscall
endif5:
	bne	$t5, 3, endif6
	la	$a0, wednesday
	li	$v0, 4
	syscall
endif6:
	bne	$t5, 4, endif7
	la	$a0, thrusday
	li	$v0, 4
	syscall
endif7:
	bne	$t5, 5, endif8
	la	$a0, friday
	li	$v0, 4
	syscall
endif8:
	bne	$t5, 6, else2
	la	$a0, saturday
	li	$v0, 4
	syscall

else2:

	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 10			# exit
	syscall