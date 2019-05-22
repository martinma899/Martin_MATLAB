
function [beforeT , afterT] = tippingPoint (subTotal , tax , tipPercent)

    % calculating tip before taxing, with rounding
    beforeT = round ( (subTotal*tipPercent/100) , 2 );
    
    % calculating tip after taxing, with rounding
    afterT = round( (subTotal*(1+tax)*tipPercent/100) , 2 );

end

%{
Function Name: tippingPoint

Inputs: 1. (double) The subtotal cost of a meal before taxes or tips 2.
(double) The sales tax for a meal at a given food establishment, as a
decimal 3. (double) The percent being tipped to the waiter, as a percentage

Outputs: 1. (double) The total tip amount before tax 2. (double) The total
tip amount after tax

Function Description:  You go to dinner with your friends, and in between
eating and discussing quiz bowl, you realize that if you apply the tip for
the waiter before the sales tax is applied, it will be different than if
applied after the sales tax. Using the sales tax and the tip percentage,
write a MATLAB function, tippingPoint, to calculate:

? The total amount you would tip for your meal if you calculated the tip
before applying sales tax.

? The total amount you would tip for your meal if you calculated the tip
after applying sales tax.  Output these values, rounded to the hundredths
(cents) place.
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/22/2015 11:38 PM --%