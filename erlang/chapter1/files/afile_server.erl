-module(afile_server).
-export([start/1,loop/1]).

start(Dir)-> spawn(afile_server,loop,[Dir]).

loop(Dir)->
	receive
		{Client,list_dir}-> Client ! {self(),file:list_dir(Dir)};
		{Client,{get_file,File}}-> Full=filename:join(Dir,File), Client ! {self(),file:read_file(Full)};
		{Client,{put_file,File}}-> Full=filename:join(Dir,File), Data=list_to_binary(File), file:write_file(Full,Data,[binary]), file:close(Full), Client ! {self(),"put_file saved"};
		{Client,{set_file,File,Content}}-> Full=filename:join(Dir,File), Data=list_to_binary(Content), file:write_file(Full,Data,[binary]), file:close(Full), Client ! {self(),"set_file saved"}
	end,
	io:format("goto loop~n"),
	loop(Dir).
