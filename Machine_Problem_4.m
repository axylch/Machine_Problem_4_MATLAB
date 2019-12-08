%Machine Problem 4 (Projectile Motion)
%Input of all the components needed for calculation
height = input('Initial Height above Ground (meters): ');
velocity = input('Magnitude of the Velocity (m/s): ');
angle = input('Angle in Degrees with respect to the X-Axis at which the Projectile is fired: ');
xacceleration = input('X-Component of the Acceleration, considering the sign (m/s^2): ');
yacceleration = input('Y-Component of the Acceleration, considering the sign (m/s^2): ');
%Error to show no free fall and no negative height
if yacceleration == 0
    error("NO FREE FALL")
elseif height < 0
    error("The Height should be ABOVE GROUND")
end
trajectory=(-velocity*sind(angle)+sqrt((velocity*sind(angle))^2-2*yacceleration*height))/yacceleration;
if trajectory<=0 || trajectory<(-velocity*math.sin(angle)/yacceleration)
    trajectory=(-velocity*sind(angle)-sqrt((velocity*sind(angle))^2-2*yacceleration*height))/yacceleration;
end
traj = 0:0.001:trajectory;
ytrajectory = height+velocity.*sind(angle).*traj+(1./2).*yacceleration.*traj.^2;
xtrajectory = velocity.*cosd(angle).*traj+(1./2).*xacceleration.*traj.^2;
plot(xtrajectory,ytrajectory,'r-'),grid on,axis tight
title 'The Traveled Path of the Projectile'
xlabel 'Horizontal Trajectory (X)'; ylabel 'Vertical Trajectory (Y)'; 
legend('Trajectory')