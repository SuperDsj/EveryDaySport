-module(attrs).
-compile(export_all).
-vsn("v1.1").
-author({shujun,dong}).

fac(1)	-> 1;
fac(N)	->
	N*fac(N-1).
acc(1)	-> 1;
acc(N)	->
	N + acc(N-1).
