within WaterHub.Supply;
package WaterSupply

  
  model InfiniteSupply "Infinite Supply of water, basically just one outlet port that delivers whatever flow is needed"
    WaterHub.BaseClasses.WaterPort outlet;
  end InfiniteSupply;


  model EndlessSink "Endless sink"
    WaterHub.BaseClasses.WaterPort inlet;
  end EndlessSink;

end WaterSupply;
