-module(supervisor_tpl).
-author('Yura Zhloba <yzh44yzh@gmail.com>').

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxSecondsBetweenRestarts = 3600,

    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

    Restart = permanent,
    Shutdown = 2000,
    Type = worker,

    AChild = {'AName', {'AModule', start_link, []},
	      Restart, Shutdown, Type, ['AModule']},

    {ok, {SupFlags, [AChild]}}.

