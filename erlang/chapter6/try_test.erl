-module(try_test).
-export([generate/1]).
-export([demo1/0]).
-export([demo2/0]).
-export([demo3/0]).
-export([demo4/0]).

generate(1)     ->a;
generate(2)     ->throw(a);
generate(3)     ->exit(a);
generate(4)     ->{'EXIT',a};
generate(5)     ->error(a);
generate(6)     ->stop(a).

demo1() ->
        [catcher(I)|| I <- [1,2,3,4,5,6]].
demo2() ->
        [{I,(catch catcher(I))}|| I <- [1,2,3,4,5,6]].
demo3() ->
	try generate(5) 
	catch
		error:X ->
			{X,erlang:get_stacktrace()}
	end. 
demo4() ->
        [catcher4(I)|| I <- [1,2,3,4,5,6]].

stop(a) ->
	"I want stop the demo1".
catcher(N)->
	try generate(N) of
		Val -> {N,normal,Val}
	catch
		throw:X -> {N,caught,thrown,X};
		exit:X  -> {N,caught,exited,X};
		error:X -> {N,caught,error,X};
		stop:X  -> {N,caught,stoped,X}
	end.
catcher4(N)->
	try generate(N) of
		Val -> {N,normal,Val}
	catch
		throw:X -> {user, N, caught, thrown, X},{developer, X, erlang:get_stacktrace()};
		exit:X  -> {user, N, caught, exited, X},{developer, X, erlang:get_stacktrace()};
		error:X -> {user, N, caught, error, X},{developer, X, erlang:get_stacktrace()};
		stop:X  -> {user, N, caught, stoped, X},{developer, X, erlang:get_stacktrace()}
	end.
