-module(stimer).
-export([start/2,cannel/1]).

start(Timer,Fun)	-> spawn(fun() -> timer(Timer,Fun) end).
cannel(Pid)		-> Pid ! cannel.
timer(Timer,Fun)	->
	receive
		cannel ->
			void
	after Timer ->
		Fun()
	end.

%% Pid = stimer:start(5000,fun()-> io:format("timer event ~n") end).
%%
