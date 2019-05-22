function [] = erase (filename)

    stuff = fopen(filename,'wt');
    fclose(stuff);

end