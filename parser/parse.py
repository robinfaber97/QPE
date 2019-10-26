import re
from datetime import datetime
import numpy

filename = 'logs/07-03-Pre-log.txt'

start_time = None
arrival_times = []
starting_times = []
end_times = []
job_classes = []
queue_time = [0]
queue_length = [0]
cumulative_jobs_time = [0]
cumulative_jobs = [0]
cumulative_jobs_high = [0]

def service_time(j):
    return None if (j[0] == "" or j[1] == "") else (j[1] - j[0]).total_seconds()

with open(filename) as file:
    line = file.readline()
    while line:
        if re.search('.*Starting the scheduler ...', line):
            timestamp = line.split(' Starting the scheduler')[0]
            start_time = datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S')
        if re.search('.*Generated new job', line):
            index = int(line.split("Generated new job ")[1].split(" ")[0])
            classInt = int(line.split("of class ")[1].split(" ")[0])
            job_classes.append(classInt)
            timestamp = line.split(" [GEN] ")[0]
            arrival_times.append(datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S'))
            starting_times.append("")
            end_times.append("")

            # add 1 to the queue length
            time_since_start = (datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S') - start_time).total_seconds()
            queue_time = queue_time + [time_since_start]
            queue_length = queue_length + [(queue_length[-1] + 1)]
            print(timestamp + ', ' + str(queue_length[-1]))

            # add to cumulative jobs
            cumulative_jobs_time = cumulative_jobs_time + [time_since_start]
            cumulative_jobs = cumulative_jobs + [cumulative_jobs[-1] + 1]
            if classInt == 0:
                cumulative_jobs_high = cumulative_jobs_high + [cumulative_jobs_high[-1] + 1]
            else:
                cumulative_jobs_high = cumulative_jobs_high + [cumulative_jobs_high[-1]]

        if re.search('.*Starting job ', line):
            timestamp = line.split(' [DIS')[0]
            index = int(line.split("Starting job ")[1].split(":")[0])
            starting_times[index] = datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S')
            # subtract one from the queue length
            time_since_start = (datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S') - start_time).total_seconds()
            queue_time = queue_time + [time_since_start]
            queue_length = queue_length + [(queue_length[-1] - 1)]
            print(timestamp + ', ' + str(queue_length[-1]))

        if re.search('.*ended with status true', line):
            timestamp = line.split(' [LOG')[0]
            index = int(line.split("] Job ")[1].split(" ")[0])
            end_times[index] = datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S')

        if re.search(r'.+\[SCH\] Preempting job ', line):
            timestamp = line.split(' [SCH]')[0]
            # add 1 to the queue length
            time_since_start = (datetime.strptime(timestamp, '%Y/%m/%d %H:%M:%S') - start_time).total_seconds()
            queue_time = queue_time + [time_since_start]
            queue_length = queue_length + [(queue_length[-1] + 1)]
            print(timestamp + ', ' + str(queue_length[-1]))

        line = file.readline()

# calculate the average service time
service_times = list(zip(starting_times, end_times))
print(service_times)
service_times = list(map(lambda x: service_time(x), service_times))
service_times = list(filter(lambda x: x is not None, service_times))
print(service_times.__len__())
print("The average service time is: " + str(sum(service_times)/service_times.__len__()))

# write the queue times and lengths to a file such that it can be plotted in Matlab
numpy.savetxt(filename.split('.txt')[0] + '-queue.txt', [queue_time, queue_length])
numpy.savetxt(filename.split('.txt')[0] + '-cumulative.txt', [cumulative_jobs_time, cumulative_jobs, cumulative_jobs_high])