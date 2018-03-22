within WaterHub.SinksReservoirs;

package Sinks
  extends Modelica.Icons.Package;
  
  partial model BaseWaterSink
    extends Modelica.Icons.BasesPackage;
    SI.Volume cumulatedWater(start=0.0);
  end BaseWaterSink;
   
  model WaterSinkSI "Endless water sink with single inlet"
    extends BaseWaterSink;
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.WaterPort_in inlet
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  equation
    der(cumulatedWater) = inlet.water;
  end WaterSinkSI;
  
  model WaterSinkMI "Endless water sink with multiple inlets"
    extends BaseWaterSink;
    extends WaterHub.Icons.ModelIcon;
    parameter Integer n=1 "Number of ports";
    WaterHub.BaseClasses.WaterPorts_in[n] inlet
    annotation (Placement(transformation(extent={{-110,-40},{-90,40}})));
  equation
    der(cumulatedWater) = sum(inlet[i].water for i in 1:n);
  end WaterSinkMI;


  partial model BaseHeatSink
    extends Modelica.Icons.BasesPackage;
    SI.Heat cumulatedHeat(start=0.0);
  end BaseHeatSink;

  model HeatSinkSI "Endless heat sink with single inlet"
    extends BaseHeatSink;
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.HeatPort_in inlet
    annotation (Placement(transformation(extent={{-110,-40},{-90,40}})));
  equation
    der(cumulatedHeat) = inlet.heat;
  end HeatSinkSI;

  model HeatSinkMI "Endless heat sink with multiple inlet"
    extends BaseHeatSink;
    extends WaterHub.Icons.ModelIcon;
    parameter Integer n=1 "Number of ports";
    WaterHub.BaseClasses.HeatPorts_in[n] inlet
    annotation (Placement(transformation(extent={{-110,-40},{-90,40}})));
  equation
    der(cumulatedHeat) = sum(inlet[i].heat for i in 1:n);
  end HeatSinkMI;

end Sinks;
