org 00h
motor  equ p2.0
motor1 equ p2.3
switch equ p2.6

again:
  setb motor
  setb motor1
  setb switch
  mov r3, #01h
  mov r4, #01h

monitor:
  setb motor
  setb motor1
  jb   switch, monitor;
  sjmp rot_motor
  sjmp rot_motor1
  sjmp monitor

rot_motor:
  clr   motor
  acall wait
  setb  motor
  acall wait  
  djnz r3, rot_motor
  
rot_motor1:
  clr   motor1
  acall wait
  setb  motor1
  acall wait
  djnz r4, rot_motor1

  sjmp again

wait:
       mov r0,#10h
here3: mov r1,#0ffh
here2: mov r2,#0ffh
here: djnz r2, here
      djnz r1, here2
      djnz r0, here3
ret
end
