kol2(X,Z1,K):-
    Z2 is Z1-1,
    (Z1 =\= 0 ->
    (X mod Z1 =/= 0, Z1 mod 3 =:= 0 ->K1 is K; K1 is K + 1), kol2(X,Z2,K1);
    answer(K)).
kol(X):- Z is X, kol2(X,Z,0).



posled(1,1):-!.
posled(X,N):-
    X mod 2 =:= 0, X1 is X div 2,posled(X1,N1),N is N1+1,!;
    X mod 2 =\= 0, X1 is X*3 + 1,posled(X1,N1),N is N1+1,!.

list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],X,N):-list_el_numb(List,X,N1),N is N1+1.

1.11
u_n(_,[]):-!.
u_n(X,[H|T]):- X =\= H,u_n(X,T).
unique_num([H|T]):-u_n(H,T),unique_num((T)).
unique_num([]):-!.

1.2
min_list_up([H],H,1):-!.
min_list_up([H|T], Min,N):-N1 is N - 1,min_list_up(T,Min1,N1),(H<Min1 -> Min is H;Min is Min1, N is N1).

1.10
order([],[],0):-!.
order([H1|List1],[H|List],Kol):-p(List1,List,Kol1),H1 =:= H,Kol is Kol1 + 1.

1.31
counter([],Count,Count):-!.
counter([H|T],Num,Count) :-
    (H mod 2 =:= 0 -> NewNum is Num+1;NewNum is Num),
    counter(T,NewNum,Count).
counter(List,Count):-counter(List,0,Count).


