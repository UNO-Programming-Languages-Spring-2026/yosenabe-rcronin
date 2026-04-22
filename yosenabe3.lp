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

% Define all cells visited by the path of each number (horizontal movement)
path(X,Y,CX,Y) :- target(X,Y,XX,Y), cell(CX,Y), X <= CX, CX <= XX.
path(X,Y,CX,Y) :- target(X,Y,XX,Y), cell(CX,Y), XX <= CX, CX <= X.

% Define all cells visited by the path of each number (vertical movement)
path(X,Y,X,CY) :- target(X,Y,X,YY), cell(X,CY), Y <= CY, CY <= YY.
path(X,Y,X,CY) :- target(X,Y,X,YY), cell(X,CY), YY <= CY, CY <= Y.

% No two different numbers may share a path cell
:- path(X1,Y1,CX,CY), path(X2,Y2,CX,CY), X1 != X2.
:- path(X1,Y1,CX,CY), path(X2,Y2,CX,CY), X1 = X2, Y1 != Y2.

#show target/4.

