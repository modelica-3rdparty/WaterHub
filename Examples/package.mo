within WaterHub;

package Examples

  model ScriptingExample
    WaterHub.Supply.WaterSupply.InfiniteSupply coldFlow(outlet.T=283.15);
    WaterHub.Supply.WaterSupply.InfiniteSupply hotFlow(outlet.T=333.15);
    WaterHub.EndUses.Showers.SimpleShower shower1;
    WaterHub.RecoverySystems.HeatExchangers.SimpleHeatExchanger he1;
  equation
    connect(coldFlow.outlet, shower1.inletCold);
    connect(hotFlow.outlet, shower1.inletHot);
    connect(shower1.outlet, he1.inlet);
    connect(he1.heat_out, shower1.heat_in);
  end ScriptingExample;



  
end Examples;
