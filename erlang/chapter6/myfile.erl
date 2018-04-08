-module(myfile).
-export([read/1]).

read(File) ->
	try file:read_file(File) of
		{ok,Content}   -> Content;
		{error,Reason} -> throw(Reason)
	catch
		throw:X -> io:format("throw Reason is :~p~n",[X]);
		error:X -> io:format("error Reason is :~p~n",[X]);
		exit:X  -> io:format("exit Reason is :~p~n",[X])
	end.
