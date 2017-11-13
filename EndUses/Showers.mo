within OMLibrary.EndUses;


package Showers

  
  model SimpleShower
    OMLibrary.SIUnits.VolumeFlow f(start=10);
  equation
    der(f) = -0.2;  //Loses some flow along the way
  end SimpleShower;


end Showers;