%%%-------------------------------------------------------------------
%%%%%% @author dongsj
%%%%%% @copyright (C) 2018, <COMPANY>
%%%%%% @doc
%%%%%%
%%%%%% @end
%%%%%% Created : 19. 四月 2018 下午7:01
%%%%%%-------------------------------------------------------------------
-module(sendMessage).
-author("dongsj").
%%%
%%%%% API
-export([start/2]).

start(N,M)	->
	sendstart(M,createProcess(N)).

createProcess(N)	->
%%%返回一个列表，都是创建的进程ID
	L = for(1,N,fun() -> spawn(fun() -> loop() end) end),
	io:format("Pid list:~p~n",[L]),
	L.

sendstart(M,L)	->
	Pid = getPid(1,L,M),
	io:format("sendstart Pid:~p~n",[Pid]),
	Pid ! {1,L,M,"hello world mylove guojuan"}.

getPid(I,L,M)	->
	io:format("**********************I:~p~n",[I]),
	case list_size(L) of
		Size when I =<Size ->
			lists:nth(I,L);
		Size when I>Size, I rem Size =:= 0 ->
			lists:nth(Size,L);
		Size when I > Size, I =< M ->
            		lists:nth((I rem Size), L);
		_Size when I>M	->
			none
	end.	
		
for(Max,Max ,F)	-> [F()];
for(I,Max,F)	->[F()|for(I+1,Max,F)].

list_size(L)		->
	list_size(L,0).
list_size([_|T],Size)	->
	list_size(T,Size+1);
list_size([],Size)	->
	Size.

loop()	->	
	receive
		{I,L,M,Message}	->
			io:format("I:~p,L:~p,M:~p,Message:~p~n",[I,L,M,Message]),
			io:format("Pid:~p Recv Message:~p~n",[(I rem list_size(L))+1,Message]),
			case getPid(I+1,L,M) of
				none	->	io:format("have send ... ~n");
				Pid	->	Pid ! {I+1,L,M,Message},
					loop()
			end
	end.
