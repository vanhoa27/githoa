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

.eqv SYS_PUTSTR 4                #const define syscall ($v0)
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

        move $s0, $zero         #int i=0
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

        # Vorname: Amir Ali
        # Nachname: Farshad
        # Matrikelnummer: 388302
        
        #+ Loesungsabschnitt
        #+ -----------------

.data

test_perm_length: .word 4
test_perm: .byte 0, 1, 2, 3

.text
permnext:
    # Reserviere Speicher auf dem Stack
    addi $sp, $sp, -28 # Stackpointer um 24 verringern

    sw $ra, 0($sp) # Rückgabewert in Stack speichern
    sw $s0, 4($sp) # s0 (k) im Stack speichern
    sw $s1, 8($sp) # s1 (l) im Stack speichern
    sw $s2, 12($sp) # s2 (i) im Stack speichern
    sw $s3, 16($sp) # s3 (j) im Stack speichern
    sw $s4, 20($sp) # s4 (perm) im Stack speichern
    sw $s5, 24($sp) # s5 (length) im Stack speichern
    
    move $s5, $a1     # $s5 = length
    move $s4, $a0     # s4 = perm
    addi $s0, $zero, -1 # k = -1
    
    add $s2, $zero, $zero  # i = 0
    addi $t2, $a1, -1   # n = length - 1
    
    # Schritt 1
    for:
    	bge $s2, $t2, endfor
    	
    	addi $t0, $s2, 0    # $t0 = i
    	
    	add $t0, $t0, $a0      # $t0 = &perm[i]
    	
    	lbu $t4, 0($t0)   # $t4 = perm[i]
    	lbu $t5, 1($t0)   # $t5 = perm[i+1]
    	
    	blt $t4, $t5, if  # if perm[i] < perm[i+1]
    	addi $s2, $s2, 1     # i++
    	
    	j for
    	
    if:
    	move $s0, $s2 # k = i
    	addi $s2, $s2, 1 # i++
    	j for
    	
    endfor:
    	addi $t0, $zero, -1
    	beq $s0, $t0, back_0  # if k < 0, goto back_0


    # Schritt 2
    addi $s1, $s0, 1   # l = k + 1
    
    addi $s2, $s0, 2   # i = k + 2
    
    for2:
    	bge $s2, $a1, endfor2 # if i >= length, goto enfor2
    	
    	# arrays laden
    	add $t1, $a0, $s2   # $t1 = &perm[i]
    	add $t2, $a0, $s0   # $t2 = &perm[k]
    	add $t3, $a0, $s1   # $t3 = &perm[l]
    	
    	lbu $t4, 0($t1)    # $t4 = perm[i]
    	lbu $t5, 0($t2)    # $t5 = perm[k]
    	lbu $t6, 0($t3)    # $t6 = perm[l]
    	
    	bgt $t4, $t5, bedingung # if perm[i] > perm[k], goto bedingung_1
    next:
    	addi $s2, $s2, 1      # i++
    	j for2	
    
    bedingung:
    	blt $t4, $t6, if2 # if perm[i] < perm[l], goto if2
    	j next
    	
    if2:
		move $s1, $s2  # l = i
    	j for2
    
    endfor2:
    	
    # Schritt 3
    add $a0, $s4, $zero # $a0 = perm
    add $a1, $s0, $zero # $a1 = k
    add $a2, $s1, $zero # $a2 = l
    
    jal swap
		
    # Schritt 4
    addi $s2, $s0, 1  # i = k + 1
    addi $s3, $s5, -1 # j = length - 1
    
    while:
    	bge $s2, $s3, endwhile  # if i >= j, goto endwhile
    	
    	add $a0, $s4, $zero # $a0 = perm
    	add $a1, $s2, $zero # $a1 = i
    	add $a2, $s3, $zero # $a2 = j
    	
    	jal swap
    	
    	addi $s2, $s2, 1   # i++
    	addi $s3, $s3, -1  # j--
    	
    	j while
    
    endwhile:
    
    j back_1
    
    back_0:
    	li $v0, 0  # Rueckgabe 0
    	j end_permnext
    
    back_1:
    	li $v0, 1   # Rueckgabe 1
    	j end_permnext
    	
end_permnext:

    lw $ra, 0($sp) 
    lw $s0, 4($sp) 
    lw $s1, 8($sp) 
    lw $s2, 12($sp)
    lw $s3, 16($sp)
    lw $s4, 20($sp)
    lw $s5, 24($sp)
    
    addi $sp, $sp, 28

	jr $ra
