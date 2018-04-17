-module(area_server_final).
-export([loop/0]).
-export([start/0]).
-export([area/2]).

-define(SERVER, ?MODULE).
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

start() ->
        io:format("start :~p~n",[?SERVER]),
        io:format("start :~p~n",[?MODULE]),
        spawn(?MODULE, loop, []).
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

loop()  ->
        receive
                {From, {rectangle, Width, Height}}      ->
                        io:format("loop Rectangle From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        From ! {self(), Width*Height},
                        loop();
                {From, {square, R}}     ->
                        io:format("loop Squre From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        From ! {self(), 3.1415926*R*R},
                        loop();
                {From, Other}   ->
                        io:format("loop Other From:~p~n",[From]),
                        io:format("loop self():~p~n",[self()]),
                        %% From ! {self(), {error,Other}},
                        From ! {self(), {"try other function",Other}},
                        loop()
        end.
