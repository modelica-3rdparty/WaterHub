within WaterHub;

package Icons "Library of Icons, inspired from Modelica Standard Library 3.2.2"

  partial class Information "Icon for general information packages"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Ellipse(
            lineColor={75,138,73},
            fillColor={75,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Polygon(origin={-4.167,-15.0},
            fillColor={255,255,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
            smooth=Smooth.Bezier),
          Ellipse(origin={7.5,56.5},
            fillColor={255,255,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{-12.5,-12.5},{12.5,12.5}})}),
                              Documentation(info="<html>
<p>This icon indicates classes containing only documentation, intended for general description of, e.g., concepts and features of a package.</p>
</html>"));
  end Information;

  partial class Contact "Icon for contact information"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,70},{100,-72}},
            lineColor={0,0,0},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,-72},{100,-72},{0,20},{-100,-72}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{22,0},{100,70},{100,-72},{22,0}},
            lineColor={0,0,0},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,70},{100,70},{0,-20},{-100,70}},
            lineColor={0,0,0},
            fillColor={241,241,241},
            fillPattern=FillPattern.Solid)}),
                              Documentation(info="<html>
<p>This icon shall be used for the contact information of the library developers.</p>
</html>"));
  end Contact;

  partial class ReleaseNotes "Icon for release notes in documentation"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Polygon(
            points={{-80,-100},{-80,100},{0,100},{0,20},{80,20},{80,-100},{-80,
                -100}},
            lineColor={0,0,0},
            fillColor={245,245,245},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{0,100},{80,20},{0,20},{0,100}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{2,-12},{50,-12}}),
          Ellipse(
            extent={{-56,2},{-28,-26}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{2,-60},{50,-60}}),
          Ellipse(
            extent={{-56,-46},{-28,-74}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>This icon indicates release notes and the revision history of a library.</p>
</html>"));
  end ReleaseNotes;

  partial class References "Icon for external references"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Polygon(
            points={{-100,-80},{-100,60},{-80,54},{-80,80},{-40,58},{-40,100},{
                -10,60},{90,60},{100,40},{100,-100},{-20,-100},{-100,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={245,245,245},
            fillPattern=FillPattern.Solid),
          Polygon(points={{-20,-100},{-10,-80},{90,-80},{100,-100},{-20,-100}},
              lineColor={0,0,0}),
          Line(points={{90,-80},{90,60},{100,40},{100,-100}}),
          Line(points={{90,60},{-10,60},{-10,-80}}),
          Line(points={{-10,60},{-40,100},{-40,-40},{-10,-80},{-10,60}}),
          Line(points={{-20,-88},{-80,-60},{-80,80},{-40,58}}),
          Line(points={{-20,-100},{-100,-80},{-100,60},{-80,54}}),
          Line(points={{10,30},{72,30}}),
          Line(points={{10,-10},{70,-10}}),
          Line(points={{10,-50},{70,-50}})}), Documentation(info=
           "<html>
<p>This icon indicates a documentation class containing references to external documentation and literature.</p>
</html>"));
  end References;

  partial package ExamplesPackage
    "Icon for packages containing runnable examples"
    extends Modelica.Icons.Package;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Polygon(
            origin={8.0,14.0},
            lineColor={78,138,73},
            fillColor={78,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}), Documentation(info="<html>
<p>This icon indicates a package that contains executable examples.</p>
</html>"));
  end ExamplesPackage;

  partial model Example "Icon for runnable examples"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Ellipse(lineColor = {75,138,73},
                  fillColor={255,255,255},
                  fillPattern = FillPattern.Solid,
                  extent = {{-100,-100},{100,100}}),
          Polygon(lineColor = {0,0,255},
                  fillColor = {75,138,73},
                  pattern = LinePattern.None,
                  fillPattern = FillPattern.Solid,
                  points = {{-36,60},{64,0},{-36,-60},{-36,60}})}), Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
  end Example;

  partial package Package "Icon for standard packages"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100.0,-100.0},{100.0,100.0}},
            radius=25.0)}),   Documentation(info="<html>
<p>Standard package icon.</p>
</html>"));
  end Package;
  
end Icons;