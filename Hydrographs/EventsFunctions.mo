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
	parameter Integer nbEvents=4;
	output Real y;
	Real events[nbEvents];
	Integer state[2];
  algorithm
	for i in 1:nbEvents loop
	  state := Modelica.Math.Random.Generators.Xorshift64star.initialState(i+1,0);
	  events[i] := Modelica.Math.Random.Generators.Xorshift64star.random(state)*86400 "Randomly distributed along the simulation time"; //this should somehow be related to the simulation parameter StopTime, but I couldn't figure how to call it.
	end for;
  equation
	y = (if WaterHub.BaseClasses.BaseFunctions.checkIfInArray(time, integer(events)) then 1 else 0);
  end testFunction; 

end EventsFunctions;
