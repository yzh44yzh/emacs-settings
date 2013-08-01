-module(supervisor_tpl).
-author('Yura Zhloba <yzh44yzh@gmail.com>').

-behaviour(supervisor).

-export([start_link/0, init/1]).


start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


init([]) ->
    RestartStrategy = one_for_one, % one_for_one | one_for_all | rest_for_one
    MaxRestarts = 10,
    MaxSecondsBetweenRestarts = 60,
    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

    Restart = permanent, % permanent | transient | temporary
    Shutdown = 2000,     % brutal_kill | int() >= 0 | infinity
    Type = worker,       % worker | supervisor

    AChild = {'AName', % used to identify the child spec internally by the supervisor
	      {'AModule', start_link, []}, % StartFun = {M, F, A}
	      Restart, Shutdown, Type, 
	      ['AModule']}, % Modules  = [Module] | dynamic

    {ok, {SupFlags, [AChild]}}.

