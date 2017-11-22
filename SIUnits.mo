within WaterHub;

package SIUnits

  //Lengths

  type Length = Real (final quantity = "Length", final unit = "m");
  type PipeLength = Length(min=0);
  type Velocity = Real (final quantity = "Velocity", final unit = "m/s");
  type Acceleration = Real (final quantity = "Acceleration", final unit = "m/s2");
  
  //Energy

  type Energy = Real (final quantity = "Energy", final unit = "J");
  type EnergyFlow = Real (final quantity = "Energy Flow", final unit = "J/s");
  type Power = Real (final quantity = "Power", final unit = "W");
  type EnergyDensity = Real (final quantity = "Energy", final unit = "J/m3");


  //Mass and Volume

  type Mass = Real (final quantity = "Mass", final unit = "kg");
  type MassFlow = Real (final quantity = "Mass Flow", final unit = "kg/s");
  type Volume = Real (final quantity = "Volume", final unit = "L");
  type VolumeFlow = Real (final quantity = "Volume Flow", final unit = "L/s");
  type Density = Real (final quantity = "Density", final unit = "kg/m3");
  type WaterFlow = Real (final quantity = "Water Flow", final unit = "L/s");


  //Thermodynamics

  type AbsoluteTemperature = Real (final quantity = "Absolute Temperature",
				   final unit = "K",
				   min = 0.0,
				   start = 288.15);
  type TemperatureDifference = Real (final quantity = "Temperature Difference", 
                final unit = "K", min = 0.0);
  type Heat = Real (final quantity="Heat", final unit="J");
  type HeatFlow = Real (final quantity="Heat Flow", final unit="W");
  type HeatFlux = Real (final quantity="Heat Flux", final unit="W/m2");
  type DensityOfHeatFlowRate = Real (final quantity="DensityOfHeatFlowRate",
				    final unit="W/m2");
  type CoefficientOfHeatTransfer = Real (final quantity="CoefficientOfHeatTransfer",
					 final unit="W/(m2.K)");
  type ThermalConductivity = Real (final quantity="ThermalConductivity",
				   final unit="W/(m.K)");


end SIUnits;
