-module(tempconvert).
-export([tempconvert/1]).

tempconvert({c,C})->{f,32+C*9/5};
tempconvert({f,F})->{c,(F-32)*5/9}.

