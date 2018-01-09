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

  connector WaterPorts_in
    extends WaterPort;
    annotation (defaultComponentName="ports_in",
                Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Text(extent={{-75,130},{75,100}}, textString="%name"),
          Rectangle(
            extent={{25,-100},{-25,100}},
            lineColor={0,127,255}),
          Ellipse(
            extent={{-25,90},{25,40}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,25},{25,-25}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-25,-40},{25,-90}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}),
         Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-50,-200},{50,200}},
          initialScale=0.2), graphics={
          Rectangle(
            extent={{50,-200},{-50,200}},
            lineColor={0,127,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,180},{50,80}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,50},{50,-50}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,-80},{50,-180}},
            lineColor={0,0,0},
            fillColor={0,127,255},
            fillPattern=FillPattern.Solid)}));
  end WaterPorts_in;

  connector WaterPorts_out
    extends WaterPort;
  annotation (defaultComponentName="ports_b",
              Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-50,-200},{50,200}},
        initialScale=0.2), graphics={
        Text(extent={{-75,130},{75,100}}, textString="%name"),
        Rectangle(
          extent={{-25,100},{25,-100}},
          lineColor={0,0,0}),
        Ellipse(
          extent={{-25,90},{25,40}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-25,25},{25,-25}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-25,-40},{25,-90}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-15,-50},{15,-80}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-15,15},{15,-15}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-15,50},{15,80}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
       Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-50,-200},{50,200}},
        initialScale=0.2), graphics={
        Rectangle(
          extent={{-50,200},{50,-200}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,180},{50,80}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,-80},{50,-180}},
          lineColor={0,0,0},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-30,30},{30,-30}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-30,100},{30,160}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-30,-100},{30,-160}},
          lineColor={0,127,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
  end WaterPorts_out;


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

  connector HeatPorts_in
    extends HeatPort;
    annotation (defaultComponentName="heatPorts_in",
       Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-50},{200,50}},
        initialScale=0.2), graphics={
        Rectangle(
          extent={{-201,50},{200,-50}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-171,45},{-83,-45}},
          lineColor={127,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-45,45},{43,-45}},
          lineColor={127,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{82,45},{170,-45}},
          lineColor={127,0,0},
          fillColor={127,0,0},
          fillPattern=FillPattern.Solid)}));
  end HeatPorts_in;

  connector HeatPorts_out
    extends HeatPort;
  annotation (defaultComponentName="heatPorts_b",
       Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-50},{200,50}},
        initialScale=0.2), graphics={
        Rectangle(
          extent={{-200,50},{200,-51}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-170,44},{-82,-46}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-44,46},{44,-44}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{82,45},{170,-45}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
  end HeatPorts_out;

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
