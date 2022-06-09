clear all
close all


f = @(x,y,z) 1./(x.^2 + y.^2 + z.^2);

%dist=integral3(f,0.025,0.115,-0.06,0.06,-0.07,0.07);

L=4.33;
L=4.7;

I=0.023383;
A=0.13;
M=10;

theta=A/(2*L);


%theta=0.01149;
%w=pi*1.1168/30;

%dist=1/((0.025+0.045)^2);
w=1.25*pi/30;
theta=0.017;
m=0.1;
%kl=dist*10;
l=0.3;


kappa1=w^2*I;
diam=0.4e-3;

kappa2=pi*diam^4/32*77.5e9/0.875;

kappa3=(1.26/60)^2*0.0198;
kappa4=pi*(2*0.089e-3)^4/32*77.5e9/0.84;
%kl=0.106;



a=0.001;
xc=0.025+0.045;
yc=0;
zc=0;
xvec=[((-44:1:0)*2-1) ((0:1:44)*2+1)];
yvec=[((-59:1:0)*2-1) ((0:1:59)*2+1)];
zvec=[((-69:1:0)*2-1) ((0:1:44)*2+1)];
rho=10/(0.14*0.09*0.12);
xcoord=xc+xvec*a/2;
ycoord=yc+yvec*a/2;
zcoord=zc+zvec*a/2;
%[x2,y2,z2]=meshgrid(xcoord,ycoord,zcoord);

calc=0;
for i=1:length(xcoord)
    for j=1:length(ycoord)
        for cpt=1:length(zcoord)
            calc_temp=xcoord(i)/((xcoord(i)^2+ycoord(j)^2+zcoord(cpt)^2)^(3/2));
            calc=calc+calc_temp;
        end
    end
end

%kl=rho*a^3*sum(xcoord./(xcoord.^2+ycoord.^2+zcoord.^2).^(3/2));
kl=rho*a^3*calc;
%kl=10/0.07^2;


G1=kappa1*theta/(m*2*kl*l);
G2=kappa2*theta/(m*2*kl*l);
G3=6.67e-11;

theta2=G3*m*l*2*kl/kappa2;
theta3=G3*m*l*2*kl/kappa4;
A2=2*L*theta2;
A3=2*L*theta3;
