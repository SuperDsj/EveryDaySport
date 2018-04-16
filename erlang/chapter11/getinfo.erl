-module(getinfo).
-export([list_size/1]).
-export([get_info/0]).
-export([get_fun/0]).

list_size(L)    ->
        list_size(L, -1).
list_size([_H|T], Size) ->
        list_size(T, Size+1);
list_size([], Size)     ->
        Size.

get_info()      ->
        Info = code:all_loaded(),
        get_info(Info, -1, "").

get_info([H|T], Max, MaxName)   ->
        {Name,_} = H,
        [{exports, L}, _, _, _] =Name:module_info(),
        Counts = list_size(L),
        case Counts >= Max of
                true    ->get_info(T, Counts, Name);
                false   ->get_info(T, Max, MaxName)
        end;
get_info([], Max, MaxName)      ->
        {MaxName, Max}.

get_fun()	->
	Info = code:all_loaded(),
	get_fun(Info, #{}).
get_fun([H|T], X)	->
	{FunName, _} = H,
	[{exports, L}, _, _, _] = FunName:module_info(),
	get_fun(T, count_function(L, X));
get_fun([], X)	->
	%% find_max(X).
	find_one(X).
find_one(X)	->
	L=maps:keys(X),
	lists:filter(fun(E)	->{ok,Value} =maps:find(E,X),Value =:= 1 end , L).	
%%count_function([H|T], X)	->
%%	{Fname, _} = H,
%%	case maps:is_key(Fname, X) of 
%%		true  -> #{Fname := Count} = X,
%%              	count_function(T, X#{Fname := Count+1});
%%		false	-> count_function(T, X#{Fname => 1})
%%	end;	
count_function([H|T], X) ->
    {FuncName, _} = H,
    case maps:is_key(FuncName, X) of
        false -> count_function(T, maps:put(FuncName, 1, X));
        true  -> %% #{FuncName := Count} = X,
		Count=maps:get(FuncName, X),
                count_function(T, maps:put(FuncName, Count+1, X))
    end;	
count_function([],X)	->
	X.

find_max(X)	->
	L= maps:keys(X),	
	find_max(L, X, "", -1).
find_max([H|T], X, MaxKey,MaxValue)	->
	{ok, Value} =maps:find(H,X),
	case Value >= MaxValue of
		true	-> find_max(T, X, H, Value);
		false	-> find_max(T, X, MaxKey, MaxValue)
	end;
find_max([],_X, MaxKey, MaxValue)	->
	{MaxKey, MaxValue}.
