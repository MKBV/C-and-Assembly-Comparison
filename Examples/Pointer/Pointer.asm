
Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   QWORD PTR [rip+0x2f92]        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f93]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <.plt>
    104f:	90                   	nop

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9d]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001060 <__stack_chk_fail@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    106b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001070 <printf@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 55 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f55]        # 3fd0 <printf@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001080 <_start>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	31 ed                	xor    ebp,ebp
    1086:	49 89 d1             	mov    r9,rdx
    1089:	5e                   	pop    rsi
    108a:	48 89 e2             	mov    rdx,rsp
    108d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1091:	50                   	push   rax
    1092:	54                   	push   rsp
    1093:	4c 8d 05 a6 01 00 00 	lea    r8,[rip+0x1a6]        # 1240 <__libc_csu_fini>
    109a:	48 8d 0d 2f 01 00 00 	lea    rcx,[rip+0x12f]        # 11d0 <__libc_csu_init>
    10a1:	48 8d 3d c1 00 00 00 	lea    rdi,[rip+0xc1]        # 1169 <main>
    10a8:	ff 15 32 2f 00 00    	call   QWORD PTR [rip+0x2f32]        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    10ae:	f4                   	hlt    
    10af:	90                   	nop

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 59 2f 00 00 	lea    rdi,[rip+0x2f59]        # 4010 <__TMC_END__>
    10b7:	48 8d 05 52 2f 00 00 	lea    rax,[rip+0x2f52]        # 4010 <__TMC_END__>
    10be:	48 39 f8             	cmp    rax,rdi
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 0e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f0e]        # 3fd8 <_ITM_deregisterTMCloneTable>
    10ca:	48 85 c0             	test   rax,rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    rax
    10d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10d8:	c3                   	ret    
    10d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 29 2f 00 00 	lea    rdi,[rip+0x2f29]        # 4010 <__TMC_END__>
    10e7:	48 8d 35 22 2f 00 00 	lea    rsi,[rip+0x2f22]        # 4010 <__TMC_END__>
    10ee:	48 29 fe             	sub    rsi,rdi
    10f1:	48 89 f0             	mov    rax,rsi
    10f4:	48 c1 ee 3f          	shr    rsi,0x3f
    10f8:	48 c1 f8 03          	sar    rax,0x3
    10fc:	48 01 c6             	add    rsi,rax
    10ff:	48 d1 fe             	sar    rsi,1
    1102:	74 14                	je     1118 <register_tm_clones+0x38>
    1104:	48 8b 05 e5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ee5]        # 3ff0 <_ITM_registerTMCloneTable>
    110b:	48 85 c0             	test   rax,rax
    110e:	74 08                	je     1118 <register_tm_clones+0x38>
    1110:	ff e0                	jmp    rax
    1112:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001120 <__do_global_dtors_aux>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	80 3d e5 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ee5],0x0        # 4010 <__TMC_END__>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   rbp
    112e:	48 83 3d c2 2e 00 00 	cmp    QWORD PTR [rip+0x2ec2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1135:	00 
    1136:	48 89 e5             	mov    rbp,rsp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d c6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ec6]        # 4008 <__dso_handle>
    1142:	e8 09 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 bd 2e 00 00 01 	mov    BYTE PTR [rip+0x2ebd],0x1        # 4010 <__TMC_END__>
    1153:	5d                   	pop    rbp
    1154:	c3                   	ret    
    1155:	0f 1f 00             	nop    DWORD PTR [rax]
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <main>:
    1169:	f3 0f 1e fa          	endbr64 
    116d:	55                   	push   rbp
    116e:	48 89 e5             	mov    rbp,rsp
    1171:	48 83 ec 20          	sub    rsp,0x20
    1175:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    117c:	00 00 
    117e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1182:	31 c0                	xor    eax,eax
    1184:	c7 45 ec 03 00 00 00 	mov    DWORD PTR [rbp-0x14],0x3
    118b:	48 8d 45 ec          	lea    rax,[rbp-0x14]
    118f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1193:	c7 45 ec 04 00 00 00 	mov    DWORD PTR [rbp-0x14],0x4
    119a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    119e:	8b 00                	mov    eax,DWORD PTR [rax]
    11a0:	89 c6                	mov    esi,eax
    11a2:	48 8d 3d 5b 0e 00 00 	lea    rdi,[rip+0xe5b]        # 2004 <_IO_stdin_used+0x4>
    11a9:	b8 00 00 00 00       	mov    eax,0x0
    11ae:	e8 bd fe ff ff       	call   1070 <printf@plt>
    11b3:	b8 00 00 00 00       	mov    eax,0x0
    11b8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    11bc:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
    11c3:	00 00 
    11c5:	74 05                	je     11cc <main+0x63>
    11c7:	e8 94 fe ff ff       	call   1060 <__stack_chk_fail@plt>
    11cc:	c9                   	leave  
    11cd:	c3                   	ret    
    11ce:	66 90                	xchg   ax,ax

00000000000011d0 <__libc_csu_init>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	41 57                	push   r15
    11d6:	4c 8d 3d d3 2b 00 00 	lea    r15,[rip+0x2bd3]        # 3db0 <__frame_dummy_init_array_entry>
    11dd:	41 56                	push   r14
    11df:	49 89 d6             	mov    r14,rdx
    11e2:	41 55                	push   r13
    11e4:	49 89 f5             	mov    r13,rsi
    11e7:	41 54                	push   r12
    11e9:	41 89 fc             	mov    r12d,edi
    11ec:	55                   	push   rbp
    11ed:	48 8d 2d c4 2b 00 00 	lea    rbp,[rip+0x2bc4]        # 3db8 <__do_global_dtors_aux_fini_array_entry>
    11f4:	53                   	push   rbx
    11f5:	4c 29 fd             	sub    rbp,r15
    11f8:	48 83 ec 08          	sub    rsp,0x8
    11fc:	e8 ff fd ff ff       	call   1000 <_init>
    1201:	48 c1 fd 03          	sar    rbp,0x3
    1205:	74 1f                	je     1226 <__libc_csu_init+0x56>
    1207:	31 db                	xor    ebx,ebx
    1209:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1210:	4c 89 f2             	mov    rdx,r14
    1213:	4c 89 ee             	mov    rsi,r13
    1216:	44 89 e7             	mov    edi,r12d
    1219:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    121d:	48 83 c3 01          	add    rbx,0x1
    1221:	48 39 dd             	cmp    rbp,rbx
    1224:	75 ea                	jne    1210 <__libc_csu_init+0x40>
    1226:	48 83 c4 08          	add    rsp,0x8
    122a:	5b                   	pop    rbx
    122b:	5d                   	pop    rbp
    122c:	41 5c                	pop    r12
    122e:	41 5d                	pop    r13
    1230:	41 5e                	pop    r14
    1232:	41 5f                	pop    r15
    1234:	c3                   	ret    
    1235:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    123c:	00 00 00 00 

0000000000001240 <__libc_csu_fini>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	c3                   	ret    

Disassembly of section .fini:

0000000000001248 <_fini>:
    1248:	f3 0f 1e fa          	endbr64 
    124c:	48 83 ec 08          	sub    rsp,0x8
    1250:	48 83 c4 08          	add    rsp,0x8
    1254:	c3                   	ret    
