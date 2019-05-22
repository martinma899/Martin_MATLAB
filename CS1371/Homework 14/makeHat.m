function makeHat


    [xxCap, yyCap, zzCap] = makeCap(5, [-6/5^5 0 0 0 0 6]);
    [xxBill, yyBill, zzBill] = makeBill(5,4.5);
    [xxProp,yyProp,zzProp] = makePropeller(-6,6,1);
    rotationangle = 0;
    while true
        
        rotationangle = rotationangle+pi/10;
        if rotationangle>2*pi
            rotationangle = rotationangle-2*pi;
        end
        [xxPropr,yyPropr,zzPropr] = rotateObject (xxProp,yyProp,zzProp,'z',rotationangle);
        mesh(xxCap, yyCap, zzCap);
        hold on
        mesh(xxBill, yyBill, zzBill);
        mesh(xxPropr, yyPropr, zzPropr,yyPropr);
                axis([-50 50 -50 50 -50 50])
                axis square
        hold off

        pause(0.01);
        
    end
    
end