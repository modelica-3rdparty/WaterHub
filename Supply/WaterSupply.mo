within WaterHub.Supply;
package WaterSupply

  model InfiniteSupply "Infinite Supply of water, basically just one outlet port that delivers whatever flow is needed"
    extends WaterHub.Icons.Package;
    WaterHub.BaseClasses.WaterPort_out outlet
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    parameter SI.AbsoluteTemperature T "Temperature of supplied water flow";
  equation
    outlet.T = T;
  end InfiniteSupply;

end WaterSupply;
