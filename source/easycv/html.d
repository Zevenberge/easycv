module easycv.html;

import std.conv;
import diet.html;
import easycv.cv;

string convertToHtml(Cv cv)
{
    auto output = new Output;
    compileHTMLDietFile!("cv.dt", cv)(output);
    return output.buffer;
}

private class Output
{
    string buffer;
    void put(string s)
    {
        buffer ~= s;
    }

    void put(dchar c)
    {
        buffer ~= c.to!string;
    }
}