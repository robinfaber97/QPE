close all;

amountOfRuns = 1000;
precision = 10;
runtime = 60000;
x = [0:runtime-1];
timeLow = 265.2;
timeHigh = 135.9;

probLow = 0.9;
probHigh = 0.1;
preempt = false;
lambda = 0.00538;
queueLengthsNPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsNPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

preempt = true;
queueLengthsPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

figure();
y = mean(queueLengthsNPre, 1);
resultSEM = std(queueLengthsNPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(1) = plot(x, y,'color',[0, 0.4470, 0.7410]);
hold on;
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0, 0.4470, 0.7410], 0.3);
y = mean(queueLengthsPre, 1);
resultSEM = std(queueLengthsPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(2) = plot(x, y,'color',[0.8500, 0.3250, 0.0980]);
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0.8500, 0.3250, 0.0980], 0.3);
legend(L, {'Non-preemptive', 'Preemptive'},'location','southeast');
ylim([0 4.5]);
xlabel('Time (s)');
ylabel('Average length of the queue');
set(gca,'FontSize',14);

probLow = 0.8;
probHigh = 0.2;
preempt = false;
lambda = 0.00495;
queueLengthsNPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsNPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

preempt = true;
queueLengthsPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

figure();
y = mean(queueLengthsNPre, 1);
resultSEM = std(queueLengthsNPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(1) = plot(x, y,'color',[0, 0.4470, 0.7410]);
hold on;
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0, 0.4470, 0.7410], 0.3);
y = mean(queueLengthsPre, 1);
resultSEM = std(queueLengthsPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(2) = plot(x, y,'color',[0.8500, 0.3250, 0.0980]);
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0.8500, 0.3250, 0.0980], 0.3);
legend(L, {'Non-preemptive', 'Preemptive'},'location','southeast');
ylim([0 4.5]);
xlabel('Time (s)');
ylabel('Average length of the queue');
set(gca,'FontSize',14);

probLow = 0.7;
probHigh = 0.3;
preempt = false;
lambda = 0.00458;
queueLengthsNPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsNPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

preempt = true;
queueLengthsPre = zeros(amountOfRuns, runtime);

for i=1:amountOfRuns
    queueLengthsPre(i,:) = simulate(probLow, probHigh, lambda, preempt, timeLow, timeHigh, runtime, precision);
end

figure();
y = mean(queueLengthsNPre, 1);
resultSEM = std(queueLengthsNPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(1) = plot(x, y,'color',[0, 0.4470, 0.7410]);
hold on;
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0, 0.4470, 0.7410], 0.3);
y = mean(queueLengthsPre, 1);
resultSEM = std(queueLengthsPre, 1)/sqrt(amountOfRuns);
CI95 = tinv([0.025 0.975], amountOfRuns-1);
resultCI95(1,:) = y + CI95(1)*resultSEM;
resultCI95(2,:) = y + CI95(2)*resultSEM;
L(2) = plot(x, y,'color',[0.8500, 0.3250, 0.0980]);
ciplot(resultCI95(1,:), resultCI95(2,:), x, [0.8500, 0.3250, 0.0980], 0.3);
legend(L, {'Non-preemptive', 'Preemptive'},'location','southeast');
ylim([0 4.5]);
xlabel('Time (s)');
ylabel('Average length of the queue');
set(gca,'FontSize',14);