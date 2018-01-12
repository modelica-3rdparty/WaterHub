within WaterHub.EndUses;

package Showers
  extends Modelica.Icons.Package;
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;

  partial model BaseShower "A base shower model in which the basic algorithm for achieved temperature is defined"
    extends Modelica.Icons.BasesPackage;
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
  end BaseShower;


  model ClassicShower "Shower model that takes an external hydrograph as input values or demands a steady flow (water_wanted)."
    extends BaseShower;
    extends WaterHub.EndUses.BaseEndUses.BasicComponents;

  equation
    -T_achieved*outlet.water = inletCold.T*inletCold.water+inletHot.T*inletHot.water "Energy balance";
    inletCold.water + inletHot.water = flowInput "Mass balance";
   // inletCold.water+inletHot.water = water_wanted "Mass balance"; // if fixed flow (steady-state)
    outlet.water + inletCold.water + inletHot.water = 0 "Flow balance";
    outlet.T = T_achieved;

    annotation (defaultComponentName="Shower");
  end ClassicShower;



///////////////////////Obsolete Models///////////////////////
  model SimpleShower "obsolete shower description"
    extends BaseShower;
    extends WaterHub.Icons.ModelIcon;
    SI.AbsoluteTemperature T_preheatedCold "Temperature of the preheated cold water";
    parameter SI.WaterFlow water_wanted = 0.4 "Demanded Flow";

    //inlet ports
    WaterHub.BaseClasses.HeatPort heat_in(heat(min=0));
    WaterHub.BaseClasses.WaterPort inletCold(water(min=0));
    WaterHub.BaseClasses.WaterPort inletHot(water(min=0));
    //outlet ports
    WaterHub.BaseClasses.WaterPort outlet(water(max=0));
  equation
    T_preheatedCold*inletCold.water = inletCold.T*inletCold.water + (heat_in.heat/CO.VolSpecificHeatCapWater);
    -T_achieved*outlet.water = T_preheatedCold*inletCold.water+inletHot.T*inletHot.water;
    inletCold.water+inletHot.water = water_wanted;
    outlet.water + water_wanted = 0;
    outlet.T = T_achieved;

    annotation (defaultComponentName="Shower");
  end SimpleShower;


end Showers;
