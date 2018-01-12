within WaterHub.EndUses;

package Taps
  extends Modelica.Icons.Package;
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;

  model ClassicTap
    extends WaterHub.EndUses.BaseEndUses.BasicComponents;
    parameter SI.AbsoluteTemperature T_wanted = 310 "Target Temperature";
    SI.AbsoluteTemperature T_achieved "Achieved Temperature";
  
  algorithm
    if T_wanted < inletCold.T then   //Make sure wanted T is inside the boundary set by Hot and Cold Water
      T_achieved := inletCold.T;
    elseif T_wanted > inletHot.T then
      T_achieved := inletHot.T;
    else
      T_achieved := T_wanted;
    end if;
    
  equation
    -T_achieved*outlet.water = inletCold.T*inletCold.water+inletHot.T*inletHot.water "Energy balance";
    inletCold.water + inletHot.water = flowInput "Mass balance";
   // inletCold.water+inletHot.water = water_wanted "Mass balance"; // if fixed flow (steady-state)
    outlet.water + inletCold.water + inletHot.water = 0 "Flow balance";
    outlet.T = T_achieved;

    annotation (defaultComponentName="Tap");
  end ClassicTap;


end Taps;
