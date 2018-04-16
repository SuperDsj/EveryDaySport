-module(test).
-export(foo/1).

-define(macro1(X, Y),{a, X, Y}).

foo(A)	->
	?macro1(A+10,b).

