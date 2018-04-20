-module(area_server).
-export([loop/2]).
-export([start/2]).
-export([area/2]).
-export([stop/1]).

-define(SERVER, ?MODULE).
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

start(Timer,Fun) ->
        spawn(?MODULE, loop, [Timer,Fun]).
area(Pid, What) ->
        io:format("area Pid:~p~n",[Pid]),
        rpc(Pid, What).
rpc(Pid, Request)       ->
        Pid ! {self(), Request},
        io:format("rpc Pid:~p~n",[Pid]),
        io:format("rpc self():~p~n",[self()]),
        receive
                {Pid, Response} ->
        		io:format("receive Pid:~p~n",[Pid]),
                        Response
        end.
stop(Pid)	->
        io:format("stop process Pid is:~p~n",[Pid]),
	%%rpc(Pid,).
	Pid ! {self(),stoped},
        receive
                {Pid, Response} ->
        		io:format("stop process receive Pid:~p~n",[Pid]),
                        Response
        end.

loop(Timer,Fun)  ->
        receive
		{From, stoped}	->
			io:format("loop stop From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        From ! {self(), "the process is stoped"},
                        io:format("loop from self():~p~n",[self()]);
                {From, {rectangle, Width, Height}}      ->
                        io:format("loop Rectangle From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        From ! {self(), Width*Height},
                        loop(Timer,Fun);
                {From, {square, R}}     ->
                        io:format("loop Squre From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        From ! {self(), 3.1415926*R*R},
                        loop(Timer,Fun);
                {From, Other}   ->
                        io:format("loop Other From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        %% From ! {self(), {error,Other}},
                        From ! {self(), {"try other function",Other}},
                        loop(Timer,Fun)
	after Timer ->
		io:format("timer:~p out ~n",[Timer]),
		loop(Timer,Fun)
        end.
