within WaterHub.EndUses;

package Showers
  import SI=WaterHub.SIUnits;
  import CO = WaterHub.Constants;
 
  model SimpleShower
    extends WaterHub.Icons.Package;
    WaterHub.BaseClasses.WaterPort inletCold(water(min=0));
    WaterHub.BaseClasses.WaterPort inletHot(water(min=0));
    WaterHub.BaseClasses.WaterPort outlet(water(max=0));
    WaterHub.BaseClasses.HeatPort heat_in(heat(min=0));

    parameter SI.AbsoluteTemperature T_wanted = 310;
    SI.AbsoluteTemperature T_achieved;
    SI.AbsoluteTemperature T_preheatedCold "Temperature of the preheated cold water";
    parameter SI.WaterFlow water_wanted = 0.4;
  
  algorithm
    if T_wanted < inletCold.T then   //Make sure wanted T is inside the boundary set by Hot and Cold Water
      T_achieved := inletCold.T;
    elseif T_wanted > inletHot.T then  
      T_achieved := inletHot.T;
    else
      T_achieved := T_wanted;
    end if;
  
  equation
    T_preheatedCold*inletCold.water = inletCold.T*inletCold.water + (heat_in.heat/CO.VolSpecificHeatCapWater);
    -T_achieved*outlet.water = T_preheatedCold*inletCold.water+inletHot.T*inletHot.water;
    inletCold.water+inletHot.water = water_wanted;
    outlet.water + water_wanted = 0;
    outlet.T = T_achieved;
      
  end SimpleShower;



  model NotSoSimpleShower
    extends WaterHub.Icons.Package;
    WaterHub.BaseClasses.WaterPort_in inletCold(water(min=0))
    annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
    WaterHub.BaseClasses.WaterPort_in inletHot(water(min=0))
    annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
    WaterHub.BaseClasses.WaterPort_out outlet(water(max=0))
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));

    parameter SI.AbsoluteTemperature T_wanted = 310;
    SI.AbsoluteTemperature T_achieved;
    parameter SI.WaterFlow water_wanted = 0.4;
  
  algorithm
    if T_wanted < inletCold.T then   //Make sure wanted T is inside the boundary set by Hot and Cold Water
      T_achieved := inletCold.T;
    elseif T_wanted > inletHot.T then  
      T_achieved := inletHot.T;
    else
      T_achieved := T_wanted;
    end if;
  
  equation
    -T_achieved*outlet.water = inletCold.T*inletCold.water+inletHot.T*inletHot.water "energy balance";
    inletCold.water+inletHot.water = water_wanted "mass balance";
    outlet.water + inletCold.water+inletHot.water = 0;
    outlet.T = T_achieved;  
  end NotSoSimpleShower;





end Showers;
