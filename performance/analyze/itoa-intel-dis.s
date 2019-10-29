
printInt-customc:     file format elf64-x86-64


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
    1020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmp    QWORD PTR [rip+0x2fe4]        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <__stack_chk_fail@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    QWORD PTR [rip+0x2fe2]        # 4018 <__stack_chk_fail@GLIBC_2.4>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <.plt>

0000000000001040 <printf@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    QWORD PTR [rip+0x2fda]        # 4020 <printf@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <.plt>

Disassembly of section .text:

0000000000001050 <_start>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	31 ed                	xor    ebp,ebp
    1056:	49 89 d1             	mov    r9,rdx
    1059:	5e                   	pop    rsi
    105a:	48 89 e2             	mov    rdx,rsp
    105d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1061:	50                   	push   rax
    1062:	54                   	push   rsp
    1063:	4c 8d 05 46 03 00 00 	lea    r8,[rip+0x346]        # 13b0 <__libc_csu_fini>
    106a:	48 8d 0d cf 02 00 00 	lea    rcx,[rip+0x2cf]        # 1340 <__libc_csu_init>
    1071:	48 8d 3d 68 01 00 00 	lea    rdi,[rip+0x168]        # 11e0 <main>
    1078:	ff 15 62 2f 00 00    	call   QWORD PTR [rip+0x2f62]        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    107e:	f4                   	hlt    
    107f:	90                   	nop

