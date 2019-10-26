function [queueLength] = simulate(pLow, pHigh, lambda, preempt, timeLow, timeHigh, runtime, precision)
%SIMULATE Simulates the job generator
%   pLow, pHigh - probabilities of the different priorities
%   lambda - arrival rate of the jobs
%   preempt - to preempt jobs or not
%   timeLow, timeHigh - time of the low and high priority jobs
%   runtime - time to run the simulation for
%   precision - a power of 10 greater or equal to 1
nextArrivalTime = round(exprnd(1/lambda) * precision);

nextCompletionTime = -1;

currentJobLength = -1;
currentJobClass = -1;

queueLowLength = [];
queueHighLength = [];

queueLength = zeros(1,runtime);

for i=0:runtime*precision-1
    % If a new job arrives
    if i == nextArrivalTime
        %Determine the class of the job
        if rand < pLow
            jobClass = 1;
        else
            jobClass = 0;
        end
        
        %Sample the length of the job
        if jobClass == 0
            jobLength = round(normrnd(timeHigh, 5) * precision);
        else
            jobLength = round(normrnd(timeLow, 5) * precision);
        end
        
        if currentJobLength == -1 %If there is no job running
            currentJobLength = jobLength;
            currentJobClass = jobClass;
            nextCompletionTime = i + jobLength;
        elseif jobClass == 0 && currentJobClass == 1 && preempt %Else if the current job can be preempted
            %Move the current job to the queue
            queueLowLength = [currentJobLength, queueLowLength];
            
            %Start the new job
            currentJobLength = jobLength;
            currentJobClass = jobClass;
            nextCompletionTime = i + jobLength;
        else
            %Move the new job to the right queue
            if jobClass == 0
                queueHighLength = [queueHighLength, jobLength];
            elseif jobClass == 1
                queueLowLength = [queueLowLength, jobLength];
            end
        end
        
        nextArrivalTime = i + round(exprnd(1/lambda) * precision);
    end
    
    %If a job completes
    if i == nextCompletionTime
        if size(queueHighLength, 2) > 0
            currentJobLength = queueHighLength(1);
            currentJobClass = 0;
            nextCompletionTime = i + currentJobLength;
            queueHighLength(1) = [];
        elseif size(queueLowLength, 2) > 0
            currentJobLength = queueLowLength(1);
            currentJobClass = 1;
            nextCompletionTime = i + currentJobLength;
            queueLowLength(1) = [];
        else
            currentJobLength = -1;
            currentJobClass = -1;
            nextCompletionTime = -1;
        end
    end
    
    %Set the queue length
    if mod(i, precision) == 0
        queueLength(1, i/precision + 1) = size(queueHighLength, 2) + size(queueLowLength, 2);
    end
end
end

