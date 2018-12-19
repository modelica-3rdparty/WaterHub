within WaterHub.EndUses;

package BaseEndUses
  extends Modelica.Icons.Package;

  partial model BasicValve "partial model that has two water inlets (hot, cold), one outlet and one data input connector"
    extends WaterHub.Icons.ModelIcon;

    //inlet ports
    WaterHub.BaseClasses.WaterPort_in inletCold(water(min=-10e-5))
    annotation (Placement(transformation(extent={{-110,-30},{-90,-10}})));
    WaterHub.BaseClasses.WaterPort_in inletHot(water(min=-10e-5))
    annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
    Modelica.Blocks.Interfaces.RealInput flowInput
    annotation (Placement(transformation(extent={{-10,90},{10,110}}, rotation=-90)));
    
    //outlet ports
    WaterHub.BaseClasses.WaterPort_out outlet(water(max=0))
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));

  end BasicValve;


end BaseEndUses;
