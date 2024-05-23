.syntax unified
.global main

.type main, %function
main:

  bl center_dot
  bl slower_timer
  bl slower_timer
  bl diamond
  bl heart
  bl sparkle
  bl cross
  bl triangle
  bl firework
  bl wave
  bl graduation_square

  b main
.size main, .-main



@ Starting position
center_dot: 
  push {lr} 
  nop
  ldr r4, = 0x50000000
  mov r0, 0x514  
  mov r1, 31
  bl high_bit 

  mov r1, 15
  bl high_bit

  nop
  mov r0,0x504  

  mov r1, 15
  bl high_bit

  pop {lr}
bx lr



wave:
  push {lr}

  bl slower_timer
  bl col1_15
  bl slower_timer
  bl col2_24
  bl slower_timer
  bl col3_345
  bl slower_timer
  bl col4_24
  bl slower_timer
  bl col5_15
  bl slower_timer
  bl low_bit

  bl slower_timer 
  bl col5_15
  bl slower_timer
  bl col4_242
  bl slower_timer
  bl col3_3
  bl slower_timer
  bl col2_24
  bl slower_timer
  bl col1_15
  bl slower_timer
  bl low_bit

  pop {lr}

bx lr

triangle:
  push {lr}

 bl slower_timer
  bl col5_12345
  bl slower_timer
  bl low_bit
  bl col4_234
  bl slower_timer
  bl low_bit  
  bl col3_3
  bl slower_timer
  bl low_bit
  bl col2_234
  bl slower_timer
  bl low_bit
  bl col1_12345
  bl slower_timer
  bl low_bit

  bl slower_timer
  bl col1_12345
  bl slower_timer
  bl low_bit
  bl col2_234
  bl slower_timer
  bl low_bit  
  bl col3_3
  bl slower_timer
  bl low_bit
  bl col4_234
  bl slower_timer
  bl low_bit
  bl col5_12345
  bl slower_timer
  bl low_bit

  pop {lr}
  nop
bx lr

@ Diamond (flashing & displaying)
diamond: 
  push {lr}
  bl low_bit
  bl col1_3
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col2_234
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col3_12345
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col4_234
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col5_3
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer

  bl diamond_timer @displays diamond
  bl intermediate_timer
  bl low_bit

  pop {lr}
bx lr


@ Heart (flashing & displaying)
heart: 
  push {lr}
  bl low_bit
  bl col5_23
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col4_1234
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col3_2345
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col2_1234
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  bl col1_234
  bl intermediate_timer
  bl low_bit
  bl intermediate_timer
  
  bl heart_timer @displays heart
  bl intermediate_timer
  bl low_bit
  
  pop {lr}
bx lr


@sparkling 
sparkle:
  push {lr}
  bl low_bit
  bl faster_timer
  bl col1_135
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col2_24
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col3_135
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col4_24
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col5_135
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col5_24
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col4_135
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col3_24
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col2_135
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col1_24

  pop {lr}
bx lr


@ Firework outward
firework:
  push {lr}
  bl center_dot
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col2_24
  bl col4_24
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl col1_15
  bl col5_15
  bl faster_timer
  bl low_bit
  bl faster_timer
  bl low_bit
  bl faster_timer
  
  pop {lr}
bx lr


@Make cross shape merging inward
cross: 
  push {lr}
  bl col1_15
  bl col5_15
  bl slower_timer
  bl col3_24
  bl col4_24
  bl slower_timer
  bl col1_15
  bl slower_timer
  bl col1_12345
  bl col2_234
  bl col3_3
  bl col4_234
  bl col5_12345
  bl slower_timer
  bl low_bit
  bl slower_timer

  pop {lr}
bx lr


@ Gradually makes a square
graduation_square:
  push {lr}

  bl col1_12345
  bl slower_timer
  bl col2_234
  bl slower_timer  
  bl col3_3
  bl slower_timer
  bl col4_234
  bl slower_timer
  bl col5_12345
  bl slower_timer
  bl low_bit

  bl slower_timer
  bl col5_12345
  bl slower_timer
  bl col4_234
  bl slower_timer
  bl col3_3
  bl slower_timer
  bl col2_234
  bl slower_timer
  bl col1_12345
  bl slower_timer
  bl low_bit

  pop {lr}
  nop
bx lr


@ Below are for setting DIR then OUT using setbit function


@(Col1 / Row 1,2,3,4,5)
  col1_12345:  
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit
    
    pop {lr}
  bx lr

  col1_15:  @(Col1 / Row 1,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr

    col1_135: @(Col1 / Row 1,3,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr} 
  bx lr

    col1_24: @(Col1 / Row 2,4)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr} 
  bx lr

  col1_234: @(Col1 / Row 2,3,4)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    
    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit

    pop {lr}
  bx lr

  col1_3: @(Col1 / Row 3)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 28
    bl high_bit 
    mov r1, 15
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 15
    bl high_bit

    pop {lr} 
  bx lr





@(Col2 / Row 2,3,4)
  col2_234: 
    push {lr}
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr

@(Col2 / Row 2,4)
  col2_24: 
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr
  
  col2_135:@(Col2 / Row 1,3,5)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit
  
    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr

    col2_1234: @(Col2 / Row 1,2,3,4)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr





