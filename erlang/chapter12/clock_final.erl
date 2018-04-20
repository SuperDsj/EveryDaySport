-module(clock_final).
-export([loop/2]).
-export([start/2]).
-export([stop/1]).
-export([stop/0]).

-define(SERVER, ?MODULE).
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

start(Timer,Fun) ->
        register(clock, spawn(?MODULE, loop, [Timer,Fun])).

stop() -> clock ! stop.

stop(Pid) -> Pid ! stop.

loop(Timer,Fun)  ->
        receive
		stop ->
			void
	after Timer ->
		io:format("timer:~p out ~n",[Timer]),
		Fun(),
		loop(Timer,Fun)
        end.
