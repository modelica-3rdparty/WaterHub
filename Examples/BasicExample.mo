within WaterHub.Examples;

model BasicExample
  extends Modelica.Icons.Example;
  WaterHub.RecoverySystems.HeatExchangers.NotSoSimpleHeatExchanger notSoSimpleHeatExchanger1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  WaterHub.Blocks.Sources.hydrographFromFile hydrographFromFile1(fileName = "/home/hadengbr/Polybox/EAWAG/04_Programming/Python/HydroGen/FlowTableExample.csv") annotation(
    Placement(visible = true, transformation(origin = {0, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  WaterHub.Supply.WaterSupply.InfiniteSupplyMO infiniteSupplyMO1(n = 3) annotation(
    Placement(visible = true, transformation(origin = {-124, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  WaterHub.SinksReservoirs.Sinks.EndlessSinkMI endlessSinkMI1(n = 2) annotation(
    Placement(visible = true, transformation(origin = {116, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  WaterHub.Blocks.Sources.hydrographFromFile hydrographFromFile2(fileName = "/home/hadengbr/Polybox/EAWAG/04_Programming/Python/HydroGen/FlowTable.csv") annotation(
    Placement(visible = true, transformation(origin = {0, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  WaterHub.Supply.EnergySupply.InfiniteSupplyMO infiniteSupplyMO2(n = 1) annotation(
    Placement(visible = true, transformation(origin = {-124, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  WaterHub.Supply.Boilers.InstantaneousBoiler Boiler(n = 2) annotation(
    Placement(visible = true, transformation(origin = {-66, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  WaterHub.EndUses.Taps.ClassicTap Tap(T_wanted = 290) annotation(
    Placement(visible = true, transformation(origin = {0, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  WaterHub.EndUses.Showers.ClassicShower Shower annotation(
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(hydrographFromFile2.y[1], Tap.flowInput) annotation(
    Line(points = {{11, -46}, {18, -46}, {18, -60}, {0, -60}, {0, -64}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Tap.outlet, endlessSinkMI1.inlet[2]) annotation(
    Line(points = {{10, -74}, {60, -74}, {60, -14}, {106, -14}, {106, -14}}, color = {0, 127, 255}));
  connect(infiniteSupplyMO1.outlets[3], Tap.inletCold) annotation(
    Line(points = {{-114, -14}, {-92, -14}, {-92, -76}, {-10, -76}}, color = {0, 127, 255}, thickness = 0.5));
  connect(Boiler.outlet[2], Tap.inletHot) annotation(
    Line(points = {{-56, 32}, {-42, 32}, {-42, -72}, {-10, -72}, {-10, -72}}, color = {0, 127, 255}, thickness = 0.5));
  connect(Boiler.outlet[1], Shower.inletHot) annotation(
    Line(points = {{-56, 32}, {-30, 32}, {-30, 28}, {-10, 28}, {-10, 28}}, color = {0, 127, 255}, thickness = 0.5));
  connect(notSoSimpleHeatExchanger1.outletCold, Shower.inletCold) annotation(
    Line(points = {{-10, 0}, {-30, 0}, {-30, 24}, {-10, 24}, {-10, 24}}, color = {0, 127, 255}));
  connect(hydrographFromFile1.y[1], Shower.flowInput) annotation(
    Line(points = {{12, 52}, {18, 52}, {18, 40}, {0, 40}, {0, 36}, {0, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(Shower.outlet, notSoSimpleHeatExchanger1.inletHot) annotation(
    Line(points = {{10, 26}, {16, 26}, {16, 12}, {0, 12}, {0, 10}, {0, 10}, {0, 10}}, color = {0, 127, 255}));
  connect(infiniteSupplyMO1.outlets[2], notSoSimpleHeatExchanger1.inletCold) annotation(
    Line(points = {{-114, -14}, {0, -14}, {0, -10}, {0, -10}}, color = {0, 127, 255}, thickness = 0.5));
  connect(infiniteSupplyMO2.outlet[1], Boiler.energy_in) annotation(
    Line(points = {{-114, 54}, {-66, 54}, {-66, 42}, {-66, 42}}, color = {127, 0, 0}, thickness = 0.5));
  connect(infiniteSupplyMO1.outlets[1], Boiler.inlet) annotation(
    Line(points = {{-114, -14}, {-92, -14}, {-92, 32}, {-76, 32}, {-76, 32}}, color = {0, 127, 255}, thickness = 0.5));
  connect(notSoSimpleHeatExchanger1.outletHot, endlessSinkMI1.inlet[1]) annotation(
    Line(points = {{10, 0}, {60, 0}, {60, -14}, {106, -14}}, color = {0, 127, 255}));
  annotation(
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    uses(Modelica(version = "3.2.2")));
end BasicExample;