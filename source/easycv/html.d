module easycv.html;

import std.conv;
import diet.html;
import easycv.cv;

string convertToHtml(Cv cv, string style)
{
    auto output = new Output;
    auto css = style;
    compileHTMLDietFile!("cv.dt", cv, css)(output);
    return output.buffer;
}

private class Output
{
    string buffer;
    void put(S)(S s)
    {
        buffer ~= s.to!string;
    }
}