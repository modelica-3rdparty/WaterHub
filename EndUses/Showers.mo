within WaterHub.EndUses;

package Showers
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;
 
  model SimpleShower
    WaterHub.BaseClasses.WaterPort inletCold;
    WaterHub.BaseClasses.WaterPort inletHot;
  //  WaterHub.BaseClasses.Port outlet;
  //  SI.HeatFlow heat_inlet;
  //  SI.HeatFlow heat_outlet;
  //  SI.AbsoluteTemperature T_outlet;
    parameter SI.AbsoluteTemperature T_wanted = 299;
    SI.AbsoluteTemperature T_achieved;
    parameter SI.WaterFlow water_wanted = 0.3;
  //  parameter Real lossParameter=0.1;
  algorithm
    if T_wanted < inletCold.T then
      T_achieved := inletCold.T;
    elseif T_wanted > inletHot.T then  
      T_achieved := inletHot.T;
    else
      T_achieved := T_wanted;
    end if;
  equation
    water_wanted = inletCold.water+inletHot.water;
    T_achieved*water_wanted = inletCold.T*inletCold.water+inletHot.T*inletHot.water;
  end SimpleShower;

end Showers;