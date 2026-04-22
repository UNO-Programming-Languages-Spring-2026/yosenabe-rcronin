%cell(X,Y).
%area(X,Y,A).
%number(X,Y,N).
%goal(A,G).

% Identify cells that contain numbers
num(X,Y) :- number(X,Y,_).

% Each number moves to exactly one area cell
{ target(X,Y,XX,YY) : area(XX,YY,A) } = 1 :- num(X,Y).

% Movement must be in a straight line (same row or same column)
:- target(X,Y,XX,YY), X != XX, Y != YY.

% Each area must have at least one number moved into it
:- area(_,_,A), #count{ XX,YY : target(_,_,XX,YY), area(XX,YY,A) } = 0.

#show target/4.

