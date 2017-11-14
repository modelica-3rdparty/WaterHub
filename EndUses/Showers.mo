within WaterHub.EndUses;

package Showers
  import SI=WaterHub.SIUnits
  import Co = WaterHub.Constants
  model SimpleShower
    extends WaterHub.BaseClasses.TwoPortsBlock;
    
  equation
    inlet.water = 0.2;
    inlet.T = 288.15;
    inlet.electricity = 0
    inlet.water = outlet.water;
    inlet.heat = VolSpecificHeatCapWater*inlet.T*inlet*water
  end SimpleShower;


end Showers;