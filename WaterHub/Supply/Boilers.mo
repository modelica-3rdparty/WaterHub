within WaterHub.Supply;

package Boilers
  import SI = WaterHub.SIUnits;
  import CO = WaterHub.Constants;
  extends Modelica.Icons.Package;

  partial model BaseBoiler
    extends Modelica.Icons.BasesPackage;
    parameter SI.AbsoluteTemperature T_wanted = 333 "Target Temperature";
    parameter Integer n=1 "Number of ports";

    //inlet ports
    WaterHub.BaseClasses.HeatPort_in energy_in(heat(min=-1e-5))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    WaterHub.BaseClasses.WaterPort_in inlet(water(min=-10e-5))
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    //outlet ports
    WaterHub.BaseClasses.WaterPorts_out[n] outlet(each water(max=1e-5))
    annotation (Placement(transformation(extent={{90,-40},{110,40}})));
    annotation (defaultComponentName="Boiler");
  end BaseBoiler;


  model InstantaneousBoiler
    extends BaseBoiler;
    extends WaterHub.Icons.ModelIcon;
    //parameter SI.WaterFlow MaxFlow = 10 "Maximum Flow";

  equation
    for i in 1:n loop
      outlet[i].T - T_wanted = 0;
    end for;
    outlet.T*outlet.water + inlet.T*inlet.water + energy_in.heat/CO.VolSpecificHeatCapWater = 0 "scalar product of outlet ports temp and volume, energy balance";
    sum(outlet.water) + inlet.water = 0 "Sum of all outlet ports and inlet mass balance";
//    when outlet.water < -MaxFlow then
//    outlet.water = -MaxFlow;
//    end when;
  end InstantaneousBoiler;


  model SimpleBoiler
    extends BaseBoiler;
    extends WaterHub.Icons.ModelIcon;
    parameter SI.HeatFlow MaxPower = 10000 "Maximum heat transfer to water";
    parameter SI.Volume StartVolume = 300;
    parameter SI.Volume MaxVolume = 300 "Max Volume";
    SI.Volume Volume(start=StartVolume, min=0.0, max=MaxVolume);
    SI.AbsoluteTemperature Temp(start=320);

  equation
    outlet.water + inlet.water = der(Volume); //Mass Balance
    der(Volume) = 0 "Steady pressure in water system, volume must be constant in boiler";
    //outlet.T - T_wanted = 0;
    outlet.T*outlet.water + inlet.T*inlet.water = der(Temp); //+ energy_in.heat/CO.VolSpecificHeatCapWater = der(Temp); //Energy Balance
//    when time < 21600 or time > 79200 then //Heats up only during the night
//	 Temp = T_wanted;
  //  end when;
    energy_in.heat = 0;

  end SimpleBoiler;






end Boilers;
