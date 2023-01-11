-module(collatz_conjecture).

-export([steps/1]).


steps(N) when N > 0 -> collatz(N,0);
steps(N) when N =< 0 -> erlang:error(badarg).

collatz(1,Steps) -> Steps;
collatz(N,Steps) when N rem 2 =:= 0 -> collatz(round(N/2),Steps+1);
collatz(N,Steps) -> collatz(N*3 + 1,Steps+1).
