man(slava).
man(ivan).
man(artem).
man(ilya).
man(nikita).
man(andrey).
man(alexander).
man(artur).
man(yasha).
man(elizar).
man(enisey).
man(pavel).

woman(natasha).
woman(sveta).
woman(elena).
woman(anna).
woman(polina).
woman(daria).
woman(irina).
woman(nastya).
woman(olga).
woman(sophia).
woman(varvara).
woman(maria).

parent(slava,anna).
parent(natasha,anna).

parent(slava,nikita).
parent(natasha,nikita).

parent(slava,olga).
parent(natasha,olga).

parent(slava,elizar).
parent(natasha,elizar).


parent(ilya,alexander).
parent(irina,alexander).

parent(ivan,yasha).
parent(sveta,yasha).

parent(yasha,sophia).
parent(olga,sophia).

parent(ivan,varvara).
parent(sveta,varvara).

parent(elizar,enisey).
parent(varvara,enisey).

parent(elizar,pavel).
parent(varvara,pavel).

parent(elizar,maria).
parent(varvara,maria).

parent(ivan,artem).
parent(sveta,artem).

parent(ivan,elena).
parent(sveta,elena).

parent(artem,ilya).
parent(anna,ilya).

parent(artem,polina).
parent(anna,polina).

parent(nikita,daria).
parent(elena,daria).

parent(nikita,andrey).
parent(elena,andrey).

brother1(X,Y):-parent(Z,X),parent(Z,Y),man(Z),man(Y).
wife1(X,Y):-parent(X,Z),parent(Y,Z),woman(Y),!.
brother_wife(X):-wife1(X,Y),brother1(Y,Z),write(Z),nl,fail.
husband1(X,Y):-parent(X,Z),parent(Y,Z),man(Y),!.
brother_husband(X):-husband1(X,Y),brother1(Y,Z),write(Z),nl,fail.













father(X,Y):-parent(X,Y),man(X),write(yes),nl,fail.
father(X):-parent(Y,X),man(Y),write(Y),nl,fail.

wife(X,Y):-woman(X),parent(X,Z),parent(Y,Z),write(yes),nl,!,fail.
wife(X):-man(X),parent(X,Z),parent(Y,Z),woman(Y),write(Y),nl,!,fail.

grand_da(X,Y):-woman(X),parent(Y,Z),parent(Z,X),write(yes),nl,fail.
grand_dats(X):-parent(X,Z),parent(Z,Y),woman(Y),write(Y),nl,fail.

grand_ma_and_son(X,Y):-parent(X,Z),parent(Z,Y),woman(X),man(Y),write(yes),nl,fail;parent(Y,Z),parent(Z,X),woman(Y),man(X),write(yes),nl,fail.


prU(0,1):-!.
prU(X,P):-
    X1 is X div 10,
    prU(X1,P1),
    P is P1*(X mod 10).

pr2(0,P,P):-!.
pr2(X1,P1,P):-X2 is X1 div 10, P2 is P1 * (X1 mod 10),pr2(X2,P2,P).
prD(X,P):-pr2(X,0,P).

maxU(0,0):-!.
maxU(X,M):-
    X1 is X div 10,
    maxU(X1,M1),
    M2 is X mod 10,
    (M2 > M1, M2 mod 3 =\= 0 -> M is M2; M is M1).

max2(0,M,M):-!.
max2(X,M1,M):-
    X1 is X div 10,
    M2 is X mod 10,
    (M2 > M1, M2 mod 3 =\= 0 -> max2(X1,M2,M); max2(X1,M1,M)).
maxD(X,M):-max2(X,0,M).

fib1(1,1):-!.
fib1(2,1):-!.
fib1(N,X):-
    N1 is N-1,
    N2 is N-2,
    fib1(N1,X1),
    fib1(N2,X2),
    X is X1+X2.

fibD(0,_,X,X):-!.
fibD(1,_,X,X):-!.
fibD(N,X1,X2,X):-
    X3 is X1 + X2,
    N1 is N-1,
    fibD(N1,X2,X3,X).
fib(N,X):- N1 is N - 1, fibD(N1,1,1,X).
