within WaterHub.Examples;

model JouliaShower
  WaterHub.Supply.WaterSupply.InfiniteSupply coldFlow(outlet.T = 283.15);
  WaterHub.Supply.WaterSupply.InfiniteSupply hotFlow(outlet.T = 333.15);
  WaterHub.EndUses.Showers.NotSoSimpleShower shower1;
  WaterHub.RecoverySystems.HeatExchangers.NotSoSimpleHeatExchanger he1(alphaFactor=0.4);
  WaterHub.Supply.WaterSupply.EndlessSink sink;
equation
  connect(coldFlow.outlet, he1.inletCold);
  connect(hotFlow.outlet, shower1.inletHot);
  connect(shower1.outlet, he1.inletHot);
  connect(he1.outletCold, shower1.inletCold);
  connect(he1.outletHot, sink.inlet);
end JouliaShower;