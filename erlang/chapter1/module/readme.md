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

## 返回值为fun
Fruit=[apple,pear,orange].
MakeTest=fun(L)->(fun(X)-> lists:member(X,L) end ) end.
Isfruit=MakeTest(Fruit).
Isfruit(apple).
lists:filter传递的第一个参数是函数，类型是判断true or false,例如：lists:member, X rem 2,等断言或者bool类型返回值．
lists:filter(Isfruit,[dog,cat,apple,brana,pear,bear]).

Double=fun(X)->(2*X) end.
Mult=fun(Times)->(fun(X)-> X*Times end) end.  # 创建一个返回值为fun函数。
Tripule=Mult(4).							  # 初始化值返回函数的函数。初以始化的参数可以随意改变。
Tripule(6).									  # 调用对象函数，调用的时候里面的值。

## lib_misc中的for函数，是一个返回高阶函数的函数，传递进入的参数是一个函数，返回值仍然是一个函数，通过这个函数，达到了for语句的目的，至于for语句执行的内容，是根据传入的函数F进行计算的
lib_misc:for(1,20,fun(I)->I end).
lib_misc:for(1,20,fun(I)->I*I end).
lib_misc:for(1,20,fun(I)->I*I*I end).

## 简单列表处理,sum中的内容，为列表解析
mylists:sum([1,2,3,4,5,6,7,8,9,0]).
Double=fun(X)->(2*X) end.
Mult=fun(Times)->(fun(X)-> X*Times end) end.  # 创建一个返回值为fun函数。
Tripule=Mult(4).							  # 初始化值返回函数的函数。初以始化的参数可以随意改变。
Tripule(6).									  # 调用对象函数，调用的时候里面的值。

lib_misc:for(1,20,fun(I)->I end).
lib_misc:for(1,20,fun(I)->I*I end).
lib_misc:for(1,20,fun(I)->I*I*I end).

Buy=[{oranges,3},{newspaper,1},{apples,10},{pears,4},{milk,4},{dog,1}].

L=[1,2,3,4,5,6,7,8,9].
lists:map(fun(X)->X*X end, L).
[{Name,2*Number}||{Name,Number}<-Buy].
[shop:cost(Name)*Number||{Name,Number}<-Buy].
lists:sum([shop:cost(Name)*Number||{Name,Number}<-Buy]).
total2(L)       ->:q        sum([shop:cost(What)*N || {What,N} <- L]).
##列表推到，还可以用于过滤器，过滤符合要求的元祖，返回最后的原子或元组。
[X||{a,X}<-[{a,1},{b,2},{c,3},{a,4},{d,5},{e,6},a,hello,"wow"]].
[{a,X}||{a,X}<-[{a,1},{b,2},{c,3},{a,4},{d,5},{e,6},a,hello,"wow"]].

qsort([])       ->[];
qsort([Pivot|T])->qsort([X||X <-T,X <Pivot]) ++[Pivot]++ qsort([X||X<-T,X>=Pivot]).
pythag(N)       ->[{A,B,C}||A<-lists:seq(1,N),B<-lists:seq(1,N),C<-lists:seq(1,N),A+B+C =<N,A*A+B*B =:= C*C].

list_to_tuple([12,cat,"hello"]).



