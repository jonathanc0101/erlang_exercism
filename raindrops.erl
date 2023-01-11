-module(raindrops).

-export([convert/1]).

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
    L = [3,5,7],
    L.

get_dict() ->
    D = [{3,"Pling"},{5,"Plang"},{7,"Plong"}],
    dict:from_list(D).

has_multiple(Number,Multiples) ->
    Amount = length(lists:filter(fun(Mul) -> Number rem Mul =:= 0 end, Multiples)),
    if 
        Amount >= 1 -> true;
        Amount < 1 -> false
    end.
