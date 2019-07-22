ORG 0000H
SETB P3.0				;Input for left sensor
SETB P3.1 				;Input for right sensor
AGAIN: JB P3.0,NEXT		;Left Sensor senses white light
JB P3.1,RIGHT			;Right sensor senses white light
FORWARD: CLR P2.0		;ROBOT MOVING FORWARD
SETB P2.1				;Left motor turned on
CLR P2.2
SETB P2.3				;Right motor turned on
SJMP AGAIN
RIGHT: CLR P2.0			;ROBOT TURNING RIGHT
SETB P2.1				;Left motor turned on
CLR P2.2
CLR P2.3				;Right motor stopped
SJMP AGAIN
NEXT: JB P3.1,STOP		;Right sensor senses white light
LEFT: CLR P2.0			;ROBOT TURNING LEFT
CLR P2.1				;Left motor stopped
CLR P2.2
SETB P2.3				;Right motor turned on
SJMP AGAIN
STOP: CLR P2.0			;STOPPING THE ROBOT
CLR P2.1				;Left motor stopped
CLR P2.2
CLR P2.3				;Right motor stopped
SJMP AGAIN
HERE: SJMP HERE			;Infinite looping
END