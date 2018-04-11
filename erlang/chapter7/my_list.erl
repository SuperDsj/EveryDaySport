-module(my_list).
-export([convertbit/1,convertbyte/1]).
-export([convertbit2/1,convertbyte2/1]).
-export([convertbyte3/1,convertbyte4/1]).

-export([convertbit1/1]).

convertbyte(Bin)	->
	convertbyte(Bin, <<>>, 1).
convertbyte(Bin, RetBin,Pos) when Pos =< byte_size(Bin) 	->
	{Bin1, Bin2}= split_binary(Bin, Pos),
	convertbyte(Bin2, list_to_binary([Bin1,RetBin]) ,Pos);
convertbyte(Bin, RetBin,Pos) when Pos > byte_size(Bin) 	->
	RetBin.
%% 列表解析，位推导不会翻转数量，只有尾递归会翻转或者翻转函数
convertbyte2(Bin)	->
	 <<  <<X>> || <<X:8>> <=Bin >>.
convertbyte3(Bin)	->
	convertbyte3(binary_to_list(Bin),[]).
convertbyte3([H|T],RetBin)	->
	io:format("~p~n",[RetBin]),
	convertbyte3(T,[H|RetBin]);	
convertbyte3([],RetBin)	->
	list_to_binary(RetBin).

convertbyte4(Bin)	->
	 list_to_binary(lists:reverse(binary_to_list(Bin))).

%% 正序显示所有二进制中的字节
convertbit(Bin)	->
	<< <<X>> || <<X:1>> <=Bin >>.

%%倒序显示所有二进制中的字节
convertbit1(Bin)	->
	%% list_to_binary(lists:reverse([ X || <<X:1>> <=Bin ])).
	[begin io:format("~p~n",[X]), X end || <<X:1>> <=Bin ].
convertbit2(Bin)	->
	list_to_binary(lists:reverse([ <<X>> || <<X:1>> <=Bin ])).
