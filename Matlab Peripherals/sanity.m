

sdk_path = 'C:\Program Files\Blackrock Microsystems\Cerebus Central Suite';
addpath(sdk_path)
cbmex('open');
channel_count = 280;
sample_rate_setting = 5;
filter_setting = 1; 
trial_length=5;
current_time=tic;

%tic
%for i = 1:3
%    [a,b] = MEXBUILDER('2', cont, event_data);
%end 
%toc 
cbmex('trialconfig',1)



% Initialize time tracking
current_time = tic;

% Initialize a variable to hold all the 'cont' values
cont_values = [];
cbmex('system', 'reset')
% Start the while loop
while(trial_length > toc(current_time))
    pause(0.5);  % Wait for 0.5 seconds to prevent overloading the CPU
    
    % Get event data
    [event_data, time, cont] = cbmex('trialdata', 1);
    sample = cont(1,3);
    data = sample{1,:};
    % Store the 'cont' values for plotting later
    cont_values = [cont_values; data];  % Append current 'cont' to the array
    
end

% Plot the 'cont' values after the while loop ends
figure;  % Create a new figure window
plot(cont_values);  % Plot the collected 'cont' values
xlabel('Iteration');  % Label for x-axis
ylabel('Cont Value');  % Label for y-axis
title('Cont Values Over Time');  % Title for the plot
grid on;  % Enable grid on the plot
