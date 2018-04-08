-module(count_characters).
-export([count_characters/1,count_characters/2]).

count_characters(Str)	->
	count_characters(Str,#{}).

count_characters([Head|T], #{ Head := N }=X)->
	count_characters(T, X#{ Head := N+1 });
count_characters([Head|T], X)->
	count_characters(T, X#{ Head => 1 });
count_characters([], X)	->
	X.
