-module(supervisor_tpl).

-behaviour(supervisor).

-export([start_link/0, init/1]).
-include("otp_types.hrl").


-spec(start_link() -> {ok, pid()}).
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


-spec(init(gs_args()) -> sup_init_reply()).
init(_Args) ->
    SupervisorSpecification =
        #{strategy => one_for_one, % one_for_one | one_for_all | rest_for_one
          intensity => 10, % max restarts
          period => 1000 % in period of time
         },

    ChildSpecifications =
        [
         #{id => some_worker,
           start => {some_worker, start_link, []},
           restart => permanent, % permanent | transient | temporary
           shutdown => 2000, % milliseconds | brutal_kill | infinity
           type => worker, % worker | supervisor
           modules => [some_worker]
          }
        ],
    {ok, {SupervisorSpecification, ChildSpecifications}}.
