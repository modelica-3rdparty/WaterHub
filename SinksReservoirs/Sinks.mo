within WaterHub.SinksReservoirs;

package Sinks
  extends Modelica.Icons.Package;
  model EndlessSinkSI "Endless sink with single inlet"
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.WaterPort_in inlet
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  end EndlessSinkSI;
  
  model EndlessSinkMI "Endless sink with multiple inlets"
    extends WaterHub.Icons.ModelIcon;
    parameter Integer n=1;
    WaterHub.BaseClasses.WaterPorts_in[n] inlet
    annotation (Placement(transformation(extent={{-110,-40},{-90,40}})));
  end EndlessSinkMI;



end Sinks;
