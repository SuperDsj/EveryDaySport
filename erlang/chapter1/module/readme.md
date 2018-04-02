})->{f,32+C*9/5};({f,F})->{c,(F-32)*5/9} end.
L=[1,2,3,4,5,6,7,8,9].
lists:map(fun(X)->X*X end,L).
Even=fun(X)-> X rem 2 =:= 0 end.
lists:filter(Even,L).
Fun = fun(X) ->  case X rem 3 of  0 ->  {true, X - 2}; _->  false end end.
Fun3 = fun(X) ->  case X rem 3 of  0 ->  {true, X - 2}; _->  false end end.
Fun4 = fun(X) ->  case X rem 3 of  0 ->  true; _->  false end end.
Fun5 = fun(X) ->  case X rem 3 of  0 ->  {true,520}; _->  false end end.
lists:filtermap(Fun, [1,2,3,4,5,6,7,8,9,10,11,12,13,14]).  主要是Ｆｕｎ中的内容可以改变，函数是可以控制的，返回值为true，或者为{true,regm},如返回果为ｔtrue,最终的只为列表原值，如果是后一个，返回内容为regm;filter，只针对断言打函数进行留舍．

返回值为fun
Fruit=[apple,pear,orange].
MakeTest=fun(L)->(fun(X)-> lists:member(X,L) end ) end.
Isfruit=MakeTest(Fruit).
Isfruit(apple).
lists:filter传递的第一个参数是函数，类型是判断true or false,例如：lists:member, X rem 2,等断言或者bool类型返回值．
lists:filter(Isfruit,[dog,cat,apple,brana,pear,bear]).

