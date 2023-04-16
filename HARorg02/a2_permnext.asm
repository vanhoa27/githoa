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
	# Matrikelnummer: 0483979
	
	#+ Loesungsabschnitt
	#+ -----------------

.data

test_perm_length: .word 4
test_perm: .byte 0, 1, 2, 3

.text

permnext:
<<<<<<< HEAD
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
=======
	addi $sp, $sp, -28   # Reserviere Platz auf den Stack
	
	sw   $ra, 24($sp)    # sichere $ra (Rueckkehraddesse) auf dem Stack
	sw   $s0, 20($sp)    # sichere $s0 (i) auf dem Stack
	sw   $s1, 16($sp)    # sichere $s1 (j) auf dem Stack
	sw   $s2, 12($sp)    # sichere $s2 (k) auf dem Stack
	sw   $s3, 8($sp)     # sichere $s3 (l) auf dem Stack 
	sw   $s4, 4($sp)     # sichere $s4 (perm) auf dem Stack
	sw   $s5, 0($sp)     # sichere $s5 (length) auf dem Stack
	
	addi $s4, $a0, 0     # $s4 = perm
	addi $s5, $a1, 0     # $s5 = length
	
	addi $s2, $s5, -2    # k = length - 2
	addi $s3, $s5, -1    # l = length - 1
	
	# Schritt 1: Finde groesste k sodass perm[k] < perm[k + 1]
	while_1:
		addi $t0, $s2, 0        # $t0 = k

		add  $t0, $t0, $a0      # $t0 = &perm[k]
		
		lb $t2, 0($t0)          # $t2 = permk[k]
		lb $t3, 1($t0)          # $t3 = permk[k + 1]
		
		blt $t2, $t3, endwhile_1  # if (perm[k] < perm[k + 1]) goto endwhile_1
		
		addi $s2, $s2, -1       # k--
		
		j while_1               # goto while_1
		
	endwhile_1: 
		blt $s2, $zero, return_0   # if (k < 0) goto end
		
	# Schirtte 2: Finde das groesste l sodass perm[k] < perm[l]
	while_2:
		addi $t0, $s2, 0    # $t0 = k
		addi $t1, $s3, 0    # $t1 = l
		
		add  $t0, $t0, $a0  # $t0 = &perm[k]
		add  $t1, $t1, $a0  # $t1 = &perm[l]
		
		lb  $t2, 0($t0)    # $t2 = permk[k]
		lb  $t3, 0($t1)    # $t3 = perm[l]
		
		blt  $t2, $t3, endwhile_2  # if (perm[k] < perm[l]) goto endwhile_2
		
		addi $s3, $s3, -1   # l--
		
		j while_2           # goto while_2
	
	endwhile_2:
		
	# Schritt 3: Vertausche perm[k] und perm[l]
	add $a0, $zero, $s4    # $a0 = perm
	add $a1, $zero, $s2    # $a1 = k
	add $a2, $zero, $s3    # $a2 = l
	
	jal swap
		
	# Schritt 4: Drehe die Reihenfolge perm[k + 1] bis perm[length - 1] um
	addi $s0, $s2, 1         # i = k + 1
	addi $s1, $s5, -1        # j = length - 1
	reverse:
		bge $s0, $s1, return_1  # if (i >= j) goto end
		
		add $a0, $zero, $s4  # $a0 = perm
		add $a1, $zero, $s0  # $a1 = i
		add $a2, $zero, $s1  # $a2 = j
		
		jal swap
		
		addi $s0, $s0, 1     # i++
		addi $s1, $s1, -1    # j--
		
		j reverse
			
	return_0:
	 	addi $v0, $zero, 0   # return 0 
	 	j end

	return_1:
	 	addi $v0, $zero, 1   # return 1
	 	j end
		
	end:
	
	lw   $ra, 24($sp)   # $ra (Rueckkehraddresse) widerherstellen
	lw   $s0, 20($sp)   # $s0 (i) widerherstellen
	lw   $s1, 16($sp)   # $s1 (j) widerherstellen
	lw   $s2, 12($sp)   # $s2 (k) widerherstellen
	lw   $s3, 8($sp)    # $s3 (l) widerherstellen
	lw   $s4, 4($sp)    # $s4 (perm) widerherstellen
	lw   $s5, 0($sp)    # $s5 (length) widerherstellen
	
	addi $sp, $sp, 28   # stackpointer widerherstellen
	
	jr $ra              # Ruckkehr zum Aufrufer 

>>>>>>> 7f286bdecc5fc450283882f3f736966c2e388452
