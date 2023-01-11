-module(raindrops).

-export([convert/1,test/0]).

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
    dict:fetch_keys(get_dict()).

get_dict() ->
    dict:from_list([{3,"Pling"},{5,"Plang"},{7,"Plong"}]).

has_multiple(Number,Multiples) ->
    lists:any(fun(Mul) -> Number rem Mul =:= 0 end, Multiples).

test() ->
    "Pling" = raindrops:convert(129),
    "PlingPlang" = raindrops:convert(45),
    "PlingPlangPlong" = raindrops:convert(315),
    "PlingPlong" = raindrops:convert(21),
    "Plong" = raindrops:convert(7),
    ok.



    