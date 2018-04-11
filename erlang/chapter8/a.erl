-module(a).
-compile(export_all).

start(Tag,Times)	->
	spawn(fun()	->loop(Tag,Times) end).

loop(Tag,Times)	->
	sleep(Times),
	Val=b:x(),
	io:format("Vsn3 (~p) b:x = ~p~n",[Tag,Val]),
	loop(Tag,Times).

sleep(Times)	->
	receive
		after Times -> true
	end.
