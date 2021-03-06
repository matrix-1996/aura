	    ;; gdt.s - Implements the asm portion of the GDT table
	    ;; Copyright (C) 2016  Chris Smith

	    ;; This program is free software: you can redistribute it and/or modify
	    ;; it under the terms of the GNU General Public License as published by
	    ;; the Free Software Foundation, either version 3 of the License, or
	    ;; (at your option) any later version.

	    ;; This program is distributed in the hope that it will be useful,
	    ;; but WITHOUT ANY WARRANTY; without even the implied warranty of
	    ;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	    ;; GNU General Public License for more details.

	    ;; You should have received a copy of the GNU General Public License
	    ;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

BITS 64
DEFAULT REL

[GLOBAL gdt_flush]
extern gdtPointer
gdt_flush:
   lgdt [gdtPointer]

   mov rax, 0x10
   mov ds, rax
   mov es, rax
   mov fs, rax
   mov gs, rax
   mov ss, rax

   lea rax, [rel .flush]
   ret
   push 0x08
   push rax
   retf
.flush:
   ret

[GLOBAL tss_flush]    ; Allows our C code to call tss_flush().
tss_flush:
   mov rax, 0x2B      ; Load the index of our TSS structure - The index is
                     ; 0x28, as it is the 5th selector and each is 8 bytes
                     ; long, but we set the bottom two bits (making 0x2B)
                     ; so that it has an RPL of 3, not zero.
   ltr ax            ; Load 0x2B into the task state register.
   ret
