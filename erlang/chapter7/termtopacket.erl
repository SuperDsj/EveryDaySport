-module(termtopacket).
-export([term_to_packet/1]).
-export([packet_to_term/1]).
-export([packet_to_term2/1]).
-export([term_to_packet1/1]).

term_to_packet(Term)	->
	Bin= term_to_binary(Term),
	<<_Head:32, Info/bitstring>> = Bin,
	Info.
term_to_packet1(Term)	->
	io:format("1 ~p~n",[Term]),	
	Bin = term_to_binary(Term),
	io:format("2 ~p~n",[Bin]),	
	Length = bit_size(Bin),
	io:format("3 ~p~n",[Length]),	
	Size = <<Length:1/unit:32>>,
	Size2 = <<Length:32>>,
	Size3 = <<Length:32/little>>,
	io:format("4 ~p~n",[Size]),	
	io:format("4 ~p~n",[Size2]),	
	io:format("4 ~p~n",[Size3]),	
	io:format("5 ~p~n",[<<Size/binary,Bin/binary>>]),	
	io:format("5 ~p~n",[<<Size2/binary,Bin/binary>>]),	
	io:format("5 ~p~n",[<<Size3/binary,Bin/binary>>]),
	<<Size/binary,Bin/binary>>.

%% 两个二进制型要想拼接到一起，需要进行binary处理，然后在合并起来

packet_to_term(Packet)	->
	io:format("1 ~p~n",[Packet]),
	<<_Head:32/bits, Info/bits>> = Packet,
	binary_to_term(Info).
packet_to_term2(Packet)	->
	io:format("1 ~p~n",[Packet]),
	<<_Head:4/binary, Info/binary>> = Packet,
	io:format("4 ~p~n",[_Head]),	
	io:format("4 ~p~n",[Info]),
	<<Length:32>> = _Head,	
	io:format("4 ~p~n",[Length]),
	binary_to_term(Info).

