-module(count_characters).
-export([count_characters/1,count_characters/2]).

count_characters(Str)	->
	count_characters(Str,#{}).

%% count_characters([H|T], #{ H := N }=X)->
%%	count_characters(T, X#{ H := N+1 });
%% count_characters([H|T], X)->
%%	count_characters(T, X#{ H => 1 });

count_characters([H|T], X) -> 
 count_characters(T, maps:put(H, maps:get(H, X, 0) + 1, X));
%% maps:get(H,X,0),如果没有则赋值为0，在使用maps:put,改变映射的关系中的值,maps:put(H,1,X)
count_characters([], X)	->
	X.
