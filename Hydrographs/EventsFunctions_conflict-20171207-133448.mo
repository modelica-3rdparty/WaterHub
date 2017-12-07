within WaterHub.Hydrographs;

package EventsFunctions
  extends Modelica.Icons.Package;
  
  function UniformEvents
    extends Modelica.Icons.Function;
    input Integer n "number of events during the day";
    //output Real eventsArray(start=0);
  algorithm
    for i in 1:n loop
		print(i);
	end for;
  end UniformEvents;

  block testFunction
	extends Modelica.Blocks.Icons.Block;
//	extends WaterHub.Icons.Package;
	Modelica.Interface.IntegerInput n annotation (Placement(
          transformation(extent={{-140,-20},{-100,20}})));
  algorithm
	UniformEvents(n);
  end testFunction; 

end EventsFunctions;
