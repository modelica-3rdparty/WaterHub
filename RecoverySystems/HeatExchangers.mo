within WaterHub.RecoverySystems;

package HeatExchangers
  import SI=WaterHub.SIUnits;
  import CO=WaterHub.Constants;
  
  model SimpleHeatExchanger
    WaterHub.BaseClasses.WaterPort inlet;
//    WaterHub.BaseClasses.WaterPort outlet;
    WaterHub.BaseClasses.HeatPort heat_out;
    parameter Real efficiency=0.15 "Efficiency of heat retrieval";
    SI.HeatFlow heat_in;
    SI.AbsoluteTemperature T_out;
  equation
    heat_in = CO.VolSpecificHeatCapWater*inlet.T*inlet.water;
    -heat_out.heat = efficiency*heat_in;
    T_out = ((1-efficiency)*heat_in)/(inlet.water*CO.VolSpecificHeatCapWater);
  end SimpleHeatExchanger;
  
end HeatExchangers;
