-module(math_functions).
-export([odd/1,even/1]).
-export([filter/2]).
-export([split/1]).
-export([split2/2]).

odd(X) when is_integer(X)	->
	case (X rem 2) of
		1 -> true;
		0 -> false
	end.
even(X) when is_integer(X) 	->
	case (X rem 2) of
		1 -> false;
		0 -> true
	end.

filter(F,L)	->
	[X|| X<-L,F(X) =:= true].

split(L)	->
	split_acc(L,[],[]).
split_acc([H|T],Odd,Even)	->
	case (H rem 2 =:= 0) of
		true  ->split_acc(T,[H|Odd],Even);
		false ->split_acc(T,Odd,[H|Even])
	end;
split_acc([],Odd,Even)		->
	{Odd,Even}.

split2(F,L) ->
	{[X|| X<-L,F(X) =:= true],[Y|| Y<-L,F(Y) =:= false]}.
