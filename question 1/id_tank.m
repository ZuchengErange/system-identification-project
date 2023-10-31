function  [sys, x0, str, ts] = tank(t,x,u,flag,A,Kin,Kout,Ts)
%TANK  S-function for Tank Lever Model.
%	This M-file is designed to be used as a template for other
%	S-functions. Right now it acts as an integrator. This template
%	is an example of a continuous system with no discrete components.
%	That is, it makes no use of FLAG==4 or FLAG==2.
%
%	Copyright (c) 1990-94 by The MathWorks, Inc.
%	Ned Gulley 8-11-92

% Uncomment the following two lines to show how the flags are called.
% dispString=['flag = ' num2str(flag) ' at time = ' num2str(t)];
% disp(dispString)

if abs(flag) == 1,
  % The FLAG==1 branch is at the top of the file for efficiency, since
  % the S-function will be called with FLAG==1 very frequently.
  % If FLAG==1, then SIMULINK is looking for the next state derivative, dx
  % **** In this template system, the new derivative dx gets the input u ****
  % (SYS =) DX = U
  temp = x-u(3);
  if (temp < 0)
      temp = 0;
  end
  
  sys = Kin*u(1)/A-Kout*u(2)*sqrt(temp)/A;

elseif flag == 3,
  % If FLAG==3, then SIMULINK wants to know what the next output is.
  % **** In this template system, y gets the current state x ****
  % (SYS =) Y = X
  temp = x-u(3);
  if (temp < 0)
      temp = 0;
  end
  sys = [x;Kout*u(2)*sqrt(temp)];

elseif flag  == 0,
  % This part takes care of all initialization; it is used only once.
  % **** In this template system, there is one continuous state, one ****
  % **** input and one output.                                       ****
  % The sizes vector is six elements long, and it looks like this:
  % sizes(1) = number of continuous states
%  sizes(1) = 1;
  % sizes(2) = number of discrete states
%  sizes(2) = 0;
  % sizes(3) = number of system outputs (length of output y)
%  sizes(3) = 2;
  % sizes(4) = number of system inputs (length of input u)
%  sizes(4) = 3;
  % sizes(5) = number of discontinuous roots; unused feature, set to zero
%  sizes(5) = 0;
  % sizes(6) = direct feedthrough flag; used to detect algebraic loops.
  % Set sizes(6) to 1 if the output y depends directly on the input u.
  % Otherwise, it should be set to 0.
%  sizes(6) = 1;
  % Set the initial conditions on the states
%  x0 = 0;
  % (SYS = ) SIZES = [1 0 1 1 0 0]';
%  sys = sizes';

  sizes = simsizes;

sizes.NumContStates  = 1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;

sys = simsizes(sizes);

x0  = 0;

str = [];

  ts=[];
  
else 
  % Flags not considered here are treated as unimportant.
  % Notice that since there are no discrete states in this system,
  % there is no need to deal with FLAG==2 or FLAG==4.
  % Output is set to [].
  sys = [];

end     % if abs(flag) == ...
