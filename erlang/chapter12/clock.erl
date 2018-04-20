%%%-------------------------------------------------------------------
%%%%%% @author dongsj
%%%%%% @copyright (C) 2018, <COMPANY>
%%%%%% @doc
%%%%%%
%%%%%% @end
%%%%%% Created : 19. 四月 2018 下午5:25
%%%%%%-------------------------------------------------------------------
-module(clock).
-author("dongsj").
%%%
%%%%% API
%%-export([start/0]).
-export([start/2]).
-export([start2/2]).
-export([stop/0]).
-export([stop2/1]).

%% start()	-> start(5000, fun() -> io:format("curtime is :~p~n",[erlang:now()]) end).
start2(Timer,Fun)->	register(clock2, spawn(fun() -> loop(Timer,Fun) end)).
start(Timer,Fun)->	spawn(?MODULE, loop , [Timer,Fun]).
stop2(Pid)	-> Pid ! stop.
stop()	-> clock ! stop.
loop(Timer,Fun)	->
	receive
		stop ->
			void
	after Timer	->
		Fun(),
		loop(Timer,Fun)
	end.
