	.data
month:	.asciiz "Enter the month? "
day:	.asciiz "Enter the day? "
year:	.asciiz "Enter the year? "

	.text
main:
	la	$a0, month		# Printing out month
	li	$v0, 4
	syscall
	li	$v0, 5			# Get input
	syscall
	move	$t0, $v0		
	li	$a0, '\n'
	li	$v0, 11
	syscall

	la	$a0, day		# Printing out day
	li	$v0, 4
	syscall
	li	$v0, 5			# Get input
	syscall
	move	$t1, $v0		
	li	$a0, '\n'
	li	$v0, 11
	syscall

	la	$a0, year		# Printing out year
	li	$v0, 4
	syscall
	li	$v0, 5			# Get input
	syscall
	move	$t2, $v0		
	li	$a0, '\n'
	li	$v0, 11
	syscall


	move	$t0, $v0		



	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 10		# exit
	syscall