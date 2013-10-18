-module(gen_server_tpl).
-author('Yura Zhloba <yzh44yzh@gmail.com>').

-behavior(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(ERROR(Format, Data), error_logger:error_msg(Format, Data)).

-record(state, {
	 }).


%%% module API

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).




%%% gen_server API

init([]) ->
    {ok, #state{}}.


handle_call({tag, _Data}, _From, State) ->
    Reply = ok,
    {reply, Reply, State};

handle_call(Any, _From, State) ->
    ?ERROR("unknown call ~p in ~p ~n", [Any, ?MODULE]),
    {noreply, State}.


handle_cast({tag, _Data}, State) ->
    {noreply, State};

handle_cast(Any, State) ->
    ?ERROR("unknown cast ~p in ~p ~n", [Any, ?MODULE]),
    {noreply, State}.


handle_info(Request, State) ->
    ?ERROR("unknown info ~p in ~p ~n", [Request, ?MODULE]),
    {noreply, State}.


terminate(_Reason, _State) ->
    ok.


code_change(_OldVersion, State, _Extra) ->
    {ok, State}.	

