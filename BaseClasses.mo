within WaterHub;
package BaseClasses "Includes the Base Classes for the different building blocks and the interface behavior (heat, flows)"
  extends Modelica.Icons.BasesPackage;

  import SI=WaterHub.SIUnits;

  connector WaterPort
    flow SI.WaterFlow water;
    SI.AbsoluteTemperature T;
  end WaterPort;

  connector WaterPort_in
    extends WaterPort;
    annotation (defaultComponentName="port_in",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
            //, Text(extent={{-150,100},{150,200}},textString="%name")}));
    end WaterPort_in;

  connector WaterPort_out
    extends WaterPort;
    annotation (defaultComponentName="port_out",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,30},{30,-30}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,127,255},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
            //, Text(extent={{-150,100},{150,200}},textString="%name")}));
    end WaterPort_out;


  connector HeatPort
    flow SI.HeatFlow heat;
  end HeatPort;

  connector HeatPort_in
    extends HeatPort;
    annotation (defaultComponentName="port_in",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={208,52,5},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid)}));
  end HeatPort_in;

  connector HeatPort_out
    extends HeatPort;
    annotation (defaultComponentName="port_out",
                Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,30},{30,-30}},
            lineColor={208,52,5},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={208,52,5},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={208,52,5},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={208,52,5},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
            //, Text(extent={{-150,100},{150,200}},textString="%name")}));
  end HeatPort_out;

package BaseFunctions
  extends Modelica.Icons.Package;
  
  function checkIfInArray
    extends Modelica.Icons.Function;
    
    input Real scal;
    input Real array[:];
    output Boolean bool=false;
  algorithm
	for i loop
	  if scal == array[i] then bool := true; end if;
	end for;
  end checkIfInArray;

end BaseFunctions;

end BaseClasses;
