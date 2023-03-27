%1.Parsing a list
parse([]).
parse([H|T]) :-write(H),parse(T).
%query ?-parse([2,3]).=>23

%2. Check if is a list
is_list([]).
is_list([_|T]) :- is_list(T).
%query ?-is_list([2]). => true

%3. Append a list to another list
append1([],L,L). 
append1([H|T],L2,[H|L3])  :-  append1(T,L2,L3).
%query ?-append1([2,3],[4],L).=> L=[2,3,4]

%4. Naive rec reverse list
naive_rev([],[]).
naive_rev([H|T], R) :- naive_rev(T, S), append(S, [H], R).
%query ?-naive_rev([2,4,8],L).=>L=[8,4,2]

%5. Accumulator rec reverse list
rev(L, R) :- rev(L, [], R).
rev([], R, R).
rev([H|T], C, R) :- rev(T, [H|C], R).
%query ?-rev([2,4,5],L). =>L=[5,4,2]

%6. Another accumulator example
list_length1([],0).
list_length1([_|Tail],Length) :-
             list_length1(Tail,TailLength),
             Length is TailLength + 1.
%query ?-list_length1([2,4,5],X).=> X=3

%7. Accumulator based
list_length2(List,Length) :- list_length2(List,0,Length).
list_length2([],Length,Length).
list_length2([_|Tail],Accumulator,Length) :- 
             NewAcc is Accumulator + 1,
             list_length2(Tail,NewAcc,Length).
%query ?-list_length2([2,4,5],X).=>X=3

%8. Adding up a list of numbers
addup([], 0). 
addup([FirstNumber | RestOfList], Total) :-
	addup(RestOfList, TotalOfRest), 
	Total is FirstNumber + TotalOfRest.
%query ?-addup([2,4,5],X).=>X=11.

%9. Given facts such as:
%Bob is taller than Mike.
%Mike is taller than Jim.
%Jim is taller than George.
%Write a recursive program that will determine that Bob's height is greater than George's.
taller(bob, mike). 									%fapt
taller(mike, jim).									%fapt
taller(jim, george).									%fapt
is_taller(X, Y) :- taller(X,Y).					  		        %cazul de baza
is_taller(X,Y) :- taller(X,Z) , is_taller(Z,Y). 	                     		%cazul recursiv
%query ?-is_taller(bob, george).

%10.Get elements on the n-th position in a given list.
element_at([H|_], 0, H).   
element_at([_|T], N, X) :- 
    N > 0,                
    Np is N - 1,           
    element_at(T,Np, X).  
%query ?-element_at([1,2,3],2, H). => H=3.

%11. Check if a list is a prefix of another list. Check if a list is a suffix of another list.
prefix([], _).
prefix([H|T], [H|L]) :-
    prefix(T, L).
%query ?-prefix([1, 2], [1, 2, 3, 4]). =>true

sufix(L, L).
sufix(L, [_Y|Rest]) :-
    sufix(L, Rest).
%query ?-sufix([3, 4], [1, 2, 3, 4]). =>true

%12. Add one to each element of a list
add_one([], []). 
add_one([H|T], [H1|T1]) :-
    H1 is H + 1,
    add_one(T, T1).
%query ?-add_one([1, 2, 3, 4],L). =>L=[2,3,4,5]