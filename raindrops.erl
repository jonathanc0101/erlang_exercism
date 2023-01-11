-module(raindrops).

-export([convert/1,get_dict/0]).

convert(Number) -> case has_multiple(Number,get_multiples()) of
    true -> convertm(Number);
    false -> integer_to_list(Number)
end.

convertm(Number) -> 
    Lfiltered = lists:filter(fun(X) -> Number rem X =:= 0 end, get_multiples()),
    Dict = get_dict(),
    Lmapped = lists:map(fun(X) -> {ok,Res} = dict:find(X,Dict), Res end, Lfiltered),

    lists:flatten(Lmapped).


get_multiples()->
    dict:fetch_keys(raindrops:get_dict()).

get_dict() ->
    dict:from_list([{3,"Pling"},{5,"Plang"},{7,"Plong"}]).

has_multiple(Number,Multiples) ->
    lists:any(fun(Mul) -> Number rem Mul =:= 0 end, Multiples).
