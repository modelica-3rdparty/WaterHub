within WaterHub;
package BaseClasses 
  "Includes the Base Classes for the different building blocks and the interface behavior (heat, flows)"
  
  import SI=WaterHub.SIUnits;
  
  connector WaterPort
    flow SI.WaterFlow water;
    SI.AbsoluteTemperature T;
  end WaterPort;

  connector HeatPort
    flow SI.HeatFlow heat;
  end HeatPort;  

end BaseClasses;