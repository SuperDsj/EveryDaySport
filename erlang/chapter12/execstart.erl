%%%-------------------------------------------------------------------
%%%%%% @author dongsj
%%%%%% @copyright (C) 2018, <COMPANY>
%%%%%% @doc
%%%%%%
%%%%%% @end
%%%%%% Created : 19. 四月 2018 下午6:28
%%%%%%-------------------------------------------------------------------
-module(execstart).
-author("dongsj").
%%%
%%%%% API
-export([start/2]).
-export([create/2]).
%%%

start(AnAtom,Fun)	->
	case whereis(AnAtom)	of
		undefined	->	register(AnAtom, spawn(Fun)),
					io:format("this process name is :~p ,register~n",[AnAtom]);
		_Pid		->	io:format("this process name is :~p ,have registered ! ~n",[AnAtom])
	end.
create(AnAtom,Fun)	->
	start(AnAtom,Fun),
	start(AnAtom,Fun),
	start(AnAtom,Fun).

