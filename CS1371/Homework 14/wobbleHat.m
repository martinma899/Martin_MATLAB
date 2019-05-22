function wobbleHat

    h = 10;
    r = 3;
    that = 0;
    
    tprop = 0;
    
    [xxCap,yyCap,zzCap] = makeCap(5, [-6/5^5 0 0 0 0 6]);
    [xxBill,yyBill,zzBill] = makeBill(5,4.5);
    [xxProp,yyProp,zzProp] = makePropeller(-6,6,1);
    
    while true
        
        if tprop >= 2*pi
            tprop = tprop-2*pi;
        end
        tprop = tprop+pi/4;
        
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxProp,yyProp,zzProp,'z',tprop);
        
        if that >= 2*pi
            that = that-2*pi;
        end
        that = that+pi/5;
        
        x = r*cos(that);
        y = r*sin(that);
        
        ywobbleangle = atan(x/h);
        xwobbleangle = atan(y/h);
        
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCap,yyCap,zzCap,'y',ywobbleangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBill,yyBill,zzBill,'y',ywobbleangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'y',ywobbleangle);
        
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCapG,yyCapG,zzCapG,'x',xwobbleangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBillG,yyBillG,zzBillG,'x',xwobbleangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'x',xwobbleangle);
        
        surf(xxCapG,yyCapG,zzCapG);
        hold on
        surf(xxBillG,yyBillG,zzBillG);
        surf(xxPropG,yyPropG,zzPropG);
        hold off
        
        axis([-60 60 -60 60 -60 60]/60*10);
        axis square;
        
        pause(0.1)
    end

end