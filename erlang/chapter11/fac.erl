-module(fac).
-export([fac/1]).
-export([main/1]).

main(A)->
	I=A,
	io:format("fac :"),
	fac(I).
fac(0)	->1;
fac(N)	-> fac(N-1)*N.
