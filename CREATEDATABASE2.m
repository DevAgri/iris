clc;
clear;
load('q1');
x1=X;
m1 = size(x1(:, 1)); m1=m1(1);

load('q2');
x2=X;
m2 = size(x2(:, 1)); m2=m2(1);

load('q3');
x3=X;
m3 = size(x3(:, 1)); m3=m3(1);

load('q4');
x4=X;
m4 = size(x4(:, 1)); m4=m4(1);

load('q5');
x5=X;
m5 = size(x5(:, 1)); m5=m5(1);

load('q6');
x6=X;
m6 = size(x6(:, 1)); m6=m6(1);

load('q7');
x7=X;
m7 = size(x7(:, 1)); m7=m7(1);

load('q8');
x8=X;
m8 = size(x8(:, 1)); m8=m8(1);

load('q9');
x9=X;
m9 = size(x9(:, 1)); m9=m9(1);

W = zeros(m1+m2+m3+m4+m5+m9, 67500);

for i=1:m1,
    W(i,:) = x1(i,:);
        
end

for i=1:m2,
    W(i+m1,:) = x2(i,:);
end

for i=1:m3,
    W(i+m1+m2,:) = x3(i,:);
end

for i=1:m4,
    W(i+m1+m2+m3,:) = x4(i,:);       
end

for i=1:m5,
    W(i+m1+m2+m3+m4,:) = x5(i,:);      
end

%for i=1:m6,
%    W(i+m1+m2+m3+m4+m5,:) = x6(i,:);             
%end
%
%
%for i=1:m7,
%    W(i+m1+m2+m3+m4+m5+m6,:) = x7(i,:);
%end
%
%for i=1:m8,
%    W(i+m1+m2+m3+m4+m5+m6+m7,:) = x8(i,:);             
%end

for i=1:m9,
    W(i+m1+m2+m3+m4+m5,:) = x9(i,:);             
end

y = zeros(m1+m2+m3+m4+m5+m9, 1);
y(1:(m1+m2+m3+m4+m5)) = 1;
y((m1+m2+m3+m4+m5+1):(m1+m2+m3+m4+m5+m9)) = 2;

save('ps.mat', 'W', 'y');