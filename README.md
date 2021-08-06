# C and Assembly Comparison
Assembly language is a low-level programing language.  
C language is lower level than most programming languages.  
That's why I am comparing these two languages.  
  
  
First of all, register and memory architecture must know to understand assembly language.

Registers are data holders and their size changes due to the processor architecture. They can be 32 bit or 64 bit.  
there are different types of registers (e.g., EAX, EBX, EBP, ESI, EIP, etc.)  

Memory is data storage hardware that is directly accessible by a processor. Its size depends on RAM or Hard Drive.
  
  
Assembly language has 2 syntaxes; Intel's and AT&T's syntax.

AT&T's syntax
```asm
 	movl   $0x0,%ecx
 	movb   %bl,%al
```
Intel's syntax
```asm
 	mov    ecx,0x0
 	mov    al,bl
```	
Both syntaxes do the same job. But their image is different.  
 - AT&T has prefixes the register with % and immediate data with $.
   Intel has not.
 - AT&T adds a suffix to the instruction to indicate operation width.For
   example, movl(long), movb(byte), etc.
 - AT&T put the source operand before the destination. Intel put these
   reverse.
   
In that write, I use Intel syntax.
  
  
When I want to compare C to Assembly code, first I wrote the C code, then I compile it to a binary.  
Finally, disassemble the binary file.  
```bash
	gcc the_c_code.c -o the_binary
	objdump -M intel -d the_binary
```


## Examples
Let start the comparison with basic examples;


#### Variable Set (MOV)  
I want 2 variables, are var_a and var_b. var_a variable set to 0 and the var_b set to 1.  
Then the var_b is equalized to var_a.  

###### the C Code;
```c
	int main() {
		int var_a = 0;
		int var_b = 1;
		var_b = var_a;
	}
```
###### the Assembly Code's part;
```asm
	0000000000001129 <main>:
	    1129:	f3 0f 1e fa          	endbr64 
	    112d:	55                   	push   rbp
	    112e:	48 89 e5             	mov    rbp,rsp
	    1131:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
	    1138:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
	    113f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
	    1142:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	    1145:	b8 00 00 00 00       	mov    eax,0x0
	    114a:	5d                   	pop    rbp
	    114b:	c3                   	ret    
	    114c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
```


The First 3 lines (1129, 112d, 112e) are indicating the main function.

Next line, 0 value as hex (0x0) setted to the [rdp-0x8]. So lets say [rbp-0x8] is the var_a. `{mov    DWORD PTR [rbp-0x8],0x0}`  
Same situation for the var_b. [rbp-0x4] and the var_b are the same variables.

Then comes the var_b will equalize to the var_a.  
[rdp-0x8]'s value moved to EAX, then EAX value setted to [rdp-0x4]. EAX is used as a transfer gate.

Finally, the main function closed on the other lines.



#### Addition/Subtraction (ADD/SUB)
When two variables come for arithmetical calculation, they need operants named as ADD and SUB.

###### the C code;
```c
	int var_a = 2;
	var_a = var_a + 1;
	var_a = var_a - 3;
	
	int var_b;
	var_b = var_a + 4;
```

###### the Assembly Code;
```asm
	    1131:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
	    1138:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
	    113c:	83 6d f8 03          	sub    DWORD PTR [rbp-0x8],0x3
	    
	    1140:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
	    1143:	83 c0 04             	add    eax,0x4
	    1146:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
```


In the first line, we see the var_a defined as [rbp-0x8] and valued at 2.  
Then added 1 to the value of [rbp-0x8].  
After that, subtract 3 from the value of [rbp-0x8].  

In the second part, the value of var_a and 4 are combined and set to var_b.  
the value of [rbp-0x8] transported to EAX because we don't want to change it.  
Then added 4 to EAX's value.  
Last the value of EAX is set to [rbp-0x4].  



#### Conditions (CMP/JMP/...)
When 2 or more values will comparing between each other, we see CMP and types of jump (JMP, JE, JNE, JG, JGE, JL, JLE).  

###### the C Code;
```c
	int main() {
	    int var_a = 2;
	    int var_b;
	
	    if  (var_a == 3) {var_b = 4;}
	    else {var_b = 5;}
	}
```


###### the Assembly Code;
```asm
	0000000000001129 <main>:
	    ...
	    1131:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
	    1138:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
	    113c:	75 09                	jne    1147 <main+0x1e>
	    113e:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
	    1145:	eb 07                	jmp    114e <main+0x25>
	    1147:	c7 45 fc 05 00 00 00 	mov    DWORD PTR [rbp-0x4],0x5
```


Again the var_a is [rbp-0x8] and var_b is [rbp-0x4].  
In the second line code compares the value of [rbp-0x8] and 3, then decide a flag (e.g. equal, not equal, great, less equal, etc.)  
If the flag is "not equal" then jump the 1147 numbered line. If not, continue.  
At the fifth line, when [rbp-0x4] set to 4 jump to the 114e numbered line.  

With this information, we can do different algorithms.  
For example:

#### While Loop
###### the C Code;
```c
	int main() {
		int x = 2;	
		while (x < 6) {x++;}
	}
```
###### the Assembly Code;
```asm
	    1131:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [rbp-0x4],0x2
	    1138:	eb 04                	jmp    113e <main+0x15>
	    113a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
	    113e:	83 7d fc 05          	cmp    DWORD PTR [rbp-0x4],0x5
	    1142:	7e f6                	jle    113a <main+0x11>
```

#### Infinite Loop

###### the C Code;
```c
	int main() {
		int z = 2;
		while (1 == 1) {z++;}
	}
```
###### the Assembly Code; 
```asm
	    116f:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [rbp-0x4],0x2
	    1176:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
	    117a:	eb fa                	jmp    1176 <main+0xf>
	    
```
#### For Loop

###### the C Code;
```c
	int main() {
	  int i;
	  int y;
	  for (i = 1; i < 11; ++i) {y++;}
	}
```
###### the Assembly Code;
```asm
	    1131:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
	    1138:	eb 08                	jmp    1142 <main+0x19>
	    113a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
	    113e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
	    1142:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
	    1146:	7e f2                	jle    113a <main+0x11>
```

#### Function Call From Library

In C if you use the printf function from the stdio.h, just include the library and call the function.  
But how is work in assembly?

###### the C Code;
```c
	#inclue <stdio.h>
	int main() {
		printf("Test");
	}
```
###### Part of the Assembly Code;
```asm
	    1151:	48 8d 3d ac 0e 00 00 	lea    rdi,[rip+0xeac]        # 2004 <_IO_stdin_used+0x4>
	    1158:	b8 00 00 00 00       	mov    eax,0x0
	    115d:	e8 ee fe ff ff       	call   1050 <printf@plt>
	    1162:	b8 00 00 00 00       	mov    eax,0x0
```
###### the Called Part;
```asm
	0000000000001050 <printf@plt>:
	    1050:	f3 0f 1e fa          	endbr64 
	    1054:	f2 ff 25 75 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f75]        # 3fd0 <printf@GLIBC_2.2.5>
	    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
```

Thanks for reading, have a nice reverses.
