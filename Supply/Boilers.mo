within WaterHub.Supply;

package Boilers
  import SI = WaterHub.SIUnits;
  import CO = WaterHub.Constants;


  model InstantaneousBoiler
    extends WaterHub.Icons.Package;
    parameter SI.AbsoluteTemperature T_wanted = 333 "Target Temperature";
    parameter SI.WaterFlow MaxFlow = 1 "Maximum Flow";
    parameter SI.Volume StartVolume = 150 "Start Volume";
  //  SI.Volume Volume(start=StartVolume, min=0.0, max=MaxVolume);

    //inlet ports
    WaterHub.BaseClasses.HeatPort_in energy_in(heat(min=0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    WaterHub.BaseClasses.WaterPort_in inlet(water(min=0))
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    //outlet ports
    WaterHub.BaseClasses.WaterPort_out outlet(water(max=0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  equation
    outlet.water + inlet.water = 0;
    outlet.T - T_wanted = 0;
    outlet.T*outlet.water + inlet.T*inlet.water + energy_in.heat/CO.VolSpecificHeatCapWater = 0;

    annotation (defaultComponentName="Boiler");
  end InstantaneousBoiler;








end Boilers;
