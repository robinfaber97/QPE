close all;
clearvars;

figure();

data = dlmread('09-01-nPre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(1) = plot(x, y);
hold on;

data = dlmread('09-01-Pre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(2) = plot(x, y);
legend(L, {'Non-Preemptive', 'Preemptive'}, 'location', 'northwest');
ylim([0 10]);
xlabel('Time (s)');
ylabel('Length of the queue');
set(gca,'FontSize',14)

figure();

data = dlmread('08-02-nPre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(1) = plot(x, y);
hold on;

data = dlmread('08-02-Pre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(2) = plot(x, y);
legend(L, {'Non-Preemptive', 'Preemptive'}, 'location', 'northwest');
xlabel('Time (s)');
ylabel('Length of the queue');
ylim([0 8]);
set(gca,'FontSize',14)

figure();

data = dlmread('07-03-nPre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(1) = plot(x, y);
hold on;

data = dlmread('07-03-Pre-log-queue.txt');
x = data(1,:);
y = data(2,:);
L(2) = plot(x, y);
legend(L, {'Non-Preemptive', 'Preemptive'}, 'location', 'northwest');
xlabel('Time (s)');
ylabel('Length of the queue');
set(gca,'FontSize',14)


