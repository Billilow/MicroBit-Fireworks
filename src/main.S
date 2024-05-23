.syntax unified
.global main

.type main, %function
main:

  bl center_dot
  bl timer
  bl timer
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
  mov r0, 0x514 @ 0x50000000 DIR ->
  mov r1, 31
  bl set_bit 

  mov r1, 15
  bl set_bit

  nop
  mov r0,0x504 @ 0x50000000 OUT -> 

  mov r1, 15
  bl set_bit

  pop {lr}
bx lr



wave:
  push {lr}

  bl timer
  bl col1_15
  bl timer
  bl col2_24
  bl timer
  bl col3_345
  bl timer
  bl col4_24
  bl timer
  bl col5_15
  bl timer
  bl clear_bit

  bl timer 
  bl col5_15
  bl timer
  bl col4_242
  bl timer
  bl col3_3
  bl timer
  bl col2_24
  bl timer
  bl col1_15
  bl timer
  bl clear_bit

  pop {lr}

bx lr

triangle:
  push {lr}

 bl timer
  bl col5_12345
  bl timer
  bl clear_bit
  bl col4_234
  bl timer
  bl clear_bit  
  bl col3_3
  bl timer
  bl clear_bit
  bl col2_234
  bl timer
  bl clear_bit
  bl col1_12345
  bl timer
  bl clear_bit

  bl timer
  bl col1_12345
  bl timer
  bl clear_bit
  bl col2_234
  bl timer
  bl clear_bit  
  bl col3_3
  bl timer
  bl clear_bit
  bl col4_234
  bl timer
  bl clear_bit
  bl col5_12345
  bl timer
  bl clear_bit

  pop {lr}
  nop
bx lr

@ Diamond (flashing & displaying)
diamond: 
  push {lr}
  bl clear_bit
  bl col1_3
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col2_234
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col3_12345
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col4_234
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col5_3
  bl medium_Timer
  bl clear_bit
  bl medium_Timer

  bl diamond_Timer @displays Diamond
  bl medium_Timer
  bl clear_bit

  pop {lr}
bx lr


@ Heart (flashing & displaying)
heart: 
  push {lr}
  bl clear_bit
  bl col5_23
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col4_1234
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col3_2345
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col2_1234
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  bl col1_234
  bl medium_Timer
  bl clear_bit
  bl medium_Timer
  
  bl heart_Timer @displays heart
  bl medium_Timer
  bl clear_bit
  
  pop {lr}
bx lr


@3-2-3-2-3 flash animation
sparkle:
  push {lr}
  bl clear_bit
  bl small_Timer
  bl col1_135
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col2_24
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col3_135
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col4_24
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col5_135
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col5_24
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col4_135
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col3_24
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col2_135
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col1_24

  pop {lr}
bx lr


@ Firework outward
firework:
  push {lr}
  bl center_dot
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col2_24
  bl col4_24
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl col1_15
  bl col5_15
  bl small_Timer
  bl clear_bit
  bl small_Timer
  bl clear_bit
  bl small_Timer
  
  pop {lr}
bx lr


@Make cross shape merging inward
cross: 
  push {lr}
  bl col1_15
  bl col5_15
  bl timer
  bl col3_24
  bl col4_24
  bl timer
  bl col1_15
  bl timer
  bl col1_12345
  bl col2_234
  bl col3_3
  bl col4_234
  bl col5_12345
  bl timer
  bl clear_bit
  bl timer

  pop {lr}
bx lr


@ Gradually makes a square
graduation_square:
  push {lr}

  bl col1_12345
  bl timer
  bl col2_234
  bl timer  
  bl col3_3
  bl timer
  bl col4_234
  bl timer
  bl col5_12345
  bl timer
  bl clear_bit

  bl timer
  bl col5_12345
  bl timer
  bl col4_234
  bl timer
  bl col3_3
  bl timer
  bl col2_234
  bl timer
  bl col1_12345
  bl timer
  bl clear_bit

  pop {lr}
  nop
bx lr


@ Below are for setting DIR then OUT using setbit function


@(Col1 / Row 1,2,3,4,5)
  col1_12345:  
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit
    
    pop {lr}
  bx lr

  col1_15:  @(Col1 / Row 1,5)
    push {lr}  @Linking back to bl in wave
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr} @Linking back to bl in sequence_1
  bx lr

    col1_135: @(Col1 / Row 1,3,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr} 
  bx lr

    col1_24: @(Col1 / Row 2,4)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr} 
  bx lr

  col1_234: @(Col1 / Row 2,3,4)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    
    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit

    pop {lr}
  bx lr

  col1_3: @(Col1 / Row 3)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 28
    bl set_bit 
    mov r1, 15
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 15
    bl set_bit

    pop {lr} 
  bx lr





@(Col2 / Row 2,3,4)
  col2_234: 
    push {lr}
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr}
  bx lr

@(Col2 / Row 2,4)
  col2_24: 
    push {lr}  @Linking back to bl in wave
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr}
  bx lr
  
  col2_135:@(Col2 / Row 1,3,5)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit
  
    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr}
  bx lr

    col2_1234: @(Col2 / Row 1,2,3,4)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr}
  bx lr





