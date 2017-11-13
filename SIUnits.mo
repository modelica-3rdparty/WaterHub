within WaterHub;

package SIUnits

  //Lengths

  type Length = Real (final quantity = "Length", final unit = "m");
  type PipeLength = Length(min=0);
  
  //Energy

  type Energy = Real (final quantity = "Energy", final unit = "J");
  type EnergyFlow = Real (final Quantity = "Energy Flow", final unit = "J/s");
  type Power = Real (final Quantity = "Power", final unit = "W");
  type EnergyDensity = Real (final quantity = "Energy", final unit = "J/m3");


  //Mass and Volume

  type Mass = Real (final quantity = "Mass", final unit = "kg");
  type MassFlow = Real (final quantity = "Mass Flow", final unit = "kg/s");
  type Volume = Real (final quantity = "Volume", final unit = "m3");
  type VolumeFlow = Real (final quantity = "Volume Flow", final unit = "m3/s");
  type Density = Real (final quantity = "Density", final unit = "kg/m3");


  //Thermodynamics

  type AbsoluteTemperature = Real (final quantity = "Absolute Temperature",
				   final unit = "K",
				   min = 0.0,
				   start = 288.15);
  type Heat = Real (final quantity="Heat", final unit="J");
  type HeatFlowRate = Real (final quantity="Power", final unit="W");
  type HeatFlux = Real (final quantity="HeatFlux", final unit="W/m2");
  type DensityOfHeatFlowRate = Real (final quantity="DensityOfHeatFlowRate",
				    final unit="W/m2");
  type CoefficientOfHeatTransfer = Real (final quantity="CoefficientOfHeatTransfer",
					 final unit="W/(m2.K)");
  type ThermalConductivity = Real (final quantity="ThermalConductivity",
				   final unit="W/(m.K)");


end SIUnits;
