// Derived and inspired from the Standard Modelica Library 3.2.2

within WaterHub;
package BaseClasses
  "Includes the Base Classes for the different building blocks and the interface behavior (heat, flows)"
  import SI=WaterHub.SIUnits;
  
  connector Port
    flow SI.WaterFlow water;
    SI.AbsoluteTemperature T;
    flow SI.HeatFlow heat;
    flow SI.EnergyFlow electricity;
    flow SI.EnergyFlow energyCarrier;
  end Port;
      
  partial model TwoPortsBlock
    WaterHub.BaseClasses.Port inlet;
    WaterHub.BaseClasses.Port outlet;
  end TwoPortsBlock;
  
end BaseClasses;