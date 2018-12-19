within WaterHub.PipesCarriers;

package WaterPipes

  extends Modelica.Icons.Package;
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;
  
  
model PipeLossesAtRest "Inspired by Modelica.Fluid.Pipes"
  annotation (defaultComponentName="pipe",Icon(coordinateSystem(
      preserveAspectRatio=false,
      extent={{-100,-100},{100,100}}), graphics={Rectangle(
        extent={{-100,40},{100,-40}},
        fillPattern=FillPattern.Solid,
        fillColor={95,95,95},
        pattern=LinePattern.None), Rectangle(
        extent={{-100,44},{100,-44}},
        lineColor={0,0,0},
        fillPattern=FillPattern.HorizontalCylinder,
        fillColor={0,127,255})}));
  
  //parameters
  parameter Real triggerValue=1e-2 "Real value triggering the modeling of heat losses when flow crosses that value";
  parameter SI.PipeLength pipeLength=29;
  parameter SI.PipeDiameter pipeDiameterInside=0.0127;
  parameter SI.PipeThickness pipeThickness=0.00375;
  parameter CO.MaterialConstants.Material material=CO.MaterialConstants.Material.Copper;
  
  //inlets
  WaterHub.BaseClasses.WaterPort_in inlet(water(min=-1e-5)) 
  annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  //outlets
  WaterHub.BaseClasses.WaterPort_out outlet(water(max=1e-5))
  annotation (Placement(transformation(extent={{110,-10},{90,10}})));
  WaterHub.BaseClasses.HeatPort_out heatOutlet "to be connected to heat sink"
  annotation (Placement(transformation(extent={{-10, -45},{10, -25}})));

//protected  
  SI.Volume volume;
  SI.Area areaInside;
  SI.Area areaOutside;
//  SI.CoefficientOfHeatTransfer h;
  SI.ThermalConductivity k;
  parameter SI.AbsoluteTemperature tEnvironment = 293.15;
  SI.OverallConductance UA;
  
algorithm
  if material == CO.MaterialConstants.Material.Copper then
//    h := 13.1 "for water-copper-air system";
    k := 385.0;
  else
//    h := 0.0;
    k := 0.0; //not implemented for other materials
  end if;

  volume := pipeLength*CO.pi*(pipeDiameterInside/2)^2*1e3 "Volume in Liters";
  areaInside := CO.pi*pipeDiameterInside*pipeLength;
  areaOutside := CO.pi*(pipeDiameterInside+pipeThickness)*pipeLength;
  
initial equation
  outlet.T = inlet.T;

equation
  1./UA = 1./(CO.hConvWater*areaInside) + pipeThickness/(k*((areaInside+areaOutside)/2)) + 1./(CO.hConvAir*areaOutside);

  inlet.water + outlet.water = 0;

  when inlet.water > triggerValue then
    reinit(outlet.T, inlet.T);
  end when;

  if inlet.water > triggerValue then
    der(outlet.T) = 0;
  else
    CO.VolSpecificHeatCapWater*volume*der(outlet.T) = -UA*(outlet.T-tEnvironment);
  end if;
  
  CO.VolSpecificHeatCapWater*volume*der(outlet.T) = heatOutlet.heat;
  
end PipeLossesAtRest;

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  



end WaterPipes;
