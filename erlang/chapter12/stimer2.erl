-module(stimer2).
-export([start/2,cannel/1]).

start(Timer,Fun)	-> spawn(stimer2, timer2, [Timer,Fun]).
cannel(Pid)		-> Pid ! cannel.
timer2(Timer,Fun)	->
	receive
		cannel ->
			void
	after Timer ->
		Fun(),
		timer2(Timer,Fun)
	end.

%% Pid = stimer:start(5000,fun()-> io:format("timer event ~n") end).
%%
