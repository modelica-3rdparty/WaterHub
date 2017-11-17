within WaterHub;
package BaseClasses 
  "Includes the Base Classes for the different building blocks and the interface behavior (heat, flows)"
  
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
            fillPattern=FillPattern.Solid), Text(extent={{-150,110},{150,50}},
              textString="%name")}),
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
            fillPattern=FillPattern.Solid),
          Text(extent={{-150,110},{150,50}}, textString="%name")}),
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
    end WaterPort_out;


  connector HeatPort
    flow SI.HeatFlow heat;
  end HeatPort;  

end BaseClasses;