module easycv.html;

import std.conv;
import diet.html;
import easycv.cv;

string convertToHtml(Cv cv)
{
    char[] output;
    compileHTMLDietFile!("cv.dt")(cv);
    return output.to!string;
}