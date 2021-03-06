# RUN: llvm-mc %S/Inputs/unprotected-fullinfo.s -filetype obj \
# RUN:         -triple x86_64-linux-elf -o %t.o
# RUN: echo "fun:*main*" > %t.blacklist.txt
# RUN: llvm-cfi-verify %t.o %t.blacklist.txt | FileCheck %s

# CHECK-LABEL: U
# CHECK-NEXT: tiny.cc:11
# CHECK-NEXT: BLACKLIST MATCH, 'fun'
# CHECK-NEXT: ====> Expected Unprotected

# CHECK: Expected Protected: 0 (0.00%)
# CHECK: Unexpected Protected: 0 (0.00%)
# CHECK: Expected Unprotected: 1 (100.00%)
# CHECK: Unexpected Unprotected (BAD): 0 (0.00%)

# Source: (blacklist.txt):
#   fun:*main*
