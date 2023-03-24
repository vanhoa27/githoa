	#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
	#+ ------------------------------------------

.data
str_Par: .asciiz "("
str_ColonTab: .asciiz "):\t"
str_Start: .asciiz "Das Programm ruft die Funktion permnext auf und zeigt Iterationsnummer und die neu gebildete Permutation an.\n"
str_Abbruch: .asciiz "Ausfuehrung abgebrochen (maximale Iterationsnummer erreicht).\n"
str_Spaces: .asciiz "  "
str_Break: .asciiz "\n"

.text

.eqv SYS_PUTSTR 4 		#const define syscall ($v0)
.eqv SYS_RD_INT 5
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

.globl main
main:
	# Beginn der Ausführung anzeigen:
	li $v0, SYS_PUTSTR
	la $a0, str_Start
	syscall

	move $s0, $zero		#int i=0
_print_main:
	li $v0, SYS_PUTSTR
	la $a0, str_Par
	syscall
	
	li $v0, SYS_PUTINT
	move $a0, $s0
	syscall

	li $v0, SYS_PUTSTR
	la $a0, str_ColonTab
	syscall

	addi $s0, $s0, 1
	la $a0, test_perm
	lw $a1, test_perm_length
	jal perm_print

	la $a0, test_perm
	lw $a1, test_perm_length
	jal permnext
	beq $zero, $v0, _end_main
	li $t0, 1000
	blt $s0, $t0, _print_main
	
	li $v0, SYS_PUTSTR
	la $a0, str_Abbruch
	syscall
	
	# Programmende
	li $v0, SYS_EXIT
	syscall

_end_main:
	li $v0, SYS_EXIT
	syscall

# void perm_print(unsigned char *perm, int length)
perm_print:
	move $t0, $zero
	move $t1, $a0
_for:
	add $t2, $t1, $t0
	lbu $t3, 0($t2)

	li $v0, SYS_PUTINT
	move $a0, $t3
	syscall

	li $v0, SYS_PUTSTR
	la $a0, str_Spaces
	syscall

	addi $t0, $t0, 1
	bne $t0, $a1, _for
#_ret:
	li $v0, SYS_PUTSTR
	la $a0, str_Break
	syscall
	jr $ra

# void swap(unsigned char *test_perm, int a, int b)
swap:
	add $t1, $a0, $a1
	add $t2, $a0, $a2
	lbu $t0, 0($t1)
	lbu $t3, 0($t2)
	sb $t3, 0($t1)
	sb $t0, 0($t2)
#_ret:
	jr $ra

	#+ BITTE VERVOLLSTAENDIGEN: Persoenliche Angaben zur Hausaufgabe 
	#+ -------------------------------------------------------------

	# Vorname: Van Hoa
	# Nachname: Nguyen
	# Matrikelnummer: 483979
	
	#+ Loesungsabschnitt
	#+ -----------------

.data

test_perm_length: .word 4
test_perm: .byte 0, 1, 2, 3

.text

permnext:
	addi $sp, $sp, -20   # reserve space on the stack

	sw $ra, 16($sp)      # store $ra on the stack
	sw $s0, 12($sp)      # store $s0 (i)
	sw $s1, 8($sp)       # store $s1 (j)
	sw $s2, 4($sp)       # store $s2 (k)
	sw $s3, 0($sp)       # store $s3 (l)

	addi $s0, $a1, -2    # i = length - 2
	addi $s1, $zero, 0   # j = 0
	addi $s2, $zero, 0   # k = 0
	addi $s3, $zero, 0   # l = 0

while:
	move $t0, $s0         # $t0 = i
	sll $t0, $t0, 2       # $t0 = 4 * i
	add $t0, $t0, $a0     # $t0 = &perm[i]

	lw $t1, 0($t0)        # $t1 = perm[i]
	lw $t2, 4($t0)        # $t2 = perm[i+1]

	bge $t1, $t2, if      # if (perm[i] >= perm[i+1]) goto if

	addi $s1, $a1, -1     # j = length - 1

if:
	addi $s0, $s0, -1     # i--
	bge $s0, $zero, while # if (i >= 0) goto while
	addi $v0, $zero, 0    # return 0
	j end

while2:
	sll $t1, $s0, 2       # $t1 = 4 * i
	add $t1, $t1, $a0     # $t1 = &perm[i]
	lw $t2, 0($t1)        # $t2 = perm[i]

	sll $t3, $s1, 2       # $t3 = 4 * j
	add $t3, $t3, $a0     # $t3 = &perm[j]
	lw $t4, 0($t3)        # $t4 = perm[j]

	bge $t2, $t4, endwhile2     # if (perm[i] >= perm[j]) goto if

	j while2

if2:
	addi $s1, $s1, -1      # j--
	bge $s1, $zero, while2 # if (j >= 0) goto while2

endwhile2:
	addi $a0, $a0, 0      # $a0 = perm[]
	addi $a1, $s0, 0      # $a1 = i
	addi $a2, $s1, 0      # $a2 = j
	jal swap

	addi $s2, $s0, 1      # k = i + 1
	addi $s3, $a1, -1     # l = length - 1

	reverse:
		jal swap
		addi $s2, $s2, 1   # k++
		addi $s3, $s3, -1  # l--
		
		addi $v0, $zero, 1 # return 1
		blt $s2, $s3, end  # if (k >= l) goto end 

		j reverse          # goto reverse

	end:
		lw $ra, 16($sp)    # $ra widerherstellen 
		lw $s0, 12($sp)    # $s0 (i) widerherstellen
		lw $s1, 8($sp)     # $s1 (j) widerherstellen
		lw $s2, 4($sp)     # $s2 (k) widerherstellen
		lw $s3, 0($sp)     # $s3 (l) widerherstellen

		addi $sp, $sp, 20  # Stackpointer wiederherstellen

	jr $ra          # Rueckkehr zum Aufrufer