@(Col3 / Row 3)
  col3_3: 
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 31
    bl high_bit 
    mov r1, 15
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 15
    bl high_bit

    pop {lr}
  bx lr

  col3_345: @(Col3 / Row 3,4,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 31
    bl high_bit 
    mov r1, 15
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 15
    bl high_bit

    pop {lr} 
  bx lr
  
  col3_24: @(Col3 / Row 2,4)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr

  col3_135: @(Col3 / Row 1,3,5)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 31
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr} 
  bx lr

    col3_12345: @(Col3 / Row 1,2,3,4,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 31
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr} 
  bx lr

    col3_2345: @(Col3 / Row 2,3,4,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 31
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr





@(Col4 / Row 2,3,4)
  col4_234: 
    push {lr}
    nop
    ldr r4, = 0x50000300  
    mov r0, 0x514
    mov r1, 5
    bl high_bit
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    
    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr} 
  bx lr

  col4_24: @(Col4 / Row 2,4)

    push {lr}
    nop
    ldr r4, = 0x50000300  
    mov r0, 0x514
    mov r1, 5
    bl high_bit
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 11
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr} 
  bx lr
  
  col4_242: @(Col4 / Row 2,4)

    push {lr}
    nop
    ldr r4, = 0x50000300  
    mov r0, 0x514
    mov r1, 05
    bl high_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr
  
  col4_135: @(Col4 / Row 1,3,5)
    push {lr}
    nop
    ldr r4, = 0x50000300  
    mov r0, 0x514
    mov r1, 05
    bl high_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr

  col4_1234: @(Col4 / Row 1,2,3,4)
    push {lr}
    nop
    ldr r4, = 0x50000300  
    mov r0, 0x514
    mov r1, 05
    bl high_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
  
    pop {lr} 
  bx lr





 @(Col5 / Row 1,2,3,4,5)
  col5_12345:
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 24
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr

  col5_15: @(Col5 / Row 1,5)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr}
  bx lr

  col5_135: @(Col5 / Row 1,3,5)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit 
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 21
    bl high_bit
    mov r1, 15
    bl high_bit
    mov r1, 19
    bl high_bit

    pop {lr} 
  bx lr

  col5_24:@(Col5 / Row 2,4)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 24
    bl high_bit

    pop {lr}
  bx lr

  col5_3: @(Col5 / Row 3)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit
    mov r1, 15
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 15
    bl high_bit

    pop {lr}
  bx lr

  col5_23: @(Col5 / Row 2,3)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514  
    mov r1, 30
    bl high_bit 
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit

    nop
    mov r0,0x504  
    mov r1, 22
    bl high_bit
    mov r1, 15
    bl high_bit

    pop {lr}
  bx lr




@hold_up slower_timers
faster_timer:
  push {lr}
  ldr r9, =550000
  bl hold_up
  pop {lr}
bx lr

intermediate_timer:
  push {lr}
  ldr r9, =800000
  bl hold_up
  pop {lr}
bx lr

slower_timer:
  push {lr}
  ldr r9, =1000000
  bl hold_up
  pop {lr}
bx lr

hold_up:
  sub r9, r9, 1
  cmp r9, 0
  bne hold_up
bx lr

diamond_timer:
  push {lr}
  ldr r9, =24000
  bl diamond_pic
  pop {lr}
bx lr

heart_timer:
  push {lr}
  ldr r9, =24000
  bl heart_pic
  pop {lr}
bx lr



@Continous Loop for displaying the shape
diamond_pic:
  push {lr}
  subs r9, r9, #1
  bl col1_3
  bl low_bit
  bl col2_234
  bl low_bit
  bl col3_12345
  bl low_bit
  bl col4_234
  bl low_bit
  bl col5_3
  bl low_bit
  cmp r9, 0
  bne diamond_pic

  pop {lr}
bx lr

heart_pic:
  push {lr}
  subs r9, r9, #1
  bl col1_234
  bl low_bit
  bl col2_1234
  bl low_bit
  bl col3_2345
  bl low_bit
  bl col4_1234
  bl low_bit
  bl col5_23
  bl low_bit
  cmp r9, 0
  bne heart_pic

  pop {lr}
bx lr


@Sets a bit both DIR and OUT to high
high_bit:
  @r0: offset of address
  @r1: the pin to set to high
  @r3: the pin already set to high
  @r4: base address of the GPIO
  @r5: store bit 1 into register
  
  push {lr}
  ldr r3, [r4, r0]
  mov r5, 0b1
  lsl r5, r5, r1
  orr r3, r3, r5
  str r3, [r4, r0]

  pop {lr}
bx lr


@Sets a bit both DIR and OUT to low
low_bit:
  @r4: base address of the GPIO
  @r10: store bit 0 into register
  
  push {lr}
  mov r10, 0
  ldr r4, =0x50000000
  str r10, [r4, 0x514]
  str r10, [r4, 0x504]
  ldr r4, =0x50000300
  str r10, [r4, 0x514]
  str r10, [r4, 0x504]

  pop {lr}
bx lr