function main

global foo;

foo = 5;

helper();
disp(foo)


end

function helper

    global foo;
    foo = foo+3;

end

