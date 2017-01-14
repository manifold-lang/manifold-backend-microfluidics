( set-logic QF_NRA )
( declare-fun PI ( ) Real )
( declare-fun junction0_pos_x ( ) Real )
( declare-fun junction0_pos_y ( ) Real )
( declare-fun junction0_epsilon ( ) Real )
( declare-fun junction0_pressure ( ) Real )
( declare-fun junction0_continuous_pressure ( ) Real )
( declare-fun junction0_dispersed_pressure ( ) Real )
( declare-fun junction0_output_pressure ( ) Real )
( declare-fun channelE_droplet_volume ( ) Real )
( declare-fun channelC_max_droplets ( ) Real )
( declare-fun channelC_droplet_resistance ( ) Real )
( declare-fun channelC_resistance ( ) Real )
( declare-fun channelC_width ( ) Real )
( declare-fun channelC_height ( ) Real )
( declare-fun channelC_viscosity ( ) Real )
( declare-fun channelC_length ( ) Real )
( declare-fun channelD_max_droplets ( ) Real )
( declare-fun channelD_droplet_resistance ( ) Real )
( declare-fun channelD_resistance ( ) Real )
( declare-fun channelD_width ( ) Real )
( declare-fun channelD_height ( ) Real )
( declare-fun channelD_viscosity ( ) Real )
( declare-fun channelD_length ( ) Real )
( declare-fun channelE_max_droplets ( ) Real )
( declare-fun channelE_droplet_resistance ( ) Real )
( declare-fun channelE_resistance ( ) Real )
( declare-fun channelE_width ( ) Real )
( declare-fun channelE_height ( ) Real )
( declare-fun channelE_viscosity ( ) Real )
( declare-fun channelE_length ( ) Real )
( declare-fun out0_pos_x ( ) Real )
( declare-fun out0_pos_y ( ) Real )
( declare-fun out0_input_pressure ( ) Real )
( declare-fun in0_pos_x ( ) Real )
( declare-fun in0_pos_y ( ) Real )
( declare-fun in0_output_pressure ( ) Real )
( declare-fun in1_pos_x ( ) Real )
( declare-fun in1_pos_y ( ) Real )
( declare-fun in1_output_pressure ( ) Real )
( declare-fun channelC_flowrate ( ) Real )
( declare-fun channelD_flowrate ( ) Real )
( declare-fun channelE_flowrate ( ) Real )
( assert ( = PI 3.141592653589793 ) )
( assert ( > out0_pos_x 0.0 ) )
( assert ( > out0_pos_y 0.0 ) )
( assert ( < out0_pos_x 0.1 ) )
( assert ( < out0_pos_y 0.1 ) )
( assert ( > in0_pos_x 0.0 ) )
( assert ( > in0_pos_y 0.0 ) )
( assert ( < in0_pos_x 0.1 ) )
( assert ( < in0_pos_y 0.1 ) )
( assert ( > junction0_pos_x 0.0 ) )
( assert ( > junction0_pos_y 0.0 ) )
( assert ( < junction0_pos_x 0.1 ) )
( assert ( < junction0_pos_y 0.1 ) )
( assert ( > in1_pos_x 0.0 ) )
( assert ( > in1_pos_y 0.0 ) )
( assert ( < in1_pos_x 0.1 ) )
( assert ( < in1_pos_y 0.1 ) )
( assert ( <= 0.9924038765060548 ( / ( ^ ( + ( * ( - out0_pos_x junction0_pos_x ) ( - in1_pos_x junction0_pos_x ) ) ( * ( - out0_pos_y junction0_pos_y ) ( - in1_pos_y junction0_pos_y ) ) ) 2.0 ) ( * ( + ( * ( - out0_pos_x junction0_pos_x ) ( - out0_pos_x junction0_pos_x ) ) ( * ( - out0_pos_y junction0_pos_y ) ( - out0_pos_y junction0_pos_y ) ) ) ( + ( * ( - in1_pos_x junction0_pos_x ) ( - in1_pos_x junction0_pos_x ) ) ( * ( - in1_pos_y junction0_pos_y ) ( - in1_pos_y junction0_pos_y ) ) ) ) ) ) )
( assert ( <= 0.9924038765060548 ( / ( ^ ( + ( * ( - in0_pos_x junction0_pos_x ) ( - in1_pos_x junction0_pos_x ) ) ( * ( - in0_pos_y junction0_pos_y ) ( - in1_pos_y junction0_pos_y ) ) ) 2.0 ) ( * ( + ( * ( - in0_pos_x junction0_pos_x ) ( - in0_pos_x junction0_pos_x ) ) ( * ( - in0_pos_y junction0_pos_y ) ( - in0_pos_y junction0_pos_y ) ) ) ( + ( * ( - in1_pos_x junction0_pos_x ) ( - in1_pos_x junction0_pos_x ) ) ( * ( - in1_pos_y junction0_pos_y ) ( - in1_pos_y junction0_pos_y ) ) ) ) ) ) )
( assert ( = ( + ( ^ ( - in0_pos_x junction0_pos_x ) 2 ) ( ^ ( - in0_pos_y junction0_pos_y ) 2 ) ) ( ^ channelC_length 2 ) ) )
( assert ( = ( + ( ^ ( - junction0_pos_x out0_pos_x ) 2 ) ( ^ ( - junction0_pos_y out0_pos_y ) 2 ) ) ( ^ channelE_length 2 ) ) )
( assert ( = ( + ( ^ ( - in1_pos_x junction0_pos_x ) 2 ) ( ^ ( - in1_pos_y junction0_pos_y ) 2 ) ) ( ^ channelD_length 2 ) ) )
( assert ( >= channelC_length 1.0E-4 ) )
( assert ( >= channelD_length 1.0E-4 ) )
( assert ( >= channelE_length 1.0E-4 ) )
( assert ( > channelC_flowrate 0 ) )
( assert ( > channelD_flowrate 0 ) )
( assert ( > channelE_flowrate 0 ) )
( assert ( = channelC_width channelE_width ) )
( assert ( = channelC_height channelD_height ) )
( assert ( = channelC_height channelE_height ) )
( assert ( >= junction0_epsilon 0 ) )
( assert ( = junction0_pressure junction0_continuous_pressure ) )
( assert ( = junction0_pressure junction0_dispersed_pressure ) )
( assert ( = junction0_pressure junction0_output_pressure ) )
( assert ( = ( + channelC_flowrate channelD_flowrate ) ( + channelE_flowrate ) ) )
( assert ( = ( + channelC_flowrate_worst_case channelD_flowrate_worst_case ) ( + channelE_flowrate_worst_case ) ) )
( assert ( = channelC_viscosity channelE_viscosity ) )
( assert ( = channelE_droplet_volume ( * ( * channelC_height ( * channelC_width channelC_width ) ) ( + ( - ( * 0.375 PI ) ( * ( * ( / PI 2 ) ( - 1 ( / PI 4 ) ) ) ( / channelC_height channelC_width ) ) ) ( * ( * ( - 1 ( / PI 4 ) ) ( * ( ^ ( - 1 0.1 ) -1 ) ( + ( - ( ^ ( / ( + channelC_width ( + ( - channelD_width ( - ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) junction0_epsilon ) ) ( ^ ( * 2 ( * ( - channelD_width ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) ) ( - channelC_width ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) ) ) ) 0.5 ) ) ) channelC_width ) 2 ) ( ^ ( / channelC_width channelC_width ) 2 ) ) ( * ( / PI 4 ) ( * ( - ( / ( + channelC_width ( + ( - channelD_width ( - ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) junction0_epsilon ) ) ( ^ ( * 2 ( * ( - channelD_width ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) ) ( - channelC_width ( / ( * channelC_height channelC_width ) ( + channelC_height channelC_width ) ) ) ) ) 0.5 ) ) ) channelC_width ) ( / channelC_width channelC_width ) ) ( / channelC_height channelC_width ) ) ) ) ) ) ( / channelD_flowrate channelC_flowrate ) ) ) ) ) )
( assert ( > channelC_resistance 0.0 ) )
( assert ( > channelC_width 0.0 ) )
( assert ( > channelC_height 0.0 ) )
( assert ( > channelC_viscosity 0.0 ) )
( assert ( > channelC_length 0.0 ) )
( assert ( = channelC_resistance ( / ( * 12.0 ( * channelC_viscosity channelC_length ) ) ( * channelC_width ( * ( ^ channelC_height 3.0 ) ( - 1.0 ( * 0.63 ( / channelC_height channelC_width ) ) ) ) ) ) ) )
( assert ( < channelC_height channelC_width ) )
( assert ( > channelD_resistance 0.0 ) )
( assert ( > channelD_width 0.0 ) )
( assert ( > channelD_height 0.0 ) )
( assert ( > channelD_viscosity 0.0 ) )
( assert ( > channelD_length 0.0 ) )
( assert ( = channelD_resistance ( / ( * 12.0 ( * channelD_viscosity channelD_length ) ) ( * channelD_width ( * ( ^ channelD_height 3.0 ) ( - 1.0 ( * 0.63 ( / channelD_height channelD_width ) ) ) ) ) ) ) )
( assert ( < channelD_height channelD_width ) )
( assert ( > channelE_resistance 0.0 ) )
( assert ( > channelE_width 0.0 ) )
( assert ( > channelE_height 0.0 ) )
( assert ( > channelE_viscosity 0.0 ) )
( assert ( > channelE_length 0.0 ) )
( assert ( = channelE_resistance ( / ( * 12.0 ( * channelE_viscosity channelE_length ) ) ( * channelE_width ( * ( ^ channelE_height 3.0 ) ( - 1.0 ( * 0.63 ( / channelE_height channelE_width ) ) ) ) ) ) ) )
( assert ( < channelE_height channelE_width ) )
( assert ( <= 0 out0_input_pressure ) )
( assert ( <= 0 in0_output_pressure ) )
( assert ( = channelC_viscosity 0.01 ) )
( assert ( <= 0 in1_output_pressure ) )
( assert ( = channelD_viscosity 0.001 ) )
( assert ( = ( - in0_output_pressure junction0_continuous_pressure ) ( * channelC_flowrate channelC_resistance ) ) )
( assert ( = ( - in1_output_pressure junction0_dispersed_pressure ) ( * channelD_flowrate channelD_resistance ) ) )
( assert ( = ( - junction0_output_pressure out0_input_pressure ) ( * channelE_flowrate channelE_resistance ) ) )
( check-sat )
( exit )
