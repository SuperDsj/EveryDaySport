-module(my_tuple_to_list).
-export([tuple_to_listnew/1]).
-export([my_time_func/1,my_date_string/0]).

tuple_to_listnew(L)	->
	[element(X,L)||X<-lists:seq(1,tuple_size(L))].

my_time_func(F) ->
    %{MegaSecs1, Secs1, MicroSecs1} = erlang:now(),
    {Hour1, Minute1, Second1} = erlang:time(),
    F,
    %{MegaSecs2, Secs2, MicroSecs2} = erlang:now(),
    {Hour2, Minute2, Second2} = erlang:time(),
    io:format("runtime:~f~n", [((Hour2-Hour1)/3600+(Minute2-Minute1)/60+(Second2-Second1))/1000]).

my_date_string() ->
    {Year, Month, Day} = erlang:date(),
    {Hour, Minute, Second} = erlang:time(),
    io:format("~p年~p月~p日:~p时~p分~p秒~n", [Year, Month, Day, Hour, Minute, Second]).
