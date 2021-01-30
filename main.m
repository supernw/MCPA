    global C
    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²
    
    %Initilizalive Position and Velocity
    n = 7; %Number of particles
    %x=0; %Position
    x= zeros(1, n);
    
    %dx=0; %Change in pos
    dx = zeros(1, n);
    
    %v=0; %Velocity
    v = zeros(1, n);
    
    dv=0; %Change in vel
    t=0; %Current time
    dt=1; %time step
    F=1; %Force on electron
    
    %probScat = 0.05;
    tow = 100;
    probScat = 1-exp(-dt/tow);
    driftV = 0;
    
    colours = {'b', 'g', 'r', 'c', 'm', 'y', 'k', 'w'};
    while(t<1000)
        %Velocity
        dv=F*dt;
        
        
        for i=1:n
            r = rand();
            if(r<probScat)
                v(i)=0;
            else
                v(i) = v(i) + dv;
            end
            %Position
            dx(i) = v(i)*dt;
            x(i) = x(i) + dx(i);
        end

        %Time
        t = t + dt;
        
        %Drift Velocity
        for i=1:n
           driftV = driftV + v(i); 
        end
        
        driftV=driftV/n;
        
        %Plot
        figure(1)
        subplot(2,1,1)
        for i=1:n
           plot(t,x(i),colours{i},'marker', '.');
           hold on;
        end
        
        xlabel('Time (s)')
        ylabel('Position (m)')
        hold on
        subplot(2,1,2)
        for i=1:n
           plot(t,v(i),colours{i},'marker', '.'); 
        end
        
        xlabel('Time (s)')
        ylabel('Velocity (m/s)')
        hold on
        title(['Drift Velocity = ', num2str(driftV), ' m/s'])
        pause(0.005)
    end
    
    
    
    
    