0000000000001080 <deregister_tm_clones>:
    1080:	48 8d 3d b1 2f 00 00 	lea    rdi,[rip+0x2fb1]        # 4038 <__TMC_END__>
    1087:	48 8d 05 aa 2f 00 00 	lea    rax,[rip+0x2faa]        # 4038 <__TMC_END__>
    108e:	48 39 f8             	cmp    rax,rdi
    1091:	74 15                	je     10a8 <deregister_tm_clones+0x28>
    1093:	48 8b 05 3e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f3e]        # 3fd8 <_ITM_deregisterTMCloneTable>
    109a:	48 85 c0             	test   rax,rax
    109d:	74 09                	je     10a8 <deregister_tm_clones+0x28>
    109f:	ff e0                	jmp    rax
    10a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10a8:	c3                   	ret    
    10a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010b0 <register_tm_clones>:
    10b0:	48 8d 3d 81 2f 00 00 	lea    rdi,[rip+0x2f81]        # 4038 <__TMC_END__>
    10b7:	48 8d 35 7a 2f 00 00 	lea    rsi,[rip+0x2f7a]        # 4038 <__TMC_END__>
    10be:	48 29 fe             	sub    rsi,rdi
    10c1:	48 89 f0             	mov    rax,rsi
    10c4:	48 c1 ee 3f          	shr    rsi,0x3f
    10c8:	48 c1 f8 03          	sar    rax,0x3
    10cc:	48 01 c6             	add    rsi,rax
    10cf:	48 d1 fe             	sar    rsi,1
    10d2:	74 14                	je     10e8 <register_tm_clones+0x38>
    10d4:	48 8b 05 15 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f15]        # 3ff0 <_ITM_registerTMCloneTable>
    10db:	48 85 c0             	test   rax,rax
    10de:	74 08                	je     10e8 <register_tm_clones+0x38>
    10e0:	ff e0                	jmp    rax
    10e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10e8:	c3                   	ret    
    10e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010f0 <__do_global_dtors_aux>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	80 3d 3d 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f3d],0x0        # 4038 <__TMC_END__>
    10fb:	75 33                	jne    1130 <__do_global_dtors_aux+0x40>
    10fd:	55                   	push   rbp
    10fe:	48 83 3d f2 2e 00 00 	cmp    QWORD PTR [rip+0x2ef2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1105:	00 
    1106:	48 89 e5             	mov    rbp,rsp
    1109:	74 0d                	je     1118 <__do_global_dtors_aux+0x28>
    110b:	48 8b 3d 1e 2f 00 00 	mov    rdi,QWORD PTR [rip+0x2f1e]        # 4030 <__dso_handle>
    1112:	ff 15 e0 2e 00 00    	call   QWORD PTR [rip+0x2ee0]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1118:	e8 63 ff ff ff       	call   1080 <deregister_tm_clones>
    111d:	c6 05 14 2f 00 00 01 	mov    BYTE PTR [rip+0x2f14],0x1        # 4038 <__TMC_END__>
    1124:	5d                   	pop    rbp
    1125:	c3                   	ret    
    1126:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    112d:	00 00 00 
    1130:	c3                   	ret    
    1131:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1138:	00 00 00 00 
    113c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001140 <frame_dummy>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	e9 67 ff ff ff       	jmp    10b0 <register_tm_clones>
    1149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001150 <itoa>:
    1150:	48 85 ff             	test   rdi,rdi
    1153:	79 09                	jns    115e <itoa+0xe>
    1155:	c6 06 2d             	mov    BYTE PTR [rsi],0x2d
    1158:	48 ff c6             	inc    rsi
    115b:	48 f7 df             	neg    rdi
    115e:	48 ff ce             	dec    rsi
    1161:	49 b8 67 66 66 66 66 	movabs r8,0x6666666666666667
    1168:	66 66 66 
    116b:	48 89 f9             	mov    rcx,rdi
    116e:	66 90                	xchg   ax,ax
    1170:	48 89 c8             	mov    rax,rcx
    1173:	49 f7 e8             	imul   r8
    1176:	48 89 d0             	mov    rax,rdx
    1179:	48 c1 e8 3f          	shr    rax,0x3f
    117d:	48 c1 fa 02          	sar    rdx,0x2
    1181:	48 01 c2             	add    rdx,rax
    1184:	48 83 c1 09          	add    rcx,0x9
    1188:	48 ff c6             	inc    rsi
    118b:	48 83 f9 12          	cmp    rcx,0x12
    118f:	48 89 d1             	mov    rcx,rdx
    1192:	77 dc                	ja     1170 <itoa+0x20>
    1194:	c6 46 01 00          	mov    BYTE PTR [rsi+0x1],0x0
    1198:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    119f:	00 
    11a0:	48 89 f8             	mov    rax,rdi
    11a3:	49 f7 e8             	imul   r8
    11a6:	48 89 d0             	mov    rax,rdx
    11a9:	48 c1 e8 3f          	shr    rax,0x3f
    11ad:	48 c1 fa 02          	sar    rdx,0x2
    11b1:	48 01 c2             	add    rdx,rax
    11b4:	8d 04 12             	lea    eax,[rdx+rdx*1]
    11b7:	8d 04 80             	lea    eax,[rax+rax*4]
    11ba:	89 f9                	mov    ecx,edi
    11bc:	29 c1                	sub    ecx,eax
    11be:	80 c1 30             	add    cl,0x30
    11c1:	88 0e                	mov    BYTE PTR [rsi],cl
    11c3:	48 83 c7 09          	add    rdi,0x9
    11c7:	48 ff ce             	dec    rsi
    11ca:	48 83 ff 12          	cmp    rdi,0x12
    11ce:	48 89 d7             	mov    rdi,rdx
    11d1:	77 cd                	ja     11a0 <itoa+0x50>
    11d3:	c3                   	ret    
    11d4:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    11db:	00 00 00 
    11de:	66 90                	xchg   ax,ax

00000000000011e0 <main>:
    11e0:	55                   	push   rbp
    11e1:	41 57                	push   r15
    11e3:	41 56                	push   r14
    11e5:	41 54                	push   r12
    11e7:	53                   	push   rbx
    11e8:	48 83 ec 20          	sub    rsp,0x20
    11ec:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    11f3:	00 00 
    11f5:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
    11fa:	45 31 c9             	xor    r9d,r9d
    11fd:	4c 8d 54 24 11       	lea    r10,[rsp+0x11]
    1202:	49 bb 15 5f d0 ac 4b 	movabs r11,0x1b69b4bacd05f15
    1209:	9b b6 01 
    120c:	49 bc 67 66 66 66 66 	movabs r12,0x6666666666666667
    1213:	66 66 66 
    1216:	49 be 0b d7 a3 70 3d 	movabs r14,0xa3d70a3d70a3d70b
    121d:	0a d7 a3 
    1220:	49 bf cf f7 53 e3 a5 	movabs r15,0x20c49ba5e353f7cf
    1227:	9b c4 20 
    122a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1230:	c6 44 24 12 00       	mov    BYTE PTR [rsp+0x12],0x0
    1235:	4c 89 d3             	mov    rbx,r10
    1238:	4c 89 d9             	mov    rcx,r11
    123b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1240:	48 89 c8             	mov    rax,rcx
    1243:	49 f7 ec             	imul   r12
    1246:	48 89 d6             	mov    rsi,rdx
    1249:	48 89 d0             	mov    rax,rdx
    124c:	48 c1 e8 3f          	shr    rax,0x3f
    1250:	48 c1 fe 02          	sar    rsi,0x2
    1254:	48 01 c6             	add    rsi,rax
    1257:	44 8d 04 36          	lea    r8d,[rsi+rsi*1]
    125b:	48 89 f0             	mov    rax,rsi
    125e:	49 f7 ec             	imul   r12
    1261:	48 89 d7             	mov    rdi,rdx
    1264:	43 8d 2c 80          	lea    ebp,[r8+r8*4]
    1268:	48 89 c8             	mov    rax,rcx
    126b:	49 f7 ee             	imul   r14
    126e:	49 89 d0             	mov    r8,rdx
    1271:	49 01 c8             	add    r8,rcx
    1274:	89 c8                	mov    eax,ecx
    1276:	29 e8                	sub    eax,ebp
    1278:	04 30                	add    al,0x30
    127a:	88 03                	mov    BYTE PTR [rbx],al
    127c:	48 89 f8             	mov    rax,rdi
    127f:	48 c1 e8 3f          	shr    rax,0x3f
    1283:	c1 ef 02             	shr    edi,0x2
    1286:	01 c7                	add    edi,eax
    1288:	01 ff                	add    edi,edi
    128a:	8d 04 bf             	lea    eax,[rdi+rdi*4]
    128d:	29 c6                	sub    esi,eax
    128f:	40 80 c6 30          	add    sil,0x30
    1293:	40 88 73 ff          	mov    BYTE PTR [rbx-0x1],sil
    1297:	4c 89 c7             	mov    rdi,r8
    129a:	48 c1 ef 3f          	shr    rdi,0x3f
    129e:	49 c1 f8 06          	sar    r8,0x6
    12a2:	49 8d 34 38          	lea    rsi,[r8+rdi*1]
    12a6:	48 89 f0             	mov    rax,rsi
    12a9:	49 f7 ec             	imul   r12
    12ac:	48 89 d0             	mov    rax,rdx
    12af:	48 c1 e8 3f          	shr    rax,0x3f
    12b3:	c1 ea 02             	shr    edx,0x2
    12b6:	01 c2                	add    edx,eax
    12b8:	01 d2                	add    edx,edx
    12ba:	8d 04 92             	lea    eax,[rdx+rdx*4]
    12bd:	29 c6                	sub    esi,eax
    12bf:	40 80 c6 30          	add    sil,0x30
    12c3:	40 88 73 fe          	mov    BYTE PTR [rbx-0x2],sil
    12c7:	48 89 c8             	mov    rax,rcx
    12ca:	49 f7 ef             	imul   r15
    12cd:	48 89 d1             	mov    rcx,rdx
    12d0:	48 89 d0             	mov    rax,rdx
    12d3:	48 c1 e8 3f          	shr    rax,0x3f
    12d7:	48 c1 f9 07          	sar    rcx,0x7
    12db:	48 01 c1             	add    rcx,rax
    12de:	49 8d 04 38          	lea    rax,[r8+rdi*1]
    12e2:	48 83 c0 09          	add    rax,0x9
    12e6:	48 83 c3 fd          	add    rbx,0xfffffffffffffffd
    12ea:	48 83 f8 12          	cmp    rax,0x12
    12ee:	0f 87 4c ff ff ff    	ja     1240 <main+0x60>
    12f4:	41 ff c1             	inc    r9d
    12f7:	41 81 f9 80 96 98 00 	cmp    r9d,0x989680
    12fe:	0f 85 2c ff ff ff    	jne    1230 <main+0x50>
    1304:	48 8d 3d fd 0c 00 00 	lea    rdi,[rip+0xcfd]        # 2008 <iterations+0x4>
    130b:	48 89 e6             	mov    rsi,rsp
    130e:	31 c0                	xor    eax,eax
    1310:	e8 2b fd ff ff       	call   1040 <printf@plt>
    1315:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    131c:	00 00 
    131e:	48 3b 44 24 18       	cmp    rax,QWORD PTR [rsp+0x18]
    1323:	75 0f                	jne    1334 <main+0x154>
    1325:	31 c0                	xor    eax,eax
    1327:	48 83 c4 20          	add    rsp,0x20
    132b:	5b                   	pop    rbx
    132c:	41 5c                	pop    r12
    132e:	41 5e                	pop    r14
    1330:	41 5f                	pop    r15
    1332:	5d                   	pop    rbp
    1333:	c3                   	ret    
    1334:	e8 f7 fc ff ff       	call   1030 <__stack_chk_fail@plt>
    1339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001340 <__libc_csu_init>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	41 57                	push   r15
    1346:	4c 8d 3d 8b 2a 00 00 	lea    r15,[rip+0x2a8b]        # 3dd8 <__frame_dummy_init_array_entry>
    134d:	41 56                	push   r14
    134f:	49 89 d6             	mov    r14,rdx
    1352:	41 55                	push   r13
    1354:	49 89 f5             	mov    r13,rsi
    1357:	41 54                	push   r12
    1359:	41 89 fc             	mov    r12d,edi
    135c:	55                   	push   rbp
    135d:	48 8d 2d 7c 2a 00 00 	lea    rbp,[rip+0x2a7c]        # 3de0 <__init_array_end>
    1364:	53                   	push   rbx
    1365:	4c 29 fd             	sub    rbp,r15
    1368:	48 83 ec 08          	sub    rsp,0x8
    136c:	e8 8f fc ff ff       	call   1000 <_init>
    1371:	48 c1 fd 03          	sar    rbp,0x3
    1375:	74 1f                	je     1396 <__libc_csu_init+0x56>
    1377:	31 db                	xor    ebx,ebx
    1379:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1380:	4c 89 f2             	mov    rdx,r14
    1383:	4c 89 ee             	mov    rsi,r13
    1386:	44 89 e7             	mov    edi,r12d
    1389:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    138d:	48 83 c3 01          	add    rbx,0x1
    1391:	48 39 dd             	cmp    rbp,rbx
    1394:	75 ea                	jne    1380 <__libc_csu_init+0x40>
    1396:	48 83 c4 08          	add    rsp,0x8
    139a:	5b                   	pop    rbx
    139b:	5d                   	pop    rbp
    139c:	41 5c                	pop    r12
    139e:	41 5d                	pop    r13
    13a0:	41 5e                	pop    r14
    13a2:	41 5f                	pop    r15
    13a4:	c3                   	ret    
    13a5:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    13ac:	00 00 00 00 

00000000000013b0 <__libc_csu_fini>:
    13b0:	f3 0f 1e fa          	endbr64 
    13b4:	c3                   	ret    

Disassembly of section .fini:

00000000000013b8 <_fini>:
    13b8:	f3 0f 1e fa          	endbr64 
    13bc:	48 83 ec 08          	sub    rsp,0x8
    13c0:	48 83 c4 08          	add    rsp,0x8
    13c4:	c3                   	ret    
