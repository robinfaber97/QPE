close all;
clearvars;

figure();

data = dlmread('09-01-nPre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(1) = plot(x, y);
hold on;
L(2) = plot(x,z);


data = dlmread('09-01-Pre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(3) = plot(x, y);
L(4) = plot(x,z);
legend(L, {'Non-Preemptive', 'nPre-High', 'Preemptive', 'Pre-High'}, 'location', 'northwest');
xlabel('Time (s)');
ylabel('Amount of jobs that have arrived');
set(gca,'FontSize',14)

figure();

data = dlmread('08-02-nPre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(1) = plot(x, y);
hold on;
L(2) = plot(x,z);


data = dlmread('08-02-Pre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(3) = plot(x, y);
L(4) = plot(x,z);
legend(L, {'Non-Preemptive', 'nPre-High', 'Preemptive', 'Pre-High'}, 'location', 'northwest');
xlabel('Time (s)');
ylabel('Amount of jobs that have arrived');
set(gca,'FontSize',14)

figure();

data = dlmread('07-03-nPre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(1) = plot(x, y);
hold on;
L(2) = plot(x,z);


data = dlmread('07-03-Pre-log-cumulative.txt');
x = data(1,:);
y = data(2,:);
z = data(3,:);
L(3) = plot(x, y);
L(4) = plot(x,z);
legend(L, {'Non-Preemptive', 'nPre-High', 'Preemptive', 'Pre-High'}, 'location', 'northwest');
xlabel('Time (s)');
ylabel('Amount of jobs that have arrived');
set(gca,'FontSize',14)