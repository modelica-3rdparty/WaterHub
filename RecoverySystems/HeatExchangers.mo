within WaterHub.RecoverySystems;

package HeatExchangers
  import SI=WaterHub.SIUnits;
  import CO=WaterHub.Constants;
  extends Modelica.Icons.Package;
  
  model SimpleHeatExchanger "Retrieves energy and direct input into SimpleShower"
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.WaterPort inlet;
    WaterHub.BaseClasses.HeatPort heat_out;
    parameter Real efficiency=0.15 "Efficiency of heat retrieval";
    SI.HeatFlow heat_in;
    SI.AbsoluteTemperature T_out;
  equation
    heat_in = CO.VolSpecificHeatCapWater*inlet.T*inlet.water;
    -heat_out.heat = efficiency*heat_in;
    T_out = ((1-efficiency)*heat_in)/(inlet.water*CO.VolSpecificHeatCapWater);
  end SimpleHeatExchanger;


  model NotSoSimpleHeatExchanger "Derived from https://en.wikipedia.org/wiki/Heat_exchanger : model of simple heat exchanger"
    extends WaterHub.Icons.ModelIcon;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                Line(points = {{-92.4,92.4},{92.4,-92.4}}, color = {0,0,0}, thickness = 0.5),
                Line(points = {{0,-100},{-5,-5},{-100,0}}, color = {0,0,255}, thickness = 1.5, smooth=Smooth.Bezier),
                Line(points = {{0,100},{5,5},{100,0}}, color = {208,52,43}, thickness = 1.5, smooth=Smooth.Bezier)
                    }));

    WaterHub.BaseClasses.WaterPort_in inletHot(water(min=0.0)) annotation (Placement
    (transformation(extent={{-10,90},{10,110}})));
    WaterHub.BaseClasses.WaterPort_in inletCold(water(min=0.0)) annotation (Placement
    (transformation(extent={{-10,-110},{10,-90}})));
    WaterHub.BaseClasses.WaterPort_out outletHot(water(max=0.0)) annotation (Placement
    (transformation(extent={{90,-10},{110,10}})));
    WaterHub.BaseClasses.WaterPort_out outletCold(water(max=0.0)) annotation(Placement
    (transformation(extent={{-110,-10},{-90,10}})));

    Real alphaFactor(start=0.0, max=1.0) "Efficiency factor. Depends on length of tube, heat exchange coefficient, flows and area of contact";
    parameter Real flowHE = 1 "1 if parallel flow, -1 if counterflow";
    SI.TemperatureDifference dT "Temperature between hot/cold inputs";

  equation
    der(alphaFactor)=0.05;
    dT = inletHot.T-inletCold.T; //cannot be negative!
    outletCold.water+inletCold.water = 0;
    outletHot.water+inletHot.water = 0;
    outletCold.T = inletCold.T + (dT/(1+flowHE*(abs(inletCold.water/inletHot.water))))*alphaFactor "Expression for preheated cold water";
    outletHot.T = inletHot.T - (dT/(1+flowHE*(abs(inletHot.water/inletCold.water))))*alphaFactor "Expression for outlet hot water";
//    inletCold.T*inletCold.water + inletHot.T*inletHot.water =
//    -(outletCold.T*outletCold.water+outletHot.T*outletHot.water) "energy balance";
  end NotSoSimpleHeatExchanger;

end HeatExchangers;
