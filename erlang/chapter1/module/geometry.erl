-module(geometry).
-export([area/1]).
-export([test/0]).
-export([perimeter/1]).

test()	->
	12=area({rectangle,3,4}),
	144=area({square,12}),
	tests_worked.

area({rectangle,Width,Height})		->Width*Height;
area({triangle,Width,Height})		->Width*Height/2;
area({cricle,R})			->3.1415926*R*R;
area({square,Side})			->Side*Side.

perimeter({rectangle,W,H})		->2*(W+H);
perimeter({triangle,W,H})		->T=math:sqrt(W*W+H*H),W+H+T;
perimeter({square,Side})		->4*Side;
perimeter({cricle,R})			->2*R*3.1415926.
