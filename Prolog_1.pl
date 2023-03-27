% Exercitiul 1: All men are mortal. Socrates is a man. Hence(prin urmare), Socrates is mortal. 
man(socrates). %fapt
mortal(X) :- man(X). %regula
% ?-mortal(socrates). => true

% Exercitiul 2
killer(butch). %Butch is a killer. - fapt
married(mia, marsellus). %Mia and Marsellus are married. - fapt
dead(zed). %Zed is dead.- fapt
kills(marsellus, X) :- flowers_gives(X, mia). %Marsellus kills everyone who gives Mia a flower. - regula
loves(mia, X) :- good_dancer(X). %Mia loves everyone who is a good dancer. - regula
eats(jules, X) :- nutritious(X) ; tasty(X). %Jules eats anything nutritious or tasty. - regula

% Exercitiul 3 -Arbore genealogic-
%           		   Andrei
%      Cristi                       	 	Elena
%  Adriana Marius Ovidiu 			Ana
%                                              George
%fapte:
parent(andrei, cristi).
parent(andrei, elena).
parent(cristi, adriana).
parent(cristi, marius).
parent(cristi, ovidiu).
parent(elena, ana).
parent(ana, george).
male(andrei).
male(cristi).
male(george).
male(marius).
male(ovidiu).
female(elena).
female(ana).
female(adriana).
%regui:
%Create a rule that defines grandparent relations.
grandparent(X, Y) :-
    parent(X, P),
    parent(P, Y).

grandmother(X, Y) :-
    parent(X, P),
    parent(P, Y),
    female(X).

grandfather(X, Y) :-
    parent(X, P),
    parent(P, Y),
    male(X).

%Create a sibling rule.
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

%Create a cousin rule.
cousin(X,Y) :-
    sibling(Z, T),
    parent(Z, X),
    parent(T, Y),
    X \= Y.

%Create aunt and uncle relations.
aunt(X, Y) :-
    sibling(P, X),
    parent(P, Y),
    female(X).

uncle(X, Y) :-
    sibling(P, X),
    parent(P, Y),
    male(X).

/*cateva interogari pentru verificarea faptelor si regulilor
 * ?-grandparent(X, Y). => (X, Y) = {(andrei, adriana) , (andrei, marius), (andrei, ovidiu), (andrei, ana), (elena, george)}
 * ?-grandmother(X, Y). => (X, Y) = {(elena, george)}
 * ?-grandfather(X, Y). => (X, Y) = {(andrei, adriana), (andrei, marius), (andrei, ovidiu), (andrei, ana)}
 * ?-sister(X, Y). 	=> (X, Y) = {(elena, cristi), (adriana, marius), (adriana, ovidiu)}
 * ?-brother(X, Y). 	=> (X, Y) = {(cristi, elena), (marius, adriana), (marius, ovidiu), (ovidiu, adriana), (ovidiu, marius)}
 * ?-sibling(X, Y). 	=> (X, Y) = {(cristi, elena), (elena, cristi), (adriana, marius), (adriana, ovidiu), (marius, adriana), (marius, ovidiu), (ovidiu, adriana), (ovidiu, marius)} 
 * ?-cousin(X,Y). 	=> (X, Y) = {(adriana, ana), (marius, ana), (ovidiu, ana), (ana, adriana), (ana, marius), (ana,ovidiu)} 
 * ?-aunt(X, Y). 	=> (X, Y) = {(elena, adriana), (elena, marius), (elena, ovidiu)}
 * ?-uncle(X, Y). 	=> (X, Y) = {(cristi, ana)}
 */