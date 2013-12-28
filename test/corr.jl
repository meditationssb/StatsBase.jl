# Test corr.jl
#
# Many test cases are migrated from test/01.jl in the old version
# The reference results are generated from R. 
#

using Stats
using Base.Test


# random data for testing

x = [-2.133252557240862    -.7445937365828654;
	   .1775816414485478   -.5834801838041446;
	  -.6264517920318317   -.68444205333293;
	  -.8809042583216906    .9071671734302398;
	   .09251017186697393 -1.0404476733379926;
	  -.9271887119115569   -.620728578941385;
	  3.355819743178915    -.8325051361909978;
	  -.2834039258495755   -.22394811874731657;
	   .5354280026977677    .7481337671592626;
	   .39182285417742585   .3085762550821047]

x1 = x[:, 1]
x2 = x[:, 2]

# autocov & autocorr

@test_approx_eq autocov(float64([1:5])) [2.0, 0.8, -0.2, -0.8, -0.8]
@test_approx_eq autocorr(float64([1, 2, 3, 4, 5])) [1.0, 0.4, -0.1, -0.4, -0.4]

racovx1 =  [1.839214242630635709475, 
           -0.406784553146903871124, 
            0.421772254824993531042, 
            0.035874943792884653182,
           -0.255679775928512320604, 
            0.231154400105831353551, 
           -0.787016960267425180753, 
            0.039909287349160660341,
           -0.110149697877911914579, 
           -0.088687020167434751916]

@test_approx_eq autocov(x1) racovx1

racorx1 = [0.999999999999999888978, 
          -0.221173011668873431557,  
           0.229321981664153962122,  
           0.019505581764945757045,
          -0.139015765538446717242, 
           0.125681062460244019618, 
          -0.427909344123907742219,  
           0.021699096507690283225,
          -0.059889541590524189574, 
          -0.048220059475281865091]

@test_approx_eq autocorr(x1) racorx1
