0000000000402620 <id__test1>:
  402620:       55                      push   %rbp
  402621:       48 89 e5                mov    %rsp,%rbp
  402624:       48 83 ec 10             sub    $0x10,%rsp
  402628:       48 c7 45 f8 00 00 00    movq   $0x0,-0x8(%rbp)
  40262f:       00 
  402630:       30 c0                   xor    %al,%al
  402632:       e8 a9 4b 00 00          callq  4071e0 <String_class>
  402637:       48 8b 50 10             mov    0x10(%rax),%rdx
  40263b:       48 8d 7d f8             lea    -0x8(%rbp),%rdi
  40263f:       be 18 b4 63 00          mov    $0x63b418,%esi
  402644:       e8 a7 fa ff ff          callq  4020f0 <memcpy@plt>
  402649:       48 8b 7d f8             mov    -0x8(%rbp),%rdi
  40264d:       e8 4e 3d 00 00          callq  4063a0 <String_println>
  402652:       48 83 c4 10             add    $0x10,%rsp
  402656:       5d                      pop    %rbp
  402657:       c3                      retq   
  402658:       0f 1f 84 00 00 00 00    nopl   0x0(%rax,%rax,1)
  40265f:       00 
