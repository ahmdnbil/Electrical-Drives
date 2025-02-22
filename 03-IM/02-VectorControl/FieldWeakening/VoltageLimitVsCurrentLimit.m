% Given parameters
I_smax = I_rated;    % Maximum stator current (circle radius)
V_smax = Vs_max;     % Maximum voltage limit
L_s = Ls;            % Stator inductance (H)

% Electrical speed values (RPM to rad/s)
Na_vals = [(Wbase_FW_RegionI*30/pi)*2,4000,6000, 10000]; % Different electrical speeds in RPM
We_vals = Na_vals * pi / 30;        % Convert RPM to rad/s

colors = ['r', 'b', 'g', 'm']; % Colors for different ellipses
theta = linspace(0, pi/2, 100); % Angle for plotting (First quadrant only)

% Plot the current limit circle (only positive quadrant)
figure;
hold on; grid on; axis equal;
Ids_circle = I_smax * cos(theta);
Iqs_circle = I_smax * sin(theta);
plot(Ids_circle, Iqs_circle, 'k', 'LineWidth', 2);
text(I_smax, 0, 'Current Limit', 'FontSize', 12, 'Color', 'k');

% Plot the voltage limit ellipses for different We values (First quadrant)
for i = 1:length(We_vals)
    We = We_vals(i);
    
    % Major axis along q-axis (Iqs), minor axis along d-axis (Ids)
    a = V_smax / (We * L_s);         % Major axis (Iqs direction)
    b = V_smax / (We * sigma * L_s); % Minor axis (Ids direction)
    
    x = a * cos(theta); % x-coordinates (Ids direction)
    y = b * sin(theta); % y-coordinates (Iqs direction)
    
    plot(x, y, colors(i), 'LineWidth', 2);
    text(a, 1+i*.5, ['Wm = ', num2str(Na_vals(i)/2), ' RPM'], 'FontSize', 12, 'Color', colors(i));
end

% Plot the vertical line for Id_rated = 4.6
plot([Id_rated Id_rated], [0 6], 'b--', 'LineWidth', 2);
text(Id_rated + 0.2, 3, 'Id_{rated} = 4.6', 'FontSize', 12, 'Color', 'b');

% Set axis limits from 0 to 6
xlim([0 6]);
ylim([0 6]);

xlabel('I_{ds}');
ylabel('I_{qs}');
title('Voltage and Current Limits in dq-Frame (First Quadrant)');
legend('Current Limit', 'Voltage Limit for different We', 'I_{d rated}');
hold off;
