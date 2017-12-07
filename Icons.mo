within WaterHub;

package Icons "Library of Icons, inspired from Modelica Standard Library 3.2.2"
  extends Modelica.Icons.UtilitiesPackage;

  partial class MainIcon
	extends Modelica.Icons.Package;
	annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Ellipse(origin={0.0,-30.0},
            fillColor={0,166,208},
            extent={{-53.5,-53.5},{53.5,53.5}},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            startAngle=-25.0,
            endAngle=205.0,
            rotation=180.0),
          Polygon(
            origin={-0.0,-30.1},
            rotation=0.0,
            fillColor={0,166,208},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{0.0,0.0},{48.487548,22.610077},{0.0,110.0},{-48.487548,22.610077}})}));
  end MainIcon;


  partial class ModelIcon
	extends Modelica.Icons.Package;
	annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Text(
            extent={{-90.0,-20.0},{90.0,20.0}},
            lineColor={0,0,0},
            textString="%name")}),
          Documentation(info="<html>
<p>Base Icon for model classes.</p>
</html>"));
  end ModelIcon;

end Icons;