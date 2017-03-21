( set-logic QF_NRA )
( declare-fun PI ( ) Real )
( declare-fun channel0.max_droplets ( ) Real )
( declare-fun channel0.droplet_resistance ( ) Real )
( declare-fun channel0.resistance ( ) Real )
( declare-fun channel0.width ( ) Real )
( declare-fun channel0.height ( ) Real )
( declare-fun channel0.viscosity ( ) Real )
( declare-fun channel0.length ( ) Real )
( declare-fun out0.pos_x ( ) Real )
( declare-fun out0.pos_y ( ) Real )
( declare-fun out0.input.pressure ( ) Real )
( declare-fun in0.pos_x ( ) Real )
( declare-fun in0.pos_y ( ) Real )
( declare-fun in0.output.pressure ( ) Real )
( declare-fun channel0.flowrate ( ) Real )
( assert ( = PI 3.141592653589793 ) )
( assert ( > out0.pos_x 0.0 ) )
( assert ( > out0.pos_y 0.0 ) )
( assert ( < out0.pos_x 0.04 ) )
( assert ( < out0.pos_y 0.04 ) )
( assert ( > in0.pos_x 0.0 ) )
( assert ( > in0.pos_y 0.0 ) )
( assert ( < in0.pos_x 0.04 ) )
( assert ( < in0.pos_y 0.04 ) )
( assert ( = ( + ( ^ ( - in0.pos_x out0.pos_x ) 2 ) ( ^ ( - in0.pos_y out0.pos_y ) 2 ) ) ( ^ channel0.length 2 ) ) )
( assert ( >= channel0.length 1.0E-4 ) )
( assert ( > channel0.resistance 0.0 ) )
( assert ( > channel0.width 0.0 ) )
( assert ( > channel0.height 0.0 ) )
( assert ( > channel0.viscosity 0.0 ) )
( assert ( > channel0.length 0.0 ) )
( assert ( = channel0.resistance ( / ( * 12.0 ( * channel0.viscosity channel0.length ) ) ( * channel0.width ( * ( ^ channel0.height 3.0 ) ( - 1.0 ( * 0.63 ( / channel0.height channel0.width ) ) ) ) ) ) ) )
( assert ( < channel0.height channel0.width ) )
( assert ( <= 0 out0.input.pressure ) )
( assert ( <= 0 in0.output.pressure ) )
( assert ( = channel0.viscosity 0.001002 ) )
( assert ( = ( - in0.output.pressure out0.input.pressure ) ( * channel0.flowrate channel0.resistance ) ) )
( check-sat )
( exit )
