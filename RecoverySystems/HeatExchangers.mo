within WaterHub.RecoverySystems;

package HeatExchangers
  import SI=WaterHub.SIUnits;
  import CO=WaterHub.Constants;
  
  model SimpleHeatExchanger "Retrieves energy and direct input into SimpleShower"
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
    
    WaterHub.BaseClasses.WaterPort inletHot(water(min=0.0));
    WaterHub.BaseClasses.WaterPort inletCold(water(min=0.0));
    WaterHub.BaseClasses.WaterPort outletHot(water(max=0.0));
    WaterHub.BaseClasses.WaterPort outletCold(water(max=0.0));
    parameter Real alphaFactor=0.04 "Efficiency factor. Depends on length of tube, heat exchange coefficient, flows and area of contact";
    parameter Real flowHE = 1 "1 if parallel flow, -1 if counterflow";
    SI.TemperatureDifference dT "Temperature between hot/cold inputs";

  equation
    dT = inletHot.T-inletCold.T; //cannot be negative!
    outletCold.water+inletCold.water = 0;
    outletHot.water+inletHot.water = 0;
    outletCold.T = inletCold.T + (dT/(1+flowHE*(abs(inletCold.water/inletHot.water))))*alphaFactor "Expression for preheated cold water";
    outletHot.T = inletHot.T - (dT/(1+flowHE*(abs(inletHot.water/inletCold.water))))*alphaFactor "Expression for outlet hot water";
//    inletCold.T*inletCold.water + inletHot.T*inletHot.water = 
//    -(outletCold.T*outletCold.water+outletHot.T*outletHot.water) "energy balance";
  end NotSoSimpleHeatExchanger;
  
    
end HeatExchangers;
