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

#show target/4.