@(Col3 / Row 3)
  col3_3: 
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 31
    bl set_bit 
    mov r1, 15
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 15
    bl set_bit

    pop {lr}
  bx lr

  col3_345: @(Col3 / Row 3,4,5)
    push {lr}  @Linking back to bl in wave
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 31
    bl set_bit 
    mov r1, 15
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 15
    bl set_bit

    pop {lr} @Linking back to bl in sequence_1
  bx lr
  
  col3_24: @(Col3 / Row 2,4)
    push {lr}  @Linking back to bl in sequence_1
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr} @Linking back to bl in sequence_1
  bx lr

  col3_135: @(Col3 / Row 1,3,5)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 31
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr} 
  bx lr

    col3_12345: @(Col3 / Row 1,2,3,4,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 31
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 22
    bl set_bit
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr} 
  bx lr

    col3_2345: @(Col3 / Row 2,3,4,5)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 31
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr}
  bx lr





@(Col4 / Row 2,3,4)
  col4_234: 
    push {lr}
    nop
    ldr r4, = 0x50000300 @ 0x50000300 DIR 5
    mov r0, 0x514
    mov r1, 5
    bl set_bit
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    
    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr} 
  bx lr

  col4_24: @(Col4 / Row 2,4)

    push {lr}
    nop
    ldr r4, = 0x50000300 @ 0x50000300 DIR 5
    mov r0, 0x514
    mov r1, 5
    bl set_bit
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 11
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr} 
  bx lr
  
  col4_242: @(Col4 / Row 2,4) 건들이지 말기

    push {lr}
    nop
    ldr r4, = 0x50000300 @ 0x50000300 DIR 5
    mov r0, 0x514
    mov r1, 05
    bl set_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr}
  bx lr
  
  col4_135: @(Col4 / Row 1,3,5)
    push {lr}
    nop
    ldr r4, = 0x50000300 @ 0x50000300 DIR 5
    mov r0, 0x514
    mov r1, 05
    bl set_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr}
  bx lr

  col4_1234: @(Col4 / Row 1,2,3,4)
    push {lr}
    nop
    ldr r4, = 0x50000300 @ 0x50000300 DIR 5
    mov r0, 0x514
    mov r1, 05
    bl set_bit

    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
  
    pop {lr} 
  bx lr





 @(Col5 / Row 1,2,3,4,5)
  col5_12345:
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 24
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr}
  bx lr

  col5_15: @(Col5 / Row 1,5)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr}
  bx lr

  col5_135: @(Col5 / Row 1,3,5)
    push {lr} 
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit 
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 21
    bl set_bit
    mov r1, 15
    bl set_bit
    mov r1, 19
    bl set_bit

    pop {lr} 
  bx lr

  col5_24:@(Col5 / Row 2,4)
    push {lr}  
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT ->
    mov r1, 22
    bl set_bit
    mov r1, 24
    bl set_bit

    pop {lr}
  bx lr

  col5_3: @(Col5 / Row 3)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit
    mov r1, 15
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 15
    bl set_bit

    pop {lr}
  bx lr

  col5_23: @(Col5 / Row 2,3)
    push {lr}
    nop
    ldr r4, = 0x50000000
    mov r0, 0x514 @ 0x50000000 DIR ->
    mov r1, 30
    bl set_bit 
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit

    nop
    mov r0,0x504 @ 0x50000000 OUT -> 
    mov r1, 22
    bl set_bit
    mov r1, 15
    bl set_bit

    pop {lr}
  bx lr




@Delay timer

small_Timer:
  push {lr}
  ldr r9, =550000
  bl delay
  pop {lr}
bx lr

medium_Timer:
  push {lr}
  ldr r9, =800000
  bl delay
  pop {lr}
bx lr

timer:
  push {lr}
  ldr r9, =1000000
  bl delay
  pop {lr}
bx lr

delay:
  sub r9, r9, 1
  cmp r9, 0
  bne delay
bx lr

diamond_Timer:
  push {lr}
  ldr r9, =24000
  bl diamond_pic
  pop {lr}
bx lr

heart_Timer:
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
  bl clear_bit
  bl col2_234
  bl clear_bit
  bl col3_12345
  bl clear_bit
  bl col4_234
  bl clear_bit
  bl col5_3
  bl clear_bit
  cmp r9, 0
  bne diamond_pic

  pop {lr}
bx lr

heart_pic:
  push {lr}
  subs r9, r9, #1
  bl col1_234
  bl clear_bit
  bl col2_1234
  bl clear_bit
  bl col3_2345
  bl clear_bit
  bl col4_1234
  bl clear_bit
  bl col5_23
  bl clear_bit
  cmp r9, 0
  bne heart_pic

  pop {lr}
bx lr


 @Sets a bit both DIR and OUT to high

set_bit:
  @r0: offset of address
  @r1: the pin to set to high
  @r3: the pin already set to high
  @r4: base address of pin
  @r5: store bit 1 into register
  
  push {lr}
  ldr r3, [r4, r0]
  mov r5, 0b1
  lsl r5, r5, r1
  orr r3, r3, r5
  str r3, [r4, r0]

  pop {lr}
bx lr


@Clears entire board by pushing 0 into address

clear_bit:
  @r0: offset of address
  @r1: the pin to set to high
  @r3: the pin already set to high
  @r4: base address of pin
  @r5: store bit 1 into register
  
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