within WaterHub.PipesCarriers;

package WaterPipes

  extends Modelica.Icons.Package;
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;
  
  
  model Pipe "Inspired by Modelica.Fluid.Pipes"
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
    parameter Real triggerValue=10e-2 "Real value triggering the modeling of heat losses";
    parameter SI.PipeLength pipeLength=10;
    parameter SI.PipeDiameter pipeDiameter=0.1;
    parameter SI.PipeThickness pipeThickness = 0.01;
    parameter CO.MaterialConstants.Material material=CO.MaterialConstants.Material.Copper;
    final parameter SI.Volume volume;
    final parameter SI.CoefficientOfHeatTransfer h;
    final parameter SI.ThermalConductivity k;
    
    //inlets
    WaterHub.BaseClasses.WaterPort_in inlet(water(min=-10e-5)) 
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    //outlets
    WaterHub.BaseClasses.WaterPort_out outlet(water(max=10e-5))
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));
    
  algorithm
    volume := pipeLength*CO.pi*(pipeDiameter/2)^2;
    if material == CO.MaterialConstants.Material.Copper then
	 h := 13.1 "for water-copper-air system";
	 k := 399.0;
    else
	 h := 0.0;
	 k := 0.0; //not implemented for other materials
    end if;
  
//  equation
//    if outlet.water > -triggerValue then
	 
//    end if;
  
  end Pipe;


end WaterPipes;
