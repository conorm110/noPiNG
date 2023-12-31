org 100h 
    section .text
    jmp main
    %include "game_p2.asm"
    %include "game_physics.asm"
    %include "game_graphics.asm"
    %include "system.asm" 
main:
    call set_vga
    call set_repeat_rate

    ; SET NEW RANDOM DIRECTION FOR BALL
    set_ball_random_velocity:
        xor ah, ah   ; interrupt to get sys time
        int 0x1A     ; cx:dx = clock ticks since midnight
        mov ax, dx   ; prepare to divide dx by something
        xor dx, dx   ; avoids SIGFPE err
        mov cx, 4h   ;
        div cx       ; clock ticks / 4
        cmp dx, 0x00 ; check if 0
        je .l0
        cmp dx, 0x01 ; check if 1
        je .l1
        cmp dx, 0x02 ; check if 2
        je .l2
        jmp .l3      ; only other possible remainder is 3
        .l0:
            ; send ball top left
            mov word[ball_x_pos_velocity], 0
            mov word[ball_x_neg_velocity], 2
            mov word[ball_y_pos_velocity], 2
            mov word[ball_y_neg_velocity], 0
            jmp .done
        .l1:
            ; send ball bottom right
            mov word[ball_x_pos_velocity], 2
            mov word[ball_x_neg_velocity], 0
            mov word[ball_y_pos_velocity], 0
            mov word[ball_y_neg_velocity], 2
            jmp .done
        .l2:
            ; send ball bottom left
            mov word[ball_x_pos_velocity], 0
            mov word[ball_x_neg_velocity], 2
            mov word[ball_y_pos_velocity], 0
            mov word[ball_y_neg_velocity], 2
            jmp .done
        .l3:
            ; send ball top right
            mov word[ball_x_pos_velocity], 2
            mov word[ball_x_neg_velocity], 0
            mov word[ball_y_pos_velocity], 2
            mov word[ball_y_neg_velocity], 0
        .done:
            
    ; RESET BALL POSITION
    mov word[ball_x_loc], 0x0140 ; middle x location
    mov word[ball_y_loc], 0x00f0 ; middle y location
    
    call draw_left_paddle
    call draw_right_paddle

game_loop:
    user_input_handler:
        mov ax, 0100h       ; check state of keyboard buffer
        int 16h             ; keyboard interrupt
        jz .done            ; check zf to see if there is a keystroke to handle
        mov ah, 00h         ; read keyboard
        int 16h             ; keyboard interrupt
        cmp al, 0x77        ; w key (up)
        je .new_up_input    ; if w key pressed, move paddle up
        cmp al, 0x73        ; s key (down)
        je .new_down_input  ; if s key pressed, move paddle down
        jmp .done           ; if other key being pressed skip to end
        .new_up_input: 
            call draw_left_paddle_up
            jmp .done
        .new_down_input:
            call draw_left_paddle_down
        .done:
    
    call computer_player
    call ball_physics 
    call draw_ball
    call single_tick_delay

    mov dx, [ball_x_loc]
    cmp dx, 0x90 ; 0x10 is leftmost position, give a little delay before going back to black background
    jne game_loop
    xor bx, bx
    mov ah, 0xb
    int 10h
    jmp game_loop

game_loss:
    push 0x9
    mov bl, 0x4 ; set background to green
    xor bh, bh
    mov ah, 0xb
    int 10h
    call delay ; let the player sit in shame for a second
    jmp main
 game_won:
    push 0x9
    call delay
    jmp main

section .data
    ; 0xA,0xA,0x4A,0x3,0x0A,0x3, 0xf, 0x1fff 
    left_paddle_location: dw 0xA
    right_paddle_location: dw 0xA
    left_paddle_size: dw 0x7F
    right_paddle_size: dw 0x40
    base_velocity dw 0x2
    ball_size dw 0x0A
    comp_paddle_speed: dw 0x2
    user_paddle_speed: dw 0x17
    game_speed: dw 0x0caf

section .bss
    ball_x_pos_velocity resb 2
    ball_x_neg_velocity resb 2
    ball_y_pos_velocity resb 2
    ball_y_neg_velocity resb 2
    ball_x_loc resb 2
    ball_y_loc resb 2