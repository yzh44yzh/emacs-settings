-module(cowboy_handler_tpl).
-behaviour(cowboy_http_handler).

-export([init/3, handle/2, terminate/3]).


-spec init(atom(), cowboy_req:req(), list()) -> {ok, cowboy_req:req(), term()}.
init(_, Req, []) ->
    {ok, Req, no_state}.



-spec handle(cowboy_req:req(), term()) -> {ok, cowboy_req:req(), term()}.
handle(Req, State) ->
    Body = <<"Hello">>,
    Headers = [{<<"Content-Type">>, <<"text/html;charset=UTF-8">>}],
    {ok, Req1} = cowboy_req:reply(200, Headers, Body, Req),
    {ok, Req1, State}.


-spec terminate(term(), cowboy_req:req(), term()) -> ok.
terminate(_Reason, _Req, _State) ->
    ok.
