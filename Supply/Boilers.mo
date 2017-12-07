within WaterHub.Supply;

package Boilers
  import SI = WaterHub.SIUnits;
  import CO = WaterHub.Constants;
  extends Modelica.Icons.Package;

  partial model BaseBoiler
    extends Modelica.Icons.BasesPackage;
    parameter SI.AbsoluteTemperature T_wanted = 333 "Target Temperature";

    //inlet ports
    WaterHub.BaseClasses.HeatPort_in energy_in(heat(min=0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    WaterHub.BaseClasses.WaterPort_in inlet(water(min=0))
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    //outlet ports
    WaterHub.BaseClasses.WaterPort_out outlet(water(max=0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    annotation (defaultComponentName="Boiler");
  end BaseBoiler;

  model InstantaneousBoiler
    extends BaseBoiler;
    extends WaterHub.Icons.ModelIcon;
    parameter SI.WaterFlow MaxFlow = 1 "Maximum Flow";

  equation
    outlet.water + inlet.water = 0;
    outlet.T - T_wanted = 0;
    outlet.T*outlet.water + inlet.T*inlet.water + energy_in.heat/CO.VolSpecificHeatCapWater = 0;
    when outlet.water < -MaxFlow then
      outlet.water = -MaxFlow;
    end when;

  end InstantaneousBoiler;



  model SimpleBoiler
    extends BaseBoiler;
    extends WaterHub.Icons.ModelIcon;
    parameter SI.HeatFlow MaxPower = 10000 "Maximum heat transfer to water";
    parameter SI.Volume MaxVolume = 300 "Start Volume";
    SI.Volume Volume(start=StartVolume, min=0.0, max=MaxVolume);
    SI.AbsoluteTemperature Temp(start=283, min=273);

  equation
    outlet.water + inlet.water = der(Volume); //Mass Balance
    outlet.T - T_wanted = 0;
    outlet.T*outlet.water + inlet.T*inlet.water + energy_in.heat/CO.VolSpecificHeatCapWater = der(Temp); //Energy Balance

  end SimpleBoiler;






end Boilers;
