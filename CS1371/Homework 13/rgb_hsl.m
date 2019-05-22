function theother = rgb_hsl(in,mode)

%% INSTRUCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input1: in
%   M x N x 3 double array 
% Input2: mode
%   A string specifying what mode. If it is 'hsl'/'HSL', then the input
%   will be assumed to be RGB, and the output will be HSL. If it is
%   'rgb'/'RGB', then the input will be assumped to be HSL, and the output will
%   be RGB
%
% Output1: theother
%   M x N x 3 double array with the desired conversion done
%
% Input Formatting:
% If input2 is hsl/HSL (meaning input1 is RGB), then input1 MUST be an array of
% doubles between 0 and 1 (normalized or divided by 255).
% If input2 is rgb/RGB (meaning input1 is HSL), then input1 is a double
% array of any numerical value
% 
% Output Formatting:
% (:,:,1) is either the red layer or the hue
% (:,:,2) is either the green layer or the saturation
% (:,:,3) is either the blue layer or the luminance
%
% If the mode is rgb/RGB, then the output is a double array between 0 and 1
% To convert to RGB values, multiply by 255, THEN round, THEN cast to uint8
% If the mode is hsl/HSL, then the output is a double array that is any
% numerical value.
%
%
% Algorithm provided by
% http://www.niwa.nu/2013/05/math-behind-colorspace-conversions-rgb-hsl/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch mode
    
    case {'hsl','HSL'}
        rednorm = in(:,:,1);
        greennorm = in(:,:,2);
        bluenorm = in(:,:,3);
        % Calculate the luminance values
        [minarr, minlayer] = min(in,[],3);
        [maxarr, maxlayer] = max(in,[],3);
        lumarr = (minarr + maxarr)./2;
        
        % Calculate the saturation values based on the luminance
        satarr = zeros(size(in,1),size(in,2));
        satarr(minarr == maxarr) = 0;
        lessthan = lumarr < 0.5;
        greaterthan = lumarr >= 0.5;
        satarr(lessthan) = (maxarr(lessthan) - minarr(lessthan))./(maxarr(lessthan) + minarr(lessthan));
        satarr(greaterthan) = (maxarr(greaterthan) - minarr(greaterthan))./(2.0 - maxarr(greaterthan) - minarr(greaterthan));
        
        % Generate Hue Array
        huearr = zeros(size(in,1),size(in,2));
        max1 = maxlayer == 1;
        max2 = maxlayer == 2;
        max3 = maxlayer == 3;
        huearr(max1) = (greennorm(max1) - bluenorm(max1))./(maxarr(max1) - minarr(max1));
        huearr(max2) = 2 + (bluenorm(max2) - rednorm(max2))./(maxarr(max2) - minarr(max2));
        huearr(max3) = 4 + (rednorm(max3) - greennorm(max3))./(maxarr(max3) - minarr(max3));
        huearr = huearr.*60;
        huearr(huearr<0) = huearr(huearr<0) + 360;
        
        theother = cat(3,huearr,satarr,lumarr);
    
    case {'rgb','RGB'}
        huearr = in(:,:,1);
        satarr = in(:,:,2);
        lumarr = in(:,:,3);
        lessthan = lumarr < 0.5;
        greaterthan = lumarr >= 0.5;
        rnew = zeros(size(in,1),size(in,2));
        gnew = zeros(size(in,1),size(in,2));
        bnew = zeros(size(in,1),size(in,2));
        rnew(huearr==0 & satarr==0) = lumarr(huearr==0 & satarr==0).*255;
        gnew(huearr==0 & satarr==0) = lumarr(huearr==0 & satarr==0).*255;
        bnew(huearr==0 & satarr==0) = lumarr(huearr==0 & satarr==0).*255;
        
        % Start back-calculating stuff here
        temp1 = zeros(size(in,1),size(in,2));
        temp1(lessthan) = lumarr(lessthan).*(1.0+satarr(lessthan));
        temp1(greaterthan) = lumarr(greaterthan) + satarr(greaterthan) - lumarr(greaterthan).*satarr(greaterthan);
        temp2 = 2.*lumarr - temp1;
        
        huearr = huearr ./ 360;
        
        tempR = huearr + (1/3);
        tempG = huearr;
        tempB = huearr - (1/3);
        
        tempR(tempR>1) = tempR(tempR>1)-1;
        tempR(tempR<0) = tempR(tempR<0)+1;
        tempG(tempG>1) = tempG(tempG>1)-1;
        tempG(tempG<0) = tempG(tempG<0)+1;
        tempB(tempB>1) = tempB(tempB>1)-1;
        tempB(tempB<0) = tempB(tempB<0)+1;
        
        % Only do test 2 if test 1 isn't satisfied, and test 3 if neither test 1 or
        % test 2 is satisfied, hence the combination of masks and ~masks
        
        %Test 1 is if 6*tempR < 1
        test1R = (6.*tempR) < 1;
        test1G = (6.*tempG) < 1;
        test1B = (6.*tempB) < 1;
        rnew(test1R) = temp2(test1R) + (temp1(test1R) - temp2(test1R)).*6.*tempR(test1R);
        gnew(test1G) = temp2(test1G) + (temp1(test1G) - temp2(test1G)).*6.*tempG(test1G);
        bnew(test1B) = temp2(test1B) + (temp1(test1B) - temp2(test1B)).*6.*tempB(test1B);
        
        % Test 2 is if 2*tempR < 1
        test2Ra = (2.*tempR) < 1;
        test2Ga = (2.*tempG) < 1;
        test2Ba = (2.*tempB) < 1;
        test2R = test2Ra & ~test1R;
        test2G = test2Ga & ~test1G;
        test2B = test2Ba & ~test1B;
        rnew(test2R) = temp1(test2R);
        gnew(test2G) = temp1(test2G);
        bnew(test2B) = temp1(test2B);
        
        % Test 3 is 3*tempR < 2
        test3Ra = (3.*tempR) < 2;
        test3Ga = (3.*tempG) < 2;
        test3Ba = (3.*tempB) < 2;
        test3R = test3Ra & ~test2Ra & ~test1R;
        test3G = test3Ga & ~test2Ga & ~test1G;
        test3B = test3Ba & ~test2Ba & ~test1B;
        rnew(test3R) = temp2(test3R) + (temp1(test3R)-temp2(test3R)).*((2/3) - tempR(test3R)).*6;
        gnew(test3G) = temp2(test3G) + (temp1(test3G)-temp2(test3G)).*((2/3) - tempG(test3G)).*6;
        bnew(test3B) = temp2(test3B) + (temp1(test3B)-temp2(test3B)).*((2/3) - tempB(test3B)).*6;
        
        % Test 4 is if none of the previous tests
        test4R = ~test3Ra & ~test2Ra & ~test1R;
        test4G = ~test3Ga & ~test2Ga & ~test1G;
        test4B = ~test3Ba & ~test2Ba & ~test1B;
        rnew(test4R) = temp2(test4R);
        gnew(test4G) = temp2(test4G);
        bnew(test4B) = temp2(test4B);
        
        % Concatenate into MxNx3
        theother = cat(3,rnew,gnew,bnew);
    otherwise
        theother = [];
        error('ERROR, Please enter a valid mode')
end
end
        