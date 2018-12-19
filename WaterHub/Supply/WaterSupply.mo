within WaterHub.Supply;
package WaterSupply
  extends Modelica.Icons.Package;

  model InfiniteSupplySO "Infinite Supply of water, basically just one outlet port that delivers whatever flow is needed"
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.WaterPort_out outlet
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    parameter SI.AbsoluteTemperature T=283 "Temperature of supplied water flow";
  equation
    outlet.T = T;
  end InfiniteSupplySO;

  model InfiniteSupplyMO "Infinite Supply of water, basically several outlet ports that deliver whatever flow is needed"
    extends WaterHub.Icons.ModelIcon;
    parameter Integer n=1 "Number of ports";
    WaterHub.BaseClasses.WaterPorts_out[n] outlets
	 annotation (Placement(transformation(extent={{90,-40},{110,40}})));
    parameter SI.AbsoluteTemperature T=283 "Temperature of supplied water flow";
  equation
    for i in 1:n loop
      outlets[i].T = T;
    end for;
  end InfiniteSupplyMO;

end WaterSupply;
