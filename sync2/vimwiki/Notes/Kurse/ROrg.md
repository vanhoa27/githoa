<!--toc:start-->
- [Mips Basic Operations](#mips-basic-operations)
<!--toc:end-->

## Digitalentwurf

### Minimierung und Multiplexer
- Reduzierung Gatter
- wichtiger Kostenfaktor
- Verbindungsleitungen, Energiebetrachtungen wichtig

Karnaugh-Veitch-Diagram



## Mips Basic Operations

Here are some basic operations in MIPS assembly that you can use to perform
different tasks:

- Arithmetic operations: 
    - `add` - adds two registers together and stores the result in a third
      register.
    - `sub` - subtracts two registers and stores the result in a third
      register.
    - `addi` - adds an immediate value to a register.
    - `subi` - subtracts an immediate value from a register.
    - `mul` - multiplies two registers together and stores the result in a
      third register.
    - `div` - divides two registers and stores the result in a third register.
    - `and` - performs a bit-wise AND operation on two registers and stores the
      result in a third register.
    - `or` - performs a bit-wise OR operation on two registers and stores the
      result in a third register.
    - `xor` - performs a bit-wise XOR operation on two registers and stores the
      result in a third register.
    - `slt` - sets the value of a register to 1 if one register is less than
      another, and 0 otherwise.
    - `slti` - sets the value of a register to 1 if a register is less than an
      immediate value, and 0 otherwise.

- Data transfer operations:
    - `lw` - loads a word (4 bytes) from memory into a register.
    - `sw` - stores a word from a register into memory.
    - `lbu` - loads an unsigned byte from memory into a register.
    - `sb` - stores a byte from a register into memory.
    - `lb` - loads a signed byte from memory into a register.
    - `lh` - loads a half-word (2 bytes) from memory into a register.
    - `sh` - stores a half-word from a register into memory.
    - `lui` - loads an immediate value into the upper half of a register.

- Control flow operations:
    - `j` - jumps to a specified address.
    - `jal` - jumps to a specified address and saves the return address in the
      $ra register.
    - `jr` - jumps to the address stored in a register.
    - `beq` - branches to a specified address if two registers are equal.
    - `bne` - branches to a specified address if two registers are not equal.
    - `bgtz` - branches to a specified address if a register is greater than
      zero.
    - `blez` - branches to a specified address if a register is less than or
      equal to zero.
    - `bgez` - branches to a specified address if a register is greater than or
      equal to zero.
    - `bltz` - branches to a specified address if a register is less than zero.
    - `syscall` - triggers a specific system call.

These are some of the basic operations that you can use in MIPS assembly. Keep
in mind that assembly programming is a low-level programming language and has a
steep learning

