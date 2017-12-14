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

  block EventsGeneratorUniformSimple
	extends Modelica.Blocks.Icons.Block;
//	extends WaterHub.Icons.Package;
	parameter Integer nbEvents=4;
	output Real y;
	Real events[nbEvents];
	Integer state[2];
  algorithm
	for i in 1:nbEvents loop
	  state := Modelica.Math.Random.Generators.Xorshift64star.initialState(i,0);
	  events[i] := Modelica.Math.Random.Generators.Xorshift64star.random(state)*86400 "Randomly distributed along the simulation time";
	  //this should somehow be related to the simulation parameter StopTime, but I couldn't figure how to call it.
	end for;
  equation
	y = (if WaterHub.BaseClasses.BaseFunctions.checkIfInArray(time, integer(events)) then 1 else 0);
end EventsGeneratorUniformSimple;


block EventsGeneratorUniform
  extends Modelica.Blocks.Icons.Block;
  parameter Integer nbEvents=4;
  Real event(start=0);
  Integer cnter(start=0);
  Integer state[2];
  Boolean changeflg(start=false);
  output Boolean eventsPulse;

equation
  //if (cnter<=nbEvents) then
  when (pre(event)<time) then //when time of the event is reached
    state = Modelica.Math.Random.Generators.Xorshift64star.initialState(integer(time),0);
    if cnter<nbEvents then //if the max number of events is not yet reached
      event = pre(event)+Modelica.Math.Random.Generators.Xorshift64star.random(pre(state))*100; //generates a random event in the future. it is multiplied with multiplying factor to spread events during the day.
    else //status quo, next event happens at +infinity
      event = Modelica.Constants.inf;
    end if;
    changeflg = not pre(changeflg); //change value from false to true or inversely when an event happens
    cnter = pre(cnter)+1; //counter
  end when;
//else
  //  changeflg = pre(changeflg);
  //end if;
  eventsPulse = change(changeflg); //true when changeflg changes its value.
//under construction
end EventsGeneratorUniform;

end EventsFunctions;
