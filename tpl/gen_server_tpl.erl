-module(gen_server_tpl).
-author('Yura Zhloba <yzh44yzh@gmail.com>').

-behavior(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).


%%% module API

start_link() ->
    gen_server:start_link(?MODULE, [], []).




%%% gen_server API

init([]) ->
	error_logger:info_msg("~p inited ~n", [?MODULE]),
	{ok, []}.


handle_call(Request, _From, State) ->
	error_logger:error_msg("unknown call ~p in ~p ~n", [Request, ?MODULE]),
	{noreply, State}.


handle_cast(Request, State) ->
	error_logger:error_msg("unknown cast ~p in ~p ~n", [Request, ?MODULE]),
	{noreply, State}.
	

handle_info(Request, State) ->
	error_logger:error_msg("unknown info ~p in ~n", [Request, ?MODULE]),
	{noreply, State}.


terminate(_Reason, _State) ->
    ok.


code_change(_OldVersion, State, _Extra) ->
    {ok, State}.	
