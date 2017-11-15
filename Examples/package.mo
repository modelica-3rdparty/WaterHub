within WaterHub;

package Examples

  model ScriptingExample
    WaterHub.Supply.WaterSupply.InfiniteSupply coldFlow(outlet.T=283.15);
    WaterHub.Supply.WaterSupply.InfiniteSupply hotFlow(outlet.T=300);
    WaterHub.EndUses.Showers.SimpleShower shower1;
  equation
    connect(coldFlow.outlet, shower1.inletCold);
    connect(hotFlow.outlet, shower1.inletHot);
  end ScriptingExample;

  
end Examples;
