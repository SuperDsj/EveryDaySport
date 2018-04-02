-module(person).
-export([start/1,stop/0]).


start(Name)->
	spawn(Name,loop,[]).

stop()-> stop.

loop()->
	receive
		{_From,Message}-> io:format("the message is :~p~n",[Message])
	end,
	loop().
