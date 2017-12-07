within WaterHub.SinksReservoirs;

package Sinks
  extends Modelica.Icons.Package;
  model EndlessSink "Endless sink"
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.WaterPort_in inlet
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    SI.AbsoluteTemperature T;
  equation
    T = inlet.T;
  end EndlessSink;



end Sinks;
