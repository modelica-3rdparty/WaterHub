within WaterHub.Supply;
package EnergySupply
  extends Modelica.Icons.Package;
  
  model InfiniteSupplySO
    extends WaterHub.Icons.ModelIcon;
    WaterHub.BaseClasses.HeatPort_out outlet annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  end InfiniteSupplySO;

  model InfiniteSupplyMO
    extends WaterHub.Icons.ModelIcon;
    parameter Integer n=1 "Number of ports";
    WaterHub.BaseClasses.HeatPorts_out[n] outlet annotation (Placement(transformation(extent={{90,-40},{110,40}})));
  end InfiniteSupplyMO;



end EnergySupply;
