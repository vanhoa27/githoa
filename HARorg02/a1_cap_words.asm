	#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
	#+ ------------------------------------------
.data
str_info1: .asciiz "test_string: \""
str_info2: .asciiz "\"\nRueckgabewert cap_words(test_string): "

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

main:
	li $v0, SYS_PUTSTR
	la $a0, str_info1
	syscall

	li $v0, SYS_PUTSTR
	la $a0, test_string
	syscall

	li $v0, SYS_PUTSTR
	la $a0, str_info2
	syscall

	move $v0, $zero
	la $a0, test_string
	jal cap_words

	move $a0, $v0
	li $v0, SYS_PUTINT 
	syscall

	li $v0, SYS_EXIT
	syscall


	#+ BITTE VERVOLLSTAENDIGEN: Persoenliche Angaben zur Hausaufgabe 
	#+ -------------------------------------------------------------

	# Vorname: Van Hoa
	# Nachname: Nguyen 
	# Matrikelnummer: 483979
	
	#+ Loesungsabschnitt
	#+ -----------------
	
.data

# test_string: .asciiz "Nur aNfangsbuchstaben ZAEhlen als gROss geschrieben" 

# test_string: .asciiz "hier sind nur Substantive gross: Affe, Banane, Clown, denken"
# test_string: .asciiz "eins 1, Zwei 2, Drei 3, A, B, C"
# test_string: .asciiz "Kurz Aber VIELE as: Aa A Aa A AaaaAa"
# test_string: .asciiz "eIn bUchstAbE GrOss rEIcht nIcht;"

.text

# $a0: string[]
# $s0: cap_count
# $s1: i

cap_words:
	addi $sp, $sp, -8     # mache platz fuer 2 worte auf stack 
	sw $s0, 0($sp)        # sichere $s0 (cap_count) auf stack
	sw $s1, 4($sp)        # sichere $s1 (i) auf stack

	addi $s0, $zero, 0    # cap_count = 0
	addi $s1, $zero, 0    # i = 0

while:
	lb $t0, 0($a0)            # $t0 = string[i] 
	beq $t0, $zero, endwhile  # if (string[i] == '\0'), goto endwhile

	beq $s1, $zero, if    # if (i == 0), goto if
	lb $t1, -1($a0)       # lade string[i-1] 
	bne $t1, ' ', else    # if (string[i-1] != ' '), goto else 

if:	
	blt  $t0, 'A', else_if # if (string[i] < 'Z'), goto else_if
	bgt  $t0, 'Z', else_if # if (string[i] > 'A'), goto else_if
	addi $s0, $s0, 1      # increment cap_count

	j next                # goto next iteration

else_if:
	bge $t0, 'A' next     # if (string[i] >= 'Z'), goto next
	blt $t0, 'Z' next     # if (string[i] < 'A'), goto next
	addi $s0, $s0, 1      # increment cap_count

	j next                # goto next iteration

else:
	j next                # goto next iteration

next:
	addi $a0, $a0, 1      # string pointer inkrementieren 
	addi $s1, $s1, 1      # i++ 
	j while               # goto while

endwhile:
	add $v0, $s0, $zero   # return cap_count
	lw $s0, 0($sp)        # cap_count ($s0) widerherstellen 
	lw $s1, 4($sp)        # i ($s1) widerherstellen
	addi $sp, $sp, 8      # stackpointer wiederherstellen 
	jr $ra                # Ruecksprung zu main 
