
no_cfi_icall:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 2f 00 00    	jmpq   *0x2fe4(%rip)        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <printf@plt>:
  401030:	ff 25 e2 2f 00 00    	jmpq   *0x2fe2(%rip)        # 404018 <printf@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	pushq  $0x0
  40103b:	e9 e0 ff ff ff       	jmpq   401020 <.plt>

0000000000401040 <exit@plt>:
  401040:	ff 25 da 2f 00 00    	jmpq   *0x2fda(%rip)        # 404020 <exit@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	pushq  $0x1
  40104b:	e9 d0 ff ff ff       	jmpq   401020 <.plt>

Disassembly of section .text:

0000000000401050 <_start>:
  401050:	f3 0f 1e fa          	endbr64 
  401054:	31 ed                	xor    %ebp,%ebp
  401056:	49 89 d1             	mov    %rdx,%r9
  401059:	5e                   	pop    %rsi
  40105a:	48 89 e2             	mov    %rsp,%rdx
  40105d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401061:	50                   	push   %rax
  401062:	54                   	push   %rsp
  401063:	49 c7 c0 10 15 40 00 	mov    $0x401510,%r8
  40106a:	48 c7 c1 a0 14 40 00 	mov    $0x4014a0,%rcx
  401071:	48 c7 c7 40 11 40 00 	mov    $0x401140,%rdi
  401078:	ff 15 72 2f 00 00    	callq  *0x2f72(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40107e:	f4                   	hlt    
  40107f:	90                   	nop

0000000000401080 <_dl_relocate_static_pie>:
  401080:	f3 0f 1e fa          	endbr64 
  401084:	c3                   	retq   
  401085:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40108c:	00 00 00 
  40108f:	90                   	nop

0000000000401090 <deregister_tm_clones>:
  401090:	b8 58 40 40 00       	mov    $0x404058,%eax
  401095:	48 3d 58 40 40 00    	cmp    $0x404058,%rax
  40109b:	74 13                	je     4010b0 <deregister_tm_clones+0x20>
  40109d:	b8 00 00 00 00       	mov    $0x0,%eax
  4010a2:	48 85 c0             	test   %rax,%rax
  4010a5:	74 09                	je     4010b0 <deregister_tm_clones+0x20>
  4010a7:	bf 58 40 40 00       	mov    $0x404058,%edi
  4010ac:	ff e0                	jmpq   *%rax
  4010ae:	66 90                	xchg   %ax,%ax
  4010b0:	c3                   	retq   
  4010b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010b8:	00 00 00 00 
  4010bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004010c0 <register_tm_clones>:
  4010c0:	be 58 40 40 00       	mov    $0x404058,%esi
  4010c5:	48 81 ee 58 40 40 00 	sub    $0x404058,%rsi
  4010cc:	48 89 f0             	mov    %rsi,%rax
  4010cf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4010d3:	48 c1 f8 03          	sar    $0x3,%rax
  4010d7:	48 01 c6             	add    %rax,%rsi
  4010da:	48 d1 fe             	sar    %rsi
  4010dd:	74 11                	je     4010f0 <register_tm_clones+0x30>
  4010df:	b8 00 00 00 00       	mov    $0x0,%eax
  4010e4:	48 85 c0             	test   %rax,%rax
  4010e7:	74 07                	je     4010f0 <register_tm_clones+0x30>
  4010e9:	bf 58 40 40 00       	mov    $0x404058,%edi
  4010ee:	ff e0                	jmpq   *%rax
  4010f0:	c3                   	retq   
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401100 <__do_global_dtors_aux>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	80 3d 4d 2f 00 00 00 	cmpb   $0x0,0x2f4d(%rip)        # 404058 <__TMC_END__>
  40110b:	75 13                	jne    401120 <__do_global_dtors_aux+0x20>
  40110d:	55                   	push   %rbp
  40110e:	48 89 e5             	mov    %rsp,%rbp
  401111:	e8 7a ff ff ff       	callq  401090 <deregister_tm_clones>
  401116:	c6 05 3b 2f 00 00 01 	movb   $0x1,0x2f3b(%rip)        # 404058 <__TMC_END__>
  40111d:	5d                   	pop    %rbp
  40111e:	c3                   	retq   
  40111f:	90                   	nop
  401120:	c3                   	retq   
  401121:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401128:	00 00 00 00 
  40112c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401130 <frame_dummy>:
  401130:	f3 0f 1e fa          	endbr64 
  401134:	eb 8a                	jmp    4010c0 <register_tm_clones>
  401136:	66 90                	xchg   %ax,%ax
  401138:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40113f:	00 

0000000000401140 <main>:
  401140:	55                   	push   %rbp
  401141:	48 89 e5             	mov    %rsp,%rbp
  401144:	48 83 ec 50          	sub    $0x50,%rsp
  401148:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  40114f:	89 7d f8             	mov    %edi,-0x8(%rbp)
  401152:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  401156:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
  40115a:	0f 84 6e 01 00 00    	je     4012ce <main+0x18e>
  401160:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401164:	48 8b 30             	mov    (%rax),%rsi
  401167:	48 bf 04 20 40 00 00 	movabs $0x402004,%rdi
  40116e:	00 00 00 
  401171:	b0 00                	mov    $0x0,%al
  401173:	e8 b8 fe ff ff       	callq  401030 <printf@plt>
  401178:	48 bf 18 20 40 00 00 	movabs $0x402018,%rdi
  40117f:	00 00 00 
  401182:	89 45 e8             	mov    %eax,-0x18(%rbp)
  401185:	b0 00                	mov    $0x0,%al
  401187:	e8 a4 fe ff ff       	callq  401030 <printf@plt>
  40118c:	48 bf 28 20 40 00 00 	movabs $0x402028,%rdi
  401193:	00 00 00 
  401196:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  401199:	b0 00                	mov    $0x0,%al
  40119b:	e8 90 fe ff ff       	callq  401030 <printf@plt>
  4011a0:	48 bf 42 20 40 00 00 	movabs $0x402042,%rdi
  4011a7:	00 00 00 
  4011aa:	89 45 e0             	mov    %eax,-0x20(%rbp)
  4011ad:	b0 00                	mov    $0x0,%al
  4011af:	e8 7c fe ff ff       	callq  401030 <printf@plt>
  4011b4:	48 bf 7a 20 40 00 00 	movabs $0x40207a,%rdi
  4011bb:	00 00 00 
  4011be:	89 45 dc             	mov    %eax,-0x24(%rbp)
  4011c1:	b0 00                	mov    $0x0,%al
  4011c3:	e8 68 fe ff ff       	callq  401030 <printf@plt>
  4011c8:	48 bf b3 20 40 00 00 	movabs $0x4020b3,%rdi
  4011cf:	00 00 00 
  4011d2:	89 45 d8             	mov    %eax,-0x28(%rbp)
  4011d5:	b0 00                	mov    $0x0,%al
  4011d7:	e8 54 fe ff ff       	callq  401030 <printf@plt>
  4011dc:	48 bf 1d 21 40 00 00 	movabs $0x40211d,%rdi
  4011e3:	00 00 00 
  4011e6:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  4011e9:	b0 00                	mov    $0x0,%al
  4011eb:	e8 40 fe ff ff       	callq  401030 <printf@plt>
  4011f0:	48 bf da 20 40 00 00 	movabs $0x4020da,%rdi
  4011f7:	00 00 00 
  4011fa:	89 45 d0             	mov    %eax,-0x30(%rbp)
  4011fd:	b0 00                	mov    $0x0,%al
  4011ff:	e8 2c fe ff ff       	callq  401030 <printf@plt>
  401204:	48 bf 1c 21 40 00 00 	movabs $0x40211c,%rdi
  40120b:	00 00 00 
  40120e:	89 45 cc             	mov    %eax,-0x34(%rbp)
  401211:	b0 00                	mov    $0x0,%al
  401213:	e8 18 fe ff ff       	callq  401030 <printf@plt>
  401218:	48 bf 1f 21 40 00 00 	movabs $0x40211f,%rdi
  40121f:	00 00 00 
  401222:	89 45 c8             	mov    %eax,-0x38(%rbp)
  401225:	b0 00                	mov    $0x0,%al
  401227:	e8 04 fe ff ff       	callq  401030 <printf@plt>
  40122c:	48 b9 38 40 40 00 00 	movabs $0x404038,%rcx
  401233:	00 00 00 
  401236:	48 bf 71 21 40 00 00 	movabs $0x402171,%rdi
  40123d:	00 00 00 
  401240:	48 89 ce             	mov    %rcx,%rsi
  401243:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  401246:	b0 00                	mov    $0x0,%al
  401248:	e8 e3 fd ff ff       	callq  401030 <printf@plt>
  40124d:	48 b9 38 40 40 00 00 	movabs $0x404038,%rcx
  401254:	00 00 00 
  401257:	48 81 c1 08 00 00 00 	add    $0x8,%rcx
  40125e:	48 bf 81 21 40 00 00 	movabs $0x402181,%rdi
  401265:	00 00 00 
  401268:	48 89 ce             	mov    %rcx,%rsi
  40126b:	89 45 c0             	mov    %eax,-0x40(%rbp)
  40126e:	b0 00                	mov    $0x0,%al
  401270:	e8 bb fd ff ff       	callq  401030 <printf@plt>
  401275:	48 b9 38 40 40 00 00 	movabs $0x404038,%rcx
  40127c:	00 00 00 
  40127f:	48 81 c1 10 00 00 00 	add    $0x10,%rcx
  401286:	48 bf 95 21 40 00 00 	movabs $0x402195,%rdi
  40128d:	00 00 00 
  401290:	48 89 ce             	mov    %rcx,%rsi
  401293:	89 45 bc             	mov    %eax,-0x44(%rbp)
  401296:	b0 00                	mov    $0x0,%al
  401298:	e8 93 fd ff ff       	callq  401030 <printf@plt>
  40129d:	48 b9 38 40 40 00 00 	movabs $0x404038,%rcx
  4012a4:	00 00 00 
  4012a7:	48 81 c1 18 00 00 00 	add    $0x18,%rcx
  4012ae:	48 bf a7 21 40 00 00 	movabs $0x4021a7,%rdi
  4012b5:	00 00 00 
  4012b8:	48 89 ce             	mov    %rcx,%rsi
  4012bb:	89 45 b8             	mov    %eax,-0x48(%rbp)
  4012be:	b0 00                	mov    $0x0,%al
  4012c0:	e8 6b fd ff ff       	callq  401030 <printf@plt>
  4012c5:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  4012cc:	eb 39                	jmp    401307 <main+0x1c7>
  4012ce:	48 bf b9 21 40 00 00 	movabs $0x4021b9,%rdi
  4012d5:	00 00 00 
  4012d8:	b0 00                	mov    $0x0,%al
  4012da:	e8 51 fd ff ff       	callq  401030 <printf@plt>
  4012df:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  4012e3:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  4012e7:	0f be 11             	movsbl (%rcx),%edx
  4012ea:	83 ea 30             	sub    $0x30,%edx
  4012ed:	89 55 ec             	mov    %edx,-0x14(%rbp)
  4012f0:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
  4012f4:	48 8b 0c cd 38 40 40 	mov    0x404038(,%rcx,8),%rcx
  4012fb:	00 
  4012fc:	8b 7d ec             	mov    -0x14(%rbp),%edi
  4012ff:	89 45 b4             	mov    %eax,-0x4c(%rbp)
  401302:	ff d1                	callq  *%rcx
  401304:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401307:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40130a:	48 83 c4 50          	add    $0x50,%rsp
  40130e:	5d                   	pop    %rbp
  40130f:	c3                   	retq   

0000000000401310 <int_arg>:
  401310:	55                   	push   %rbp
  401311:	48 89 e5             	mov    %rsp,%rbp
  401314:	48 83 ec 10          	sub    $0x10,%rsp
  401318:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40131b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  40131e:	48 bf 19 22 40 00 00 	movabs $0x402219,%rdi
  401325:	00 00 00 
  401328:	48 be 9d 22 40 00 00 	movabs $0x40229d,%rsi
  40132f:	00 00 00 
  401332:	b0 00                	mov    $0x0,%al
  401334:	e8 f7 fc ff ff       	callq  401030 <printf@plt>
  401339:	31 c9                	xor    %ecx,%ecx
  40133b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  40133e:	89 c8                	mov    %ecx,%eax
  401340:	48 83 c4 10          	add    $0x10,%rsp
  401344:	5d                   	pop    %rbp
  401345:	c3                   	retq   
  401346:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40134d:	00 00 00 

0000000000401350 <bad_int_arg>:
  401350:	55                   	push   %rbp
  401351:	48 89 e5             	mov    %rsp,%rbp
  401354:	48 83 ec 10          	sub    $0x10,%rsp
  401358:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40135b:	48 bf 72 22 40 00 00 	movabs $0x402272,%rdi
  401362:	00 00 00 
  401365:	b0 00                	mov    $0x0,%al
  401367:	e8 c4 fc ff ff       	callq  401030 <printf@plt>
  40136c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  40136f:	48 bf 19 22 40 00 00 	movabs $0x402219,%rdi
  401376:	00 00 00 
  401379:	48 be 99 22 40 00 00 	movabs $0x402299,%rsi
  401380:	00 00 00 
  401383:	89 45 f8             	mov    %eax,-0x8(%rbp)
  401386:	b0 00                	mov    $0x0,%al
  401388:	e8 a3 fc ff ff       	callq  401030 <printf@plt>
  40138d:	31 c9                	xor    %ecx,%ecx
  40138f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401392:	89 c8                	mov    %ecx,%eax
  401394:	48 83 c4 10          	add    $0x10,%rsp
  401398:	5d                   	pop    %rbp
  401399:	c3                   	retq   
  40139a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004013a0 <float_arg>:
  4013a0:	55                   	push   %rbp
  4013a1:	48 89 e5             	mov    %rsp,%rbp
  4013a4:	48 83 ec 10          	sub    $0x10,%rsp
  4013a8:	f3 0f 11 45 fc       	movss  %xmm0,-0x4(%rbp)
  4013ad:	48 bf 36 22 40 00 00 	movabs $0x402236,%rdi
  4013b4:	00 00 00 
  4013b7:	b0 00                	mov    $0x0,%al
  4013b9:	e8 72 fc ff ff       	callq  401030 <printf@plt>
  4013be:	f3 0f 10 45 fc       	movss  -0x4(%rbp),%xmm0
  4013c3:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  4013c7:	48 bf 5b 22 40 00 00 	movabs $0x40225b,%rdi
  4013ce:	00 00 00 
  4013d1:	48 be 68 22 40 00 00 	movabs $0x402268,%rsi
  4013d8:	00 00 00 
  4013db:	89 45 f8             	mov    %eax,-0x8(%rbp)
  4013de:	b0 01                	mov    $0x1,%al
  4013e0:	e8 4b fc ff ff       	callq  401030 <printf@plt>
  4013e5:	31 c9                	xor    %ecx,%ecx
  4013e7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4013ea:	89 c8                	mov    %ecx,%eax
  4013ec:	48 83 c4 10          	add    $0x10,%rsp
  4013f0:	5d                   	pop    %rbp
  4013f1:	c3                   	retq   
  4013f2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4013f9:	00 00 00 
  4013fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401400 <not_entry_point>:
  401400:	55                   	push   %rbp
  401401:	48 89 e5             	mov    %rsp,%rbp
  401404:	48 83 ec 10          	sub    $0x10,%rsp
  401408:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40140b:	90                   	nop
  40140c:	90                   	nop
  40140d:	90                   	nop
  40140e:	90                   	nop
  40140f:	90                   	nop
  401410:	90                   	nop
  401411:	90                   	nop
  401412:	90                   	nop
  401413:	90                   	nop
  401414:	90                   	nop
  401415:	90                   	nop
  401416:	90                   	nop
  401417:	90                   	nop
  401418:	90                   	nop
  401419:	90                   	nop
  40141a:	90                   	nop
  40141b:	90                   	nop
  40141c:	90                   	nop
  40141d:	90                   	nop
  40141e:	90                   	nop
  40141f:	90                   	nop
  401420:	90                   	nop
  401421:	90                   	nop
  401422:	90                   	nop
  401423:	90                   	nop
  401424:	90                   	nop
  401425:	90                   	nop
  401426:	90                   	nop
  401427:	90                   	nop
  401428:	90                   	nop
  401429:	90                   	nop
  40142a:	90                   	nop
  40142b:	90                   	nop
  40142c:	90                   	nop
  40142d:	90                   	nop
  40142e:	90                   	nop
  40142f:	90                   	nop
  401430:	90                   	nop
  401431:	90                   	nop
  401432:	90                   	nop
  401433:	90                   	nop
  401434:	90                   	nop
  401435:	90                   	nop
  401436:	90                   	nop
  401437:	90                   	nop
  401438:	90                   	nop
  401439:	90                   	nop
  40143a:	90                   	nop
  40143b:	90                   	nop
  40143c:	90                   	nop
  40143d:	90                   	nop
  40143e:	90                   	nop
  40143f:	90                   	nop
  401440:	90                   	nop
  401441:	90                   	nop
  401442:	90                   	nop
  401443:	90                   	nop
  401444:	90                   	nop
  401445:	90                   	nop
  401446:	90                   	nop
  401447:	90                   	nop
  401448:	90                   	nop
  401449:	90                   	nop
  40144a:	90                   	nop
  40144b:	90                   	nop
  40144c:	90                   	nop
  40144d:	90                   	nop
  40144e:	90                   	nop
  40144f:	90                   	nop
  401450:	90                   	nop
  401451:	90                   	nop
  401452:	90                   	nop
  401453:	90                   	nop
  401454:	90                   	nop
  401455:	90                   	nop
  401456:	90                   	nop
  401457:	90                   	nop
  401458:	90                   	nop
  401459:	90                   	nop
  40145a:	90                   	nop
  40145b:	48 bf ce 21 40 00 00 	movabs $0x4021ce,%rdi
  401462:	00 00 00 
  401465:	b0 00                	mov    $0x0,%al
  401467:	e8 c4 fb ff ff       	callq  401030 <printf@plt>
  40146c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  40146f:	48 bf 19 22 40 00 00 	movabs $0x402219,%rdi
  401476:	00 00 00 
  401479:	48 be 26 22 40 00 00 	movabs $0x402226,%rsi
  401480:	00 00 00 
  401483:	89 45 f8             	mov    %eax,-0x8(%rbp)
  401486:	b0 00                	mov    $0x0,%al
  401488:	e8 a3 fb ff ff       	callq  401030 <printf@plt>
  40148d:	8b 7d fc             	mov    -0x4(%rbp),%edi
  401490:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401493:	e8 a8 fb ff ff       	callq  401040 <exit@plt>
  401498:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40149f:	00 

00000000004014a0 <__libc_csu_init>:
  4014a0:	f3 0f 1e fa          	endbr64 
  4014a4:	41 57                	push   %r15
  4014a6:	4c 8d 3d 63 29 00 00 	lea    0x2963(%rip),%r15        # 403e10 <__frame_dummy_init_array_entry>
  4014ad:	41 56                	push   %r14
  4014af:	49 89 d6             	mov    %rdx,%r14
  4014b2:	41 55                	push   %r13
  4014b4:	49 89 f5             	mov    %rsi,%r13
  4014b7:	41 54                	push   %r12
  4014b9:	41 89 fc             	mov    %edi,%r12d
  4014bc:	55                   	push   %rbp
  4014bd:	48 8d 2d 54 29 00 00 	lea    0x2954(%rip),%rbp        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  4014c4:	53                   	push   %rbx
  4014c5:	4c 29 fd             	sub    %r15,%rbp
  4014c8:	48 83 ec 08          	sub    $0x8,%rsp
  4014cc:	e8 2f fb ff ff       	callq  401000 <_init>
  4014d1:	48 c1 fd 03          	sar    $0x3,%rbp
  4014d5:	74 1f                	je     4014f6 <__libc_csu_init+0x56>
  4014d7:	31 db                	xor    %ebx,%ebx
  4014d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4014e0:	4c 89 f2             	mov    %r14,%rdx
  4014e3:	4c 89 ee             	mov    %r13,%rsi
  4014e6:	44 89 e7             	mov    %r12d,%edi
  4014e9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4014ed:	48 83 c3 01          	add    $0x1,%rbx
  4014f1:	48 39 dd             	cmp    %rbx,%rbp
  4014f4:	75 ea                	jne    4014e0 <__libc_csu_init+0x40>
  4014f6:	48 83 c4 08          	add    $0x8,%rsp
  4014fa:	5b                   	pop    %rbx
  4014fb:	5d                   	pop    %rbp
  4014fc:	41 5c                	pop    %r12
  4014fe:	41 5d                	pop    %r13
  401500:	41 5e                	pop    %r14
  401502:	41 5f                	pop    %r15
  401504:	c3                   	retq   
  401505:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40150c:	00 00 00 00 

0000000000401510 <__libc_csu_fini>:
  401510:	f3 0f 1e fa          	endbr64 
  401514:	c3                   	retq   

Disassembly of section .fini:

0000000000401518 <_fini>:
  401518:	f3 0f 1e fa          	endbr64 
  40151c:	48 83 ec 08          	sub    $0x8,%rsp
  401520:	48 83 c4 08          	add    $0x8,%rsp
  401524:	c3                   	retq   
