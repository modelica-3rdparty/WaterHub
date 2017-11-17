within WaterHub;

package Examples
  extends WaterHub.Icons.ExamplesPackage;

  model SimpleShowerAndHE
    extends WaterHub.Icons.Example;
    WaterHub.Supply.WaterSupply.InfiniteSupply coldFlow(outlet.T=283.15);
    WaterHub.Supply.WaterSupply.InfiniteSupply hotFlow(outlet.T=333.15);
    WaterHub.EndUses.Showers.SimpleShower shower1;
    WaterHub.RecoverySystems.HeatExchangers.SimpleHeatExchanger he1;
  equation
    connect(coldFlow.outlet, shower1.inletCold);
    connect(hotFlow.outlet, shower1.inletHot);
    connect(shower1.outlet, he1.inlet);
    connect(he1.heat_out, shower1.heat_in);
  end SimpleShowerAndHE;



  model JouliaShower
    extends WaterHub.Icons.Example;
    WaterHub.Supply.WaterSupply.InfiniteSupply coldFlow(T=283.15);
    WaterHub.Supply.WaterSupply.InfiniteSupply hotFlow(T=333.15);
    WaterHub.EndUses.Showers.NotSoSimpleShower shower1;
    WaterHub.RecoverySystems.HeatExchangers.NotSoSimpleHeatExchanger he1;
    WaterHub.SinksReservoirs.Sinks.EndlessSink sink1;
  equation
    connect(coldFlow.outlet, he1.inletCold);
    connect(hotFlow.outlet, shower1.inletHot);
    connect(shower1.outlet, he1.inletHot);
    connect(he1.outletCold, shower1.inletCold);
    connect(he1.outletHot, sink1.inlet);
  end JouliaShower;







  
end Examples;
