% Define cube parameters
cubeSize = 10; % Size of the cube (units)
numSteps = 300; % Number of steps of SIM

% Initialize light wave parameters
lightPos = [0, 0, 0]; % Initial position of the light wave
lightDir = [1, 2.5, 1.5]; % Initial direction of the light wave

% Create figure
figure;
hold on;
axis([-cubeSize cubeSize -cubeSize cubeSize -cubeSize cubeSize]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Light Wave Simulation');

% Plot cube
cubeVertices = [...
    -cubeSize, -cubeSize, -cubeSize;...
    -cubeSize, -cubeSize, cubeSize;...
    -cubeSize, cubeSize, -cubeSize;...
    -cubeSize, cubeSize, cubeSize;...
    cubeSize, -cubeSize, -cubeSize;...
    cubeSize, -cubeSize, cubeSize;...
    cubeSize, cubeSize, -cubeSize;...
    cubeSize, cubeSize, cubeSize];
cubeFaces = [...
    1, 2, 4, 3;...
    5, 6, 8, 7;...
    1, 2, 6, 5;...
    3, 4, 8, 7;...
    1, 3, 7, 5;...
    2, 4, 8, 6];
cubePatch = patch('Faces', cubeFaces, 'Vertices', cubeVertices, ...
    'FaceColor', 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'k');

% Simulate light wave
for step = 1:numSteps
    % Calculate next position of the light wave
    lightPos = lightPos + 0.1 * lightDir;
    
    % Check for collisions with cube walls
    hitWall = abs(lightPos) >= cubeSize;
    if any(hitWall)
        % Reflect the light wave off the wall it hits
        lightDir(hitWall) = -lightDir(hitWall);
    end
    
    % Plot light wave position
    plot3(lightPos(1), lightPos(2), lightPos(3), 'ro');
    drawnow;
    
    % Pause for visualization
    pause(0.1);
end

hold off;
