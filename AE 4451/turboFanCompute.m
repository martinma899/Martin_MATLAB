clc;clear

% initial struct
in.R = 287
in.r = 1.4 % freestream
in.rd = 1.4 % diffuser
in.rf = 1.4 % fan
in.rc = 1.37 % compressor
in.rb = 1.35 % burner
in.rt = 1.33 % turbine
in.rn = 1.36 % nozzle
in.Cp = in.R/(1-1/in.r)

% ambient conditions
in.M = 0.85
in.Ta = 216.7
in.Pa = 18.75e3
in.Pe = in.Pa

% engine design parameters
in.P03overP02 = 30 % compressor ratio
in.P08overP02 = 1.5 % fan compression ratio
in.B = 0 % bypass ratio
in.T04 = 1700 % max combustion temperature
in.Qr = 45000e3 % energy content of fuel

% loss parameters
in.P04overP03 = 1 % burner P0 loss
in.itad = 0.97 % common diffuser adiabatic efficiency
in.itaf = 0.85 % fan adiabatic efficiency
in.itafn = 0.97 % fan nozzle adiabatic efficiency
in.itac = 0.85 % compressor adiabatic efficiency
in.itab = 1 % burner heat efficiency
in.itat = 0.9 % turbine efficiency
in.itan = 0.98 % nozzle efficiency

Blin = linspace(1,21,101);
P08overP02lin = linspace(1,3.5,101);

for i = 1:101
  for j = 1:101
    initStruct = in;
    initStruct.P08overP02 = P08overP02lin(i);
    initStruct.B = Blin(j);
    thisAns = turbofanfunc(initStruct);
    itatotarr(i,j) = thisAns.itatot;
    T05(i,j) = thisAns.T05;
  end
end

for i = 1:101
  for j = 1:101
    if (imag(itatotarr(i,j))~=0||T05(i,j)<=0)
      itatotarr(i,j) = 0*itatotarr(i,j);
    end
  end
end

clf

[Barr,P08overP02arr] = meshgrid(Blin, P08overP02lin);
surf(Barr,P08overP02arr,itatotarr)

itavec = reshape(itatotarr,10201,1);
Bvec = reshape(Barr,10201,1);
P08overP02vec = reshape(P08overP02arr,10201,1);

[maximum,ind] = max(itavec)
Bvec(ind)
P08overP02vec(ind)

hold on
plot3(Bvec(ind),P08overP02vec(ind),maximum,'rd')
xlabel('Bypass ratio')
ylabel('Fan compression ratio')
zlabel('Total efficiency')


